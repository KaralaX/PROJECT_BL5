/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Viet
 */
public class Showtime {
    private int id;
    private int movieid;
    private Timestamp starttime;
    private Timestamp endtime;
    private int hallnumber;

    public Showtime(int id, int movieid, Timestamp starttime, Timestamp endtime, int hallnumber) {
        this.id = id;
        this.movieid = movieid;
        this.starttime = starttime;
        this.endtime = endtime;
        this.hallnumber = hallnumber;
    }

    public int getHallnumber() {
        return hallnumber;
    }

    public void setHallnumber(int hallnumber) {
        this.hallnumber = hallnumber;
    }

    public Showtime() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMovieid() {
        return movieid;
    }

    public void setMovieid(int movieid) {
        this.movieid = movieid;
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
    
}
