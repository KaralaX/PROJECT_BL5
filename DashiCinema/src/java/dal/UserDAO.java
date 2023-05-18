/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.SQLException;
import model.User;

/**
 *
 * @author Viet
 */
public class UserDAO extends MyDAO{
    public User findByUserName(String x){
        xSql = "select * from [USER] where username = '"+x+"'";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            if(rs.next())
                return new User(rs.getInt("userid"), rs.getString("username"), rs.getString("email"), rs.getString("password"));
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }
    public void createUser(String username, String password){
        xSql = "insert into [USER] (username, password) values(?, ?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.execute();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }
}
