<%-- 
    Document   : book
    Created on : Apr 23, 2023, 2:05:43 PM
    Author     : Viet
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="css/style.css">
        <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;800&display=swap"> -->
        <script>
            function selected(id) {
                var seat = document.getElementById(id);
                var form = document.getElementById('form');//retrieve the form as a DOM element
                var count = document.getElementById('count');
                var total = document.getElementById('total');
                var xcount;
                var xtotal;
                if (typeof count === 'undefined') {
                    xcount = 0;
                } else {
                    xcount = parseInt(count.textContent);
                }

                if (typeof total === 'undefined') {
                    xtotal = 0;
                } else {
                    xtotal = parseInt(total.textContent);
                }

                if (seat.classList.toggle("selected")) {
                    xcount++;
                    xtotal += 75000;
                    var input = document.createElement('input');//prepare a new input DOM element
                    input.setAttribute('name', 'seat');//set the param name
                    input.setAttribute('value', id);//set the value
                    input.setAttribute('type', 'hidden');//set the type, like "hidden" or other
                    input.setAttribute('id', 's' + id);
                    form.appendChild(input);//append the input to the form
                } else {
                    xtotal -= 75000;
                    xcount--;
                    document.getElementById('s'+id).remove();
                }
                count.textContent = xcount;
                total.textContent = xtotal;
            }
        </script>
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

        <div class="container booking-page">
            <div class="row">

                <div class="col-3 movie-container">
                    <ul class="showcase">
                        <li>
                            <div class="seat"></div>
                            <small>Available</small>
                        </li>
                        <li>
                            <div class="seat selected"></div>
                            <small>Selected</small>
                        </li>
                        <li>
                            <div class="seat sold"></div>
                            <small>Sold</small>
                        </li>
                    </ul>
                    <div class="screen"></div>
                    <div class="row">
                        <c:forEach items="${seat}" var="i" varStatus="loop">
                            <c:if test="${i!=true}">
                                <div class="seat ${i==true?"sold":""}" onclick="selected('${loop.index+1}')" id="${loop.index+1}">
                                    ${loop.index+1}
                                </div>
                            </c:if>
                            <c:if test="${i==true}">
                                <div class="seat ${i==true?"sold":""}">
                                    ${loop.index+1}
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>

                <div class="col-2">
                    <div class="row">
                        <div class="col-4 book-img">
                            <img src="${movie.imageurl}" alt="alt" width="100%"/> 
                        </div>
                        <div class="col-2">
                            <h3>${movie.title}</h3>
                        </div>
                    </div>

                    <table>
                        <tr>
                            <td>Genre:</td>
                            <td><p>${movie.genre}</p></td>
                        </tr>
                        <tr>
                            <td>Length:</td>
                            <td><p>${movie.length} minutes</p></td>
                        </tr>
                        <tr>
                            <td>Hall Number:</td>
                            <td><p>${show.hallnumber} </p></td>
                        </tr>
                        <tr>
                            <td>Show Date:</td>
                            <td><p><fmt:formatDate value="${show.starttime}" pattern="dd/MM/yyyy"/></p></td>
                        </tr>
                        <tr>
                            <td>Show Time:</td>
                            <td><p><fmt:formatDate value="${show.starttime}" pattern="HH:mm"/></p></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <form action="book?id=${id}" method="post" id="form">
            <center>
                Total Seat: <p id="count" >0</p><br>
                Total Price: <p id="total" >0</p><br>
                <input class="submit-button"  value="BOOK" type="submit">
            </center>
        </form>



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
                        <img src="img/logo-white.png" alt="">
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
        <script src="js/script.js"></script>
    </body>
</html>
