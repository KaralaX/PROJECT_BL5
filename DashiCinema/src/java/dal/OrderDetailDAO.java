/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import java.util.ArrayList;
import model.Ord;

/**
 *
 * @author Viet
 */
public class OrderDetailDAO extends MyDAO{
    public void addOrderDetail(int orderID, int ticketid){
        xSql = "INSERT INTO dbo.OrderDetail VALUES(?, ?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, orderID);
            ps.setInt(2, ticketid);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
    public ArrayList<Ord> getOrderDetail(int userid, boolean sort){
        System.out.println(sort);
        ArrayList<Ord> list = new ArrayList<>();
        xSql = "SELECT [Order].OrderID, UserID, OrderDate, Imageurl, Title, StartTime, EndTime, STRING_AGG(CAST(Ticket.SeatID AS VARCHAR) , ', ')AS[Seats], HallNumber, SUM(UnitPrice) AS [Total Price] FROM dbo.[Order] JOIN dbo.OrderDetail ON OrderDetail.OrderID = [Order].OrderID JOIN dbo.Ticket ON Ticket.TicketID = OrderDetail.TicketID JOIN dbo.Showtime ON Showtime.id = Ticket.ShowID JOIN dbo.Movie ON Movie.MovieID = Showtime.MovieID WHERE UserID = ? GROUP BY [Order].OrderID, UserID, OrderDate, Imageurl, Title, StartTime, EndTime, HallNumber";
        if(sort == true){
            xSql += " order by sum(unitprice) asc";
        }
        else 
            xSql += " order by sum(unitprice) desc";
        try {
            System.out.println(userid);
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userid);
            rs = ps.executeQuery();
            while(rs.next()){
                System.out.println("FUCK");
                list.add(new Ord(rs.getInt(1), rs.getInt(2), rs.getTimestamp(3), rs.getString(4), rs.getString(5), rs.getTimestamp(6), rs.getTimestamp(7), rs.getString(8), rs.getInt(9), rs.getDouble(10)));
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public void delete(int id) {
        ArrayList<Integer> list = new ArrayList<>();       
        try {
            xSql = "SELECT Ticket.TicketID FROM dbo.OrderDetail JOIN dbo.Ticket ON Ticket.TicketID = OrderDetail.TicketID WHERE OrderID = ?";  
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(rs.getInt(1));
            }
            xSql = "DELETE FROM dbo.[Order] WHERE OrderID = ?";
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            ps.executeUpdate();
            for (Integer integer : list) {
                xSql = "DELETE FROM dbo.Ticket WHERE TicketID = ?";
                ps = con.prepareStatement(xSql);
                ps.setInt(1, integer);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
}
