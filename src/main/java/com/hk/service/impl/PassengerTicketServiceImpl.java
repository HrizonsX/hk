package com.hk.service.impl;

import com.hk.mapper.FightMapper;
import com.hk.mapper.PassengerMapper;
import com.hk.pojo.Fight;
import com.hk.pojo.Passenger;
import com.hk.service.PassengerTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.sql.Timestamp;

@Service
public class PassengerTicketServiceImpl implements PassengerTicketService {

    @Autowired
    private FightMapper fightMapper = null;
    @Autowired
    private PassengerMapper passengerMapper = null;

    private static final int FAILED = 0;

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public int grapTicketForVersion(String alCode, Timestamp fightDate, String target) {

        Fight fight = fightMapper.getFight(alCode, fightDate);
        int update = 0;
        if("bc".compareTo(target) == 0 && fight.getBcspNumber() > 0){
            update = fightMapper.decreaseBcsqNumber(alCode, fightDate, fight.getBcVersion());
        }
        else if("fc".compareTo(target) == 0 && fight.getFcsqNumber() > 0){
            update = fightMapper.decreaseFcsqNumber(alCode, fightDate, fight.getFcVersion());
        }
        else if(("ec".compareTo(target) == 0 && fight.getEcsqNumber() > 0)){
            update = fightMapper.decreaseEcsqNumber(alCode, fightDate, fight.getEcVersion());
        }

        if(update == 0){
            return FAILED;
        }
        else {
            return FAILED + 1;
        }
    }

    @Override
    @Transactional(isolation = Isolation.READ_COMMITTED, propagation = Propagation.REQUIRED)
    public int addNewPassenger(Passenger passenger) {
        passengerMapper.addPassenger(passenger);
        return 0;
    }
}
