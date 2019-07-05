package com.hk.service.impl;

import com.hk.mapper.*;
import com.hk.pojo.*;
import com.hk.service.BookTicketService;
import com.hk.service.PassengerTicketService;
import com.hk.util.FightsCacheUtil;
import com.hk.util.InsuranceCacheUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service
public class BookTicketServiceImpl implements BookTicketService {

    @Autowired
    private FightsCacheUtil fightsCacheUtil = null;
    @Autowired
    private BookMapper bookMapper = null;
    @Autowired
    private PassengerMapper passengerMapper = null;
    @Autowired
    private BookBillMapper bookBillMapper = null;
    @Autowired
    private FightsMapper fightsMapper = null;
    @Autowired
    private PassengerTicketService passengerTicketService = null;
    @Autowired
    private InsuranceOrderMapper insuranceOrderMapper = null;
    @Autowired
    private InsuranceCacheUtil insuranceCacheUtil = null;

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    //未支付时的临时订单
    public Book createNewBook(BookParams bookParams, PassengerModel passengerModel) {

        Book newBook = new Book();
        ShippingSpace shippingSpace = null;
        BookBill bookBill = null;
        Passenger newPassenger = null;
        List<PassengerParams> passengers = passengerModel.getPassengers();
        newBook.setAlCode(bookParams.getAlCode());
        newBook.setFightDate(bookParams.getFightDate());
        newBook.setShiAlCode(bookParams.getAlCode());
        newBook.setShiFightDate(bookParams.getFightDate());
        newBook.setSsCode(bookParams.getSsCode());
        newBook.setBpCode(bookParams.getBpCode());
        newBook.setBookNumber(bookParams.getBookNumber());
        newBook.setBookTotal(bookParams.getBookTotal());
        //订单状态，0代表未支付，todo：超时取消订单
        newBook.setBookState(0);
        //插入一条订单，主键回填
        bookMapper.addBookDetail(newBook);
        //级联查询
        Book addedbook = bookMapper.getBookByCode(newBook.getBookCode());
        shippingSpace = addedbook.getShippingSpace();
        String target = shippingSpace.getSsName();
        //处理详单
        Long cnt = 1L;
        for(PassengerParams passenger:passengers){

            newPassenger = new Passenger();
            newPassenger.setPassName(passenger.getPassName());
            newPassenger.setPassID(passenger.getPassID());
            newPassenger.setPassPhone(passenger.getPassPhone());
            newPassenger.setPtCode(passenger.getPtCode());
            //备注为空， state为'0'代表未上机
            newPassenger.setPassState(0);
            passengerMapper.addPassenger(newPassenger);

            //直接取票，可能会失败
            int result = passengerTicketService.grapTicketForVersion(newBook.getAlCode(), newBook.getFightDate(), target);
            bookBill = new BookBill();
            bookBill.setBookCode(newBook.getBookCode());
            bookBill.setPassCode(newPassenger.getPassCode());
            bookBill.setBbCode(cnt++);
            bookBill.setBbPrice(passenger.getPassPrice());
            //预定成功或者失败 '0' success
            //2 抢票失败
            //1 支付完成
            if(result == 0){
                bookBill.setBbState(2);
            }
            else{
                bookBill.setBbState(0);
            }
            bookBillMapper.addBookBill(bookBill);

        }
        //回写修改的航班到redis里
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Fights changedFights = fightsMapper.getSingleFights(bookParams.getAlCode(), bookParams.getFightDate());
        String key = format.format(new Date(changedFights.getFightDate().getTime()))+ '-' + changedFights.getDcityName() + '-' + changedFights.getTcityName();
        fightsCacheUtil.cacheSingleFights(key, changedFights);
        return newBook;

    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public int buyTicketInsurance(List<InsuranceOrder> insuranceOrders) {
        for(InsuranceOrder io:insuranceOrders){
            //保险未生效，支付完后才生效
            if(io.getInsuranceCode().compareTo("0") != 0) {
                io.setInsuranceState(0);
                insuranceOrderMapper.addInsuranceOrder(io);
            }
        }
        return 0;
    }

    @Override
    public List<Insurance> getInsurancesInfo() {
        Map<String, Insurance> map = insuranceCacheUtil.isInsurancesCacheExist();
        if(map.size() == 0){
            insuranceCacheUtil.initInsurancesCache();
            map = insuranceCacheUtil.isInsurancesCacheExist();
        }
        return new ArrayList<Insurance>(map.values());
    }
}
