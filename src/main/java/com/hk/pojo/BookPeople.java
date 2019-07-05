package com.hk.pojo;

import java.io.Serializable;

public class BookPeople implements Serializable {
    private static final long serialVersionUID = -3691137970230247457L;
    //用户编号
    private String bpCode;
    //用户密码
    private String bpPassword;
    //订票人姓名
    private String bpName;
    //订票人联系电话
    private String bpPhone;
    //订票人电子邮箱
    private String bpEmail;

    public String getBpCode() {
        return bpCode;
    }

    public void setBpCode(String bpCode) {
        this.bpCode = bpCode;
    }

    public String getBpPassword() {
        return bpPassword;
    }

    public void setBpPassword(String bpPassword) {
        this.bpPassword = bpPassword;
    }

    public String getBpName() {
        return bpName;
    }

    public void setBpName(String bpName) {
        this.bpName = bpName;
    }

    public String getBpPhone() {
        return bpPhone;
    }

    public void setBpPhone(String bpPhone) {
        this.bpPhone = bpPhone;
    }

    public String getBpEmail() {
        return bpEmail;
    }

    public void setBpEmail(String bpEmail) {
        this.bpEmail = bpEmail;
    }
}
