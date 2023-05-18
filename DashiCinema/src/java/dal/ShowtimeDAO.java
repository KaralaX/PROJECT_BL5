/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.Arrays;
import model.Showtime;

/**
 *
 * @author Viet
 */
public class ShowtimeDAO extends MyDAO{
    public ArrayList<Showtime> getByMovieID(int id){
        ArrayList<Showtime> list = new ArrayList<>();
        xSql = "SELECT * FROM dbo.Showtime WHERE MovieID = ? and starttime > getdate()";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Showtime(rs.getInt(1), rs.getInt(2), rs.getTimestamp(3),  rs.getTimestamp(4), rs.getInt(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public Showtime getByShowID(int id){
        xSql = "SELECT * FROM dbo.Showtime WHERE id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if(rs.next()){
                return new Showtime(rs.getInt(1), rs.getInt(2), rs.getTimestamp(3),  rs.getTimestamp(4), rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public int getSeats(int id){
        xSql = "SELECT count(Ticket.SeatID) FROM dbo.Ticket RIGHT JOIN dbo.SeatInfo ON SeatInfo.SeatID = Ticket.SeatID WHERE ShowID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if(rs.next())
                return rs.getInt(1);
        } catch (Exception e) {
            System.err.println(e);
        }
        return 0;
    }

    public boolean[] getSeat(int id) {
        boolean seat[] = new boolean[40];
        Arrays.fill(seat, false);
        xSql = "SELECT Ticket.SeatID FROM dbo.Ticket RIGHT JOIN dbo.SeatInfo ON SeatInfo.SeatID = Ticket.SeatID WHERE ShowID = ?";
        try {
            System.out.println(id);
            ps = con.prepareStatement(xSql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                seat[rs.getInt(1)-1] = true;
            }
                
        } catch (Exception e) {
            System.err.println(e);
        }
        return seat;
    }
}
