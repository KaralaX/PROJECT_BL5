/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author Viet
 */
public class Ord {
    private int orderid, userid;
    private Timestamp orderdate;
    private String imageurl, title;
    private Timestamp starttime, endtime;
    private String seats;
    private int hallnumber;
    private Double price;

    public Ord(int orderid, int userid, Timestamp orderdate, String imageurl, String title, Timestamp starttime, Timestamp endtime, String seats, int hallnumber, Double price) {
        this.orderid = orderid;
        this.userid = userid;
        this.orderdate = orderdate;
        this.imageurl = imageurl;
        this.title = title;
        this.starttime = starttime;
        this.endtime = endtime;
        this.seats = seats;
        this.hallnumber = hallnumber;
        this.price = price;
    }

    public Ord() {
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public Timestamp getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Timestamp orderdate) {
        this.orderdate = orderdate;
    }

    public String getImageurl() {
        return imageurl;
    }

    public void setImageurl(String imageurl) {
        this.imageurl = imageurl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Timestamp getStarttime() {
        return starttime;
    }

    public void setStarttime(Timestamp starttime) {
        this.starttime = starttime;
    }

    public Timestamp getEndtime() {
        return endtime;
    }

    public void setEndtime(Timestamp endtime) {
        this.endtime = endtime;
    }

    public String getSeats() {
        return seats;
    }

    public void setSeats(String seats) {
        this.seats = seats;
    }

    public int getHallnumber() {
        return hallnumber;
    }

    public void setHallnumber(int hallnumber) {
        this.hallnumber = hallnumber;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    
    
    
    
}
