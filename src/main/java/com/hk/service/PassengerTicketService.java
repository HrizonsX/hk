package com.hk.service;

import com.hk.pojo.Passenger;

import java.sql.Date;
import java.sql.Timestamp;

public interface PassengerTicketService {
    public int grapTicketForVersion(String alCode, Timestamp fightDate, String target);
    public int addNewPassenger(Passenger passenger);
}
