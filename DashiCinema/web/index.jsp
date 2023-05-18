<%-- 
    Document   : index
    Created on : Apr 18, 2023, 9:09:00 AM
    Author     : Viet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- For Responsive -->
        <title>Dashi Cinema</title>
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
                    <a href="index.html"><img src="img/logo.png" alt="Red Store"></a>
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

        <div class="smallContainer">
            <div class="text-center">
                <ul class="navbar row">
                    <li class="${active==1?"active":""}"><a href="index?id=1" data-toggle="tab" id="sapchieu" aria-expanded="false">
                            <h1 class="font-30 font-sm-15 font-xs-12">
                                COMING SOON</h1>
                        </a></li>
                    <li class="${active==2?"active":""}"><a href="index?id=2" data-toggle="tab" id="dangchieu" aria-expanded="true">
                            <h1 class="font-30 font-sm-15 font-xs-12">
                                NOW SHOWING</h1>
                        </a></li>
                </ul>
            </div>
        </div>

        <!-- Movie Section -->
        <div class="smallContainer">
            <div class="row">
                <c:forEach var="p" items="${requestScope.movies}">
                    <div class="col-4 movie">
                        <a href="movie?id=${p.movieid}">
                            <img src="${p.imageurl}" alt="">
                            <h4>${p.title}</h4>
                            <p><b>Genre:</b> ${p.genre}</p>
                            <p><b>Running Time: </b>${p.length} minutes</p>
                        </a>
                    </div>
                </c:forEach>
            </div>
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
