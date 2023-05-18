/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Viet
 */
public class SeatInfo {
    private int id;
    private int seatnumber;
    private int hallnumber;

    public SeatInfo(int id, int seatnumber, int hallnumber) {
        this.id = id;
        this.seatnumber = seatnumber;
        this.hallnumber = hallnumber;
    }

    public SeatInfo() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSeatnumber() {
        return seatnumber;
    }

    public void setSeatnumber(int seatnumber) {
        this.seatnumber = seatnumber;
    }

    public int getHallnumber() {
        return hallnumber;
    }

    public void setHallnumber(int hallnumber) {
        this.hallnumber = hallnumber;
    }
    
}
