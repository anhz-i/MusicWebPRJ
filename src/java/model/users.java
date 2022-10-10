/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Mai
 */
public class users {

    private String userName, fname, lname;
    private boolean gender;
    private String email, phone, address, imgUrl, pass;
    private byte role;
    private boolean active;

    public users() {
    }

    public users(String userName, String fname, String lname, boolean gender, String email, String phone, String address, String imgUrl, String pass, byte role, boolean active) {
        this.userName = userName;
        this.fname = fname;
        this.lname = lname;
        this.gender = gender;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.imgUrl = imgUrl;
        this.pass = pass;
        this.role = role;
        this.active = active;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public byte getRole() {
        return role;
    }

    public void setRole(byte role) {
        this.role = role;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    @Override
    public String toString() {
        return "users{" + "userName=" + userName + ", fname=" + fname + ", lname=" + lname + ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", address=" + address + ", imgUrl=" + imgUrl + ", pass=" + pass + ", role=" + role + ", active=" + active + '}';
    }

}
