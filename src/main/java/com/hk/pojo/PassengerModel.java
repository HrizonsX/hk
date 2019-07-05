package com.hk.pojo;

import java.util.List;

public class PassengerModel {
    private List<PassengerParams> passengers;

    public PassengerModel(){
        super();
    }

    public PassengerModel(List<PassengerParams> passengers) {
        this.passengers = passengers;
    }

    public List<PassengerParams> getPassengers() {
        return passengers;
    }

    public void setPassengers(List<PassengerParams> passengers) {
        this.passengers = passengers;
    }
}
