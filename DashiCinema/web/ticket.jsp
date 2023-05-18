<%-- 
    Document   : ticket
    Created on : Apr 23, 2023, 10:27:12 PM
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
        <title>My Ticket</title>
        <link rel="icon" href="img/logo.png">  <!-- To make icon in browser tab -->
        <link rel="stylesheet" href="css/all.css">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/mystyle.css">
        <script>
            function sort(){
                var form = document.getElementById('form');
                var input = document.getElementById('sort');
                if(input.value == "1")
                   input.setAttribute('value', '0');
                else if(input.value == "0")
                   input.setAttribute('value', '1');
                form.submit();
            }
        </script>
        <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap"> -->
    </head>
    <body>
        <c:set var="now" value="<%= new java.util.Date() %>" />
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

        <!-- cart item details -->
        <div class="smallContainer order-page">
            <table class="cart">
                <tr>
                    <th>Order ID</th>
                    <th>Order Date</th>
                    <th>Movie</th>
                    <th>Seats</th>
                    <th>Hall Number</th>
                    <th onclick="sort()"> Total Price</th>
                    <th>Option</th>
                </tr>
                <c:forEach var="item" items="${data}">
                    <tr>
                        <td>${item.orderid}</td>
                        <td><fmt:formatDate value="${item.orderdate}" pattern="dd/MM/yyyy" /></td>
                        <td>
                            <div class="cart-info">
                                <img src="${item.imageurl}" alt="alt" />
                                <div>
                                    <p>${item.title}</p>
                                    <p><fmt:formatDate value="${item.starttime}" pattern="HH:mm"/></p>
                                </div>  
                            </div>
                        </td>
                        <td>${item.seats}</td>
                        <td>${item.hallnumber}</td>
                        <td>${item.price}</td>
                        <td>
                            <c:if test="${item.starttime > now}">
                                <form action="delete?id=${item.orderid}" method="post">
                                    <input type="submit" value="Cancel Ticket">
                                </form>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <form action="ticket" method="post" id="form">
                <input type="hidden" name="sort" value="${Sid}" id="sort">
            </form>
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
