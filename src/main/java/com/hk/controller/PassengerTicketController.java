package com.hk.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hk.pojo.*;
import com.hk.service.BookTicketService;
import com.hk.service.LoginService;
import com.hk.service.RegisterService;
import com.hk.service.SearchTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/passengerTicket")
public class PassengerTicketController {

    @Autowired
    private BookTicketService bookTicketService = null;
    @Autowired
    private SearchTicketService searchTicketService = null;
    @Autowired
    private RegisterService registerService = null;
    @Autowired
    private LoginService loginService = null;

    //不好的list传参
    @RequestMapping(value = "/bookTicket", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView bookTicket(BookParams bookParams, PassengerModel passengerModel){
        ModelAndView mv = new ModelAndView();
        Book newBook = bookTicketService.createNewBook(bookParams, passengerModel);
        mv.addObject("newBook", newBook);
        //TODO: 在这里添加响应的页面
        mv.setViewName("");
        return mv;
        //http://localhost:8080/passengerTicket/bookTicket.do?alCode=xb&fightDate=2019-1-1&ssCode=1&couponCode=1&bpCode=1&bookNumber=2&bookTotal=6700.0
    }

    @RequestMapping(value = "/searchTicket", method = {RequestMethod.GET, RequestMethod.POST})
    //根据时间、出发地和目的地组合查询所有航班
    public ModelAndView searchTicket(SearchParams searchParams){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date d = null;
        try {
            d = format.parse(searchParams.getFightDate());
        } catch (Exception e) {
            e.printStackTrace();
        }
        java.sql.Date date = new java.sql.Date(d.getTime());
        List<Fights> fights = searchTicketService.getFightsByDateAndDT(date, searchParams.getDcityName()
                , searchParams.getTcityName());
        ModelAndView mv = new ModelAndView();
//        System.out.println(fights);
        String jsonFights = JSON.toJSON(fights).toString();
//        System.out.println(jsonFights);
        mv.addObject("jsonFights", jsonFights);
        mv.setViewName("searchBack");
        return mv;
    }

    //json传参，订票
    @RequestMapping(value = "/bookTicket2", method ={RequestMethod.POST})
        public ModelAndView submitUserList_4(@RequestBody BookParams bookParams) {
        ModelAndView mv = new ModelAndView();
        System.out.println(bookParams);
        PassengerModel passengerModel = new PassengerModel(bookParams.getPassengerParams());
        System.out.println(passengerModel.getPassengers().get(0));
        Book newBook = bookTicketService.createNewBook(bookParams, passengerModel);
        mv.addObject("newBook", newBook);
        //TODO: 在这里添加响应的页面
        mv.setViewName("");
        return mv;
    }

    //第二种查询的方式，根据飞行时间和航班编号查询
    @RequestMapping(value = "/searchTicket2", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView searchAlInfo(String fightDate, String alCode){
        ModelAndView mv = new ModelAndView();
        java.sql.Date fightTime = java.sql.Date.valueOf(fightDate);
        List<Fights> fights = searchTicketService.getFightsByDateAndAlCode(fightTime, alCode);
        System.out.println(fights);
        String jsonFights = JSON.toJSON(fights).toString();
        System.out.println(jsonFights);
        mv.addObject("jsonFights", jsonFights);
        mv.setViewName("searchBack");
        return mv;
    }

    //注册新用户
    @RequestMapping(value = "/registerUser", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView registerUser(BookPeople bookPeople){
        ModelAndView mv = new ModelAndView();
        registerService.registerNewUser(bookPeople);
        mv.setViewName("");
        return mv;
    }

    //登陆验证
    @RequestMapping(value = "loginUser", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView loginUser(String bpCode, String bpPassword){
        ModelAndView mv = new ModelAndView();
        int checkResult = loginService.checkLoginUser(bpCode, bpPassword);
        if(checkResult != 0){
            //登陆成功，跳转到首页面
            mv.setViewName("");
        }
        else{
            //登陆失败跳转别的页面
            mv.setViewName("");
        }
        return mv;
    }

    //注册界面验证用户名是否重复
    @RequestMapping(value = "/registerUser1", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String registerUser1(@RequestBody String bpCode){
        bpCode = bpCode.replace("\"", "");
        int searchResult = registerService.checkBpCode(bpCode);
        if(searchResult != 0){
            return "no";
        }
        else{
            return "yes";
        }
    }

    //买保险服务，提交保险订单
    @RequestMapping(value = "/buyInsurance", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String buyInsurance(@RequestBody InsuranceParams insuranceParams){
//        System.out.println(insuranceParams.getInsuranceOrders().get(0));
//        System.out.println(insuranceParams.getInsuranceOrders().get(1));
//        int result =
        bookTicketService.buyTicketInsurance(insuranceParams.getInsuranceOrders());
        List<Insurance> list = bookTicketService.getInsurancesInfo();
        System.out.println(list.get(0));
        System.out.println(list.get(1));
//        System.out.println(list.get(2));
        return "./search.jsp";
    }

    @RequestMapping(value = "/getCities", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String getCities(){
        List<City> citiesList = searchTicketService.getAllCities();
        System.out.println(citiesList.get(0));
        System.out.println(citiesList.size());
        String citiesJson = JSON.toJSON(citiesList).toString();
        System.out.println(citiesJson);
        return citiesJson;
    }



}
