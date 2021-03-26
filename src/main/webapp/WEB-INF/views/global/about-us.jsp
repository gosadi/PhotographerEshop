<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Landscapes</title>
        <link rel="stylesheet" href="/CSS/style.css">
    </head>

    <body>
        <div class="wrapper">
            <div class="navbar">
                <div class="logo">
                    <img src="/Images/logo2.png" width="125px">
                </div>
                <nav>
                    <ul>
                        <sec:authorize access="hasRole('ADMIN')">
                            <li><a href="${pageContext.request.contextPath}/admin" class="btn"><sec:authentication property="principal.username"/></a></li>
                            </sec:authorize>
                        <li><a href="${pageContext.request.contextPath}/" class="btn">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/products" class="btn">Products</a></li>
                            <sec:authorize access="!hasAnyRole('ADMIN','USER')">
                            <li><a href="${pageContext.request.contextPath}/register" class="btn">Register/Sign In</a></li>
                            </sec:authorize>
                        <li><a href="${pageContext.request.contextPath}/aboutus" class="btn">About Us</a></li>
                            <sec:authorize access="hasAnyRole('ADMIN','USER')">
                            <li><a href="${pageContext.request.contextPath}/logout" class="btn">Logout</a></li>
                            </sec:authorize>
                            <sec:authorize access="!hasRole('ADMIN') && isAuthenticated()">
                            <li><a href="cart.html" class="btn cart"><img src="/Images/cart.png" alt="cart" class="cart"></a></li>
                                </sec:authorize>
                    </ul>
                </nav>
            </div>
            <div class="categories">
                <div class="wrapper2">
                    <h1 id="prodtitle">About Us</h1>
                    <h2 style="text-align:center">Our Team</h2>
                    <div class="row">
                        <div class="columnAboutUs">
                            <div class="card">
                                <img src="/images/pexels-andrea-piacquadio-3772510.jpg" alt="Jane" style="width:100%">
                                <div class="container">
                                    <h2>Makis Liougas</h2>
                                    <p class="title">CEO & Founder & G I Jo</p>
                                    <p>I Love Dance and Love.</p>
                                    <p>jane@example.com</p>
                                    <p><button class="button">Contact</button></p>
                                </div>
                            </div>
                        </div>

                        <div class="columnAboutUs">
                            <div class="card">
                                <img src="/images/pexels-gabriela-cheloni-5990776.jpg" alt="Mike" style="width:100%">
                                <div class="container">
                                    <h2>Takis Tanalias</h2>
                                    <p class="title">Art Director, Model & Instagramer</p>
                                    <p>I love my body</p>
                                    <p>mike@example.com</p>
                                    <p><button class="button">Contact</button></p>
                                </div>
                            </div>
                        </div>

                        <div class="columnAboutUs">
                            <div class="card">
                                <img src="/images/pexels-hüsamettin-akgün-3779853.jpg" alt="John" style="width:100%">
                                <div class="container">
                                    <h2>Babis Sougias</h2>
                                    <p class="title">Designer, Organizer & VGA Coordinator</p>
                                    <p>I am sensitive and fragile</p>
                                    <p>john@example.com</p>
                                    <p><button class="button">Contact</button></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <div class="wrapper">
                    <div class="row">
                        <div id="pp" class="col-2">
                            <h3>Contact Info</h3>
                            <p>Address: Ipeirou 5, 17237 Daphne</p>
                            <p>Telephone: 213 807865</p>
                            <p>E-mail: photografos@gmail.com</p>
                            <p>Business Hours: 0900 - 1700, Monday to Friday</p>
                        </div>
                        <div id="pp" class="col-2">
                            <h3>Follow us</h3>
                            <ul>
                                <li><a href="#" class=""><img src="/Images/facebook.png" alt="Facebook"></a></li>
                                <li><a href="#" class=""><img src="/Images/twitter.png" alt="Twitter"></a></li>
                                <li><a href="#" class=""><img src="/Images/instagram.png" alt="Instagram"></a></li>
                                <li><a href="#" class=""><img src="/Images/youtube.png" alt="Youtube"></a></li>
                            </ul>
                        </div>
                        <div id="pp" class="col-2" id="iframe">
                            <h3>Directions</h3>
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3145.941054270136!2d23.73827821565579!3d37.95516230953271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14a1bd74bbb87737%3A0x67cc69af825c4e17!2zzpfPgM61zq_Pgc6_z4UgNSwgzpTOrM-Gzr3OtyDOkc-Ez4TOuc66zq7PgiAxNzIgMzc!5e0!3m2!1sel!2sgr!4v1615095404442!5m2!1sel!2sgr"
                                width="300" height="200" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                        </div>
                    </div>
                </div>
                <div class="copyright">
                    <p>Copyright&copy; 2021</p>
                </div>
            </div>
            <div class="chat" ><button class="chatButton"><a href="${pageContext.request.contextPath}/chat" class=""><h2>Live chat</h2></a></button></div>
        </div>
        <script src="/JS/2.js"></script>
    </body>

</html>