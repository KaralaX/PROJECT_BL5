/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import model.Ticket;

/**
 *
 * @author Viet
 */
public class TicketDAO extends MyDAO{
    public void addTicket(int seatid, int showid){
        xSql = "INSERT INTO dbo.Ticket values(?, ?, 75000)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, seatid);
            ps.setInt(2, showid);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
    public Ticket getTicket(int seatid, int showid){
        xSql = "SELECT * FROM dbo.Ticket WHERE SeatID = ? AND ShowID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, seatid);
            ps.setInt(2, showid);
            rs=ps.executeQuery();
            if(rs.next())
                return new Ticket(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getDouble(4));
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }
}
