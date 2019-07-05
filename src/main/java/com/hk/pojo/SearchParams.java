package com.hk.pojo;

import java.sql.Date;
import java.sql.Timestamp;

public class SearchParams {
    //出发地
    private String dcityName;
    //目的地
    private String tcityName;
    //航班日期
    private String fightDate;

    public String getDcityName() {
        return dcityName;
    }

    public void setDcityName(String dcityName) {
        this.dcityName = dcityName;
    }

    public String getTcityName() {
        return tcityName;
    }

    public void setTcityName(String tcityName) {
        this.tcityName = tcityName;
    }

    public String getFightDate() {
        return fightDate;
    }

    public void setFightDate(String fightDate) {
        this.fightDate = fightDate;
    }
}
