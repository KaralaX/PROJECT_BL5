/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import model.Order;

/**
 *
 * @author Viet
 */
public class OrderDAO extends MyDAO{
    public Order getOrder(int userid){
        xSql = "SELECT * FROM dbo.[Order] WHERE Status = 0 AND UserID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userid);
            rs=ps.executeQuery();
            if(rs.next())
                return new Order(rs.getInt(1), rs.getInt(2), rs.getDate(3), rs.getBoolean(4));
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }
    public void addOrder(int userid){
        xSql = "INSERT INTO dbo.[Order] VALUES(?, GETDATE(), 0)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, userid);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void confirmOrder(int orderid) {
        xSql = "UPDATE dbo.[Order] SET Status = 1 WHERE OrderID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, orderid);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
}
