/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.MovieDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import dal.ShowtimeDAO;
import dal.TicketDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Movie;
import model.Order;
import model.OrderDetail;
import model.Showtime;
import model.User;

/**
 *
 * @author Viet
 */
@WebServlet(name="BookingServlet", urlPatterns={"/book"})
public class BookingServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ShowtimeDAO sd = new ShowtimeDAO();
        MovieDAO md = new MovieDAO();
        String id = request.getParameter("id");
        System.out.println(id);
        String seat[] = request.getParameterValues("seat");
        Showtime showtime = sd.getByShowID(Integer.parseInt(id));
        Movie movie = md.getMovieByID(showtime.getMovieid());
        boolean list[] = sd.getSeat(Integer.parseInt(id));
        if(seat != null){
            TicketDAO td = new TicketDAO();
            OrderDAO od = new OrderDAO();
            UserDAO ud = new UserDAO();
            OrderDetailDAO ord = new OrderDetailDAO();
            
            HttpSession session = request.getSession();
            User u = ud.findByUserName((String) session.getAttribute("username"));
            od.addOrder(u.getUserid());
            Order order = od.getOrder(u.getUserid());
            for (String seatID : seat) {
                td.addTicket(Integer.parseInt(seatID), showtime.getId());
                ord.addOrderDetail(order.getOrderid(), td.getTicket(Integer.parseInt(seatID), showtime.getId()).getTicketid());
            }
            od.confirmOrder(order.getOrderid());
            request.getRequestDispatcher("ticket").forward(request, response);
        }
        else{
            request.setAttribute("id", id);
            request.setAttribute("movie", movie);
            request.setAttribute("seat", list);
            request.setAttribute("show", showtime);
            request.getRequestDispatcher("book.jsp").forward(request, response);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
