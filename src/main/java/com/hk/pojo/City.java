package com.hk.pojo;

public class City {
    private String cityCode;
    private String citCityCode;
    private String cityName;

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getCitCityCode() {
        return citCityCode;
    }

    public void setCitCityCode(String citCityCode) {
        this.citCityCode = citCityCode;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    @Override
    public String toString() {
        return "City{" +
                "cityCode='" + cityCode + '\'' +
                ", citCityCode='" + citCityCode + '\'' +
                ", cityName='" + cityName + '\'' +
                '}';
    }
}
