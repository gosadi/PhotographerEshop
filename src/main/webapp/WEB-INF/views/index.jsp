<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <link rel="stylesheet" href="CSS/style.css">
    </head>
    <body>
        <div class="wrapper">
            <div class="navbar">
                <div class="logo">
                    <img src="Images/logo2.png" width="125px">
                </div>
                <nav>
                    <ul>
                        <li><a href="index.html" class="btn">Home</a></li>
                        <li><a href="products.html" class="btn">Products</a></li>
                        <li><a href="${pageContext.request.contextPath}/loginPage" class="btn">Register/Sign In</a></li>
                        <li><a href="cart.html" class="btn cart"><img src="Images/cart.png" alt="" class="cart"></a></li>
                    </ul>
                </nav>
            </div>
            <div class="row">
                <div class="col-2">
                    <h1>Get breathtaking <br>acclaimed Photographs!</h1>
                    <p>High quality photographs by highly esteemed professional photographers. </p>
                </div>
                <div class="col-2">
                    <div class="slidershow">
                        <div class="slides">
                            <input type="radio" name="r" id="r1" checked>
                            <input type="radio" name="r" id="r2">
                            <input type="radio" name="r" id="r3">
                            <input type="radio" name="r" id="r4">
                            <input type="radio" name="r" id="r5">
                            <figure class="slide s1">
                                <img src="Images/1.jpg">
                            </figure>
                            <figure class="slide">
                                <img src="Images/2.jpg">
                            </figure>
                            <figure class="slide">
                                <img src="Images/3.jpeg">
                            </figure>
                            <figure class="slide">
                                <img src="Images/4.jpeg">
                            </figure>
                            <figure class="slide">
                                <img src="Images/5.jpg">
                            </figure>
                        </div>            
                    </div>
                </div>
            </div>
            <div class="categories">
                <div class="wrapper2">
                    <div class="row">
                        <figure class="col-3">
                            <a href="landscapes.html"><img src="Images/landscape.jpg"></a>
                            <h2>Landscapes</h2>
                        </figure>
                        <figure class="col-3">
                            <a href="animals.html"><img src="Images/moose.jpg"></a>
                            <h2>Animals</h2>
                        </figure>
                        <figure class="col-3">
                            <a href="people.html"><img src="Images/happyppl.jpg"></a>
                            <h2>People</h2>
                        </figure>
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
                            <li><a href="#" class=""><img src="Images/facebook.png" alt="Facebook"></a></li>
                            <li><a href="#" class=""><img src="Images/twitter.png" alt="Twitter"></a></li>
                            <li><a href="#" class=""><img src="Images/instagram.png" alt="Instagram"></a></li>
                            <li><a href="#" class=""><img src="Images/youtube.png" alt="Youtube"></a></li>
                        </ul>
                    </div>
                    <div id="pp" class="col-2" id="iframe">
                        <h3>Directions</h3>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3145.941054270136!2d23.73827821565579!3d37.95516230953271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14a1bd74bbb87737%3A0x67cc69af825c4e17!2zzpfPgM61zq_Pgc6_z4UgNSwgzpTOrM-Gzr3OtyDOkc-Ez4TOuc66zq7PgiAxNzIgMzc!5e0!3m2!1sel!2sgr!4v1615095404442!5m2!1sel!2sgr" 
                                width="300" height="200" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                    </div>
                </div>
            </div>
            <div class="copyright"><p>Copyright&copy; 2021</p></div>
        </div>
        <script src="JS/1.js"></script>
    </body>
</html>

