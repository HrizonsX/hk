package com.hk.service;

import com.hk.pojo.City;
import com.hk.pojo.Fights;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

public interface SearchTicketService {
    public List<Fights> getFightsByDateAndDT(Date fightDate, String dcityName, String tcityName);
    public List<Fights> getFightsByDateAndAlCode(Date fightDate, String alCode);
    public int checkAlCode(String alCode);
    public List<City> getAllCities();
}
