<%-- 
    Document   : product
    Created on : Apr 20, 2023, 11:48:49 AM
    Author     : Viet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- For Responsive -->
        <title>${movie.title}</title>
        <link rel="icon" href="img/logo.png">  <!-- To make icon in browser tab -->
        <link rel="stylesheet" href="css/all.css">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/mystyle.css">
        <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap"> -->
    </head>
    <body>
        <!-- Navbar & Header Section -->
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <a href="index"><img src="img/logo.png" alt="Red Store"></a>
                </div>
                <nav>
                    <ul id="menuItems">
                        <li><a href="index">Home</a></li>
                        <li><a href="">About</a></li>
                        <li><a href="">Contact</a></li>
                            <c:if test="${username != null}">
                            <li><a href="ticket">My Ticket</a></li>
                            <li><a href="logout">Logout</a></li>
                            </c:if>
                            <c:if test="${username == null}">
                            <li><a href="login">Log In</a></li>
                            <li><a href="register">Sign Up</a></li>
                            </c:if>
                    </ul>
                </nav>

                <img src="img/menu.png" class="menuicon" alt="Menu icon" onclick="menuToggle();">
            </div>
        </div>

        <!-- single product detail --> 
        <div class="smallContainer single-product">
            <div class="row">
                <div class="col-2">
                    <img src="${movie.imageurl}" alt="alt" width="100%"/> 
                </div>
                <div class="col-2">
                    <h4>${movie.title}</h4>
                    <p>${status}</p>
                    <h4>
                        Sypnosis <i class="fa fa-indent"></i>
                    </h4>
                    <p>${movie.sypnosis}</p>
                    <table>
                        <tr>
                            <td><b>Release Date:</b></td>
                            <td><p><fmt:formatDate value="${movie.releasedate}" pattern="dd/MM/yyyy" /></p></td>
                        </tr>
                        <tr>
                            <td><b>Genre:</b></td>
                            <td><p>${movie.genre}</p></td>
                        </tr>
                        <tr>
                            <td><b>Length:</b></td>
                            <td><p>${movie.length} minutes</p></td>
                        </tr>
                        <tr>
                            <td><b>Director:</b></td>
                            <td><p>${movie.director}</p></td>
                        </tr>
                        <tr>
                            <td><b>Actor:</b></td>
                            <td><p>${movie.actor}</p></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
                            

        <div class="smallContainer order-page">
            <table class="cart">
                <tr>
                    <th>Show Date</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Hall Number</th>
                    <th>Seats</th>
                    <th></th>
                </tr>

                <c:forEach var="i" items="${showlist}">
                    <tr>
                        <td><fmt:formatDate value="${i.starttime}" pattern="dd/MM/yyyy" /></td>
                        <td><fmt:formatDate value="${i.starttime}" pattern="HH:mm"/></td>
                        <td><fmt:formatDate value="${i.endtime}" pattern="HH:mm"/></td>
                        <td>${i.hallnumber}</td>
                        <td>${40-list[i]} vacant seats</td>
                        <td>
                            <form action="book?id=${i.id}" method="post">
                                <input type="submit" value="BOOK">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>


        <!-- Footer Section -->

        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col-1">
                        <h3>Download Our App</h3>
                        <p>Download App for Android and ios mobile phone</p>
                        <div class="app-logo">
                            <img src="img/play-store.png">
                            <img src="img/app-store.png">
                        </div>
                    </div>
                    <div class="footer-col-2">
                        <img src="img/logo.png" alt="">
                    </div>
                    <div class="footer-col-3">
                        <h3>Useful Links</h3>
                        <ul>
                            <li><a href="">Coupons</a></li>
                            <li><a href="">Blog Post</a></li>
                            <li><a href="">Return Policy</a></li>
                            <li><a href="">Join Affiliate</a></li>
                        </ul>
                    </div>
                    <div class="footer-col-4">
                        <h3>Follow Us</h3>
                        <ul>
                            <li><a href="">Facebook</a></li>
                            <li><a href="">Linked In</a></li>
                            <li><a href="">Instagram</a></li>
                            <li><a href="">YouTube</a></li>
                        </ul>
                    </div>
                </div>
                <hr>
                <p class="copyright">Copyright &copy; 2023 - Karala</p>
            </div>
        </div>
        <script src="js/all.js"></script>
        <script src="js/jquery-3.5.1.min.js"></script>
        <script src="js/myscript.js"></script>
    </body>
</html>
