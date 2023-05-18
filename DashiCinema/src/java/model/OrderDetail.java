/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Viet
 */
public class OrderDetail {
    private int orderid;
    private int ticketid;

    public OrderDetail(int orderid, int ticketid) {
        this.orderid = orderid;
        this.ticketid = ticketid;
    }

    public OrderDetail() {
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getTicketid() {
        return ticketid;
    }

    public void setTicketid(int ticketid) {
        this.ticketid = ticketid;
    }
    
}
