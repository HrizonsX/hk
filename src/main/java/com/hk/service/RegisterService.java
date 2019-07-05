package com.hk.service;

import com.hk.pojo.BookPeople;

public interface RegisterService {
    public int registerNewUser(BookPeople bookPeople);
    public int checkBpCode(String bpCode);
}
