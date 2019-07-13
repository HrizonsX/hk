package com.hk.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

public class FightParams {
    private String alCode;
//    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",  timezone="GMT+8")
    private Timestamp fightDate;

    public String getAlCode() {
        return alCode;
    }

    public void setAlCode(String alCode) {
        this.alCode = alCode;
    }

    public Timestamp getFightDate() {
        return fightDate;
    }

    public void setFightDate(Timestamp fightDate) {
        this.fightDate = fightDate;
    }

    @Override
    public String toString() {
        return "FightParams{" +
                "alCode='" + alCode + '\'' +
                ", fightDate=" + fightDate +
                '}';
    }
}
