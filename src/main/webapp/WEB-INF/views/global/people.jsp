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
        <title>People</title>
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
                    <h1 id="prodtitle">People</h1>
                    <div class="row">
                        <figure class="col-4">
                            <a href="#popup"><img src="/Images/pexels-pixabay-220453.jpg">
                            </a>
                            <div class="desc">
                                <h4>'Smile'
                                    <div class="dropdown">
                                        <button class="cartbtn">Add to cart
                                            <i class="fa fa-caret-down"></i>
                                        </button>
                                        <div class="dropdown-content">
                                            <a href="#">S</a>
                                            <a href="#">L</a>
                                            <a href="#">XL</a>
                                        </div>
                                    </div>
                                </h4>
                            </div>
<!--                            <div class="overlay">
                                <button onclick="window.location.href = 'Cart.html';" class="cart-button">
                                    Add to cart <i class="fa fa-shopping-cart"></i>
                                </button>
                            </div>-->
                        </figure>
                        <div id="popup" class="popup">
                            <div class="popup-content">
                                <h1>'Smile'</h1>
                                <img src="/Images/pexels-pixabay-220453.jpg" class="modal-image">
                                <!-- #+ is to prevent jumping to the top of the page when closing the modal.
                                It basically disables the anchor <a> tag, as long as there is no corresponding anchor tag in the page. -->
                                <a href="#+" class="close-popup">&times;</a>
                            </div>
                        </div>
                        <figure class="col-4">
                            <a href="#popup2"><img src="/Images/pexels-photo-935985.jpeg">
                            </a>
                            <div class="desc">
                                <h4>'Metamorphosis'
                                    <div class="dropdown">
                                        <button class="cartbtn">Add to cart
                                            <i class="fa fa-caret-down"></i>
                                        </button>
                                        <div class="dropdown-content">
                                            <a href="#">S</a>
                                            <a href="#">L</a>
                                            <a href="#">XL</a>
                                        </div>
                                    </div>
                                </h4>
                            </div>
<!--                            <div class="overlay">
                                <button onclick="window.location.href = 'Cart.html';" class="cart-button">
                                    Add to cart <i class="fa fa-shopping-cart"></i>
                                </button>
                            </div>-->
                            <div id="popup2" class="popup">
                                <div class="popup-content">
                                    <!-- Attention! -->
                                    <h1 style="font-size: 30px; line-height: 0px;">'Metamorphosis'</h1>
                                    <img src="/Images/pexels-photo-935985.jpeg" class="modal-image">
                                    <a href="#+" class="close-popup">&times;</a>
                                </div>
                            </div>
<!--                            <br>
                            <a href="#popup3"><img src="/Images/pexels-mentatdgt-937481.jpg">
                                <h4>'Suit'</h4> 
                            </a>
                            <div class="overlay">
                                <button onclick="window.location.href = 'Cart.html';" class="cart-button">
                                    Add to cart <i class="fa fa-shopping-cart"></i>
                                </button>
                            </div>-->
                        </figure>
<!--                        <div id="popup3" class="popup">
                            <div class="popup-content">
                                <h1>'Suit'</h1>
                                <img src="/Images/pexels-mentatdgt-937481.jpg" class="modal-image">
                                <a href="#+" class="close-popup">&times;</a>
                            </div>
                        </div>-->

                        <figure class="col-4">
                            <a href="#popup4"><img src="/Images/pexels-neemias-seara-3680316.jpg">
                            </a>  
                            <div class="desc">
                                <h4>'Braids'
                                    <div class="dropdown">
                                        <button class="cartbtn">Add to cart
                                            <i class="fa fa-caret-down"></i>
                                        </button>
                                        <div class="dropdown-content">
                                            <a href="#">S</a>
                                            <a href="#">L</a>
                                            <a href="#">XL</a>
                                        </div>
                                    </div>
                                </h4>
                            </div>
<!--                            <div class="overlay">
                                <button onclick="window.location.href = 'Cart.html';" class="cart-button">
                                    Add to cart <i class="fa fa-shopping-cart"></i>
                                </button>
                            </div>-->
                        </figure>
                        <div id="popup4" class="popup">
                            <div class="popup-content">
                                <h1>'Braids'</h1>
                                <img src="/Images/pexels-neemias-seara-3680316.jpg" class="modal-image">
                                <a href="#+" class="close-popup">&times;</a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <figure class="col-4">
                            <a href="#popup5"><img src="/Images/pexels-andrea-piacquadio-774909.jpg">
                            </a>
                            <div class="desc">
                                <h4>'Joy'
                                    <div class="dropdown">
                                        <button class="cartbtn">Add to cart
                                            <i class="fa fa-caret-down"></i>
                                        </button>
                                        <div class="dropdown-content">
                                            <a href="#">S</a>
                                            <a href="#">L</a>
                                            <a href="#">XL</a>
                                        </div>
                                    </div>
                                </h4>
                            </div>
<!--                            <div class="overlay">
                                <button onclick="window.location.href = 'Cart.html';" class="cart-button">
                                    Add to cart <i class="fa fa-shopping-cart"></i>
                                </button>
                            </div>-->
                        </figure>
                        <div id="popup5" class="popup">
                            <div class="popup-content">
                                <h1>'Joy'</h1>
                                <img src="/Images/pexels-andrea-piacquadio-774909.jpg" class="modal-image">
                                <a href="#+" class="close-popup">&times;</a>
                            </div>
                        </div>

                        <figure class="col-4">
                            <a href="#popup6"><img src="/Images/pexels-daniel-xavier-1239291.jpg">
                            </a>
                            <div class="desc">
                                <h4>'Simplicity'
                                    <div class="dropdown">
                                        <button class="cartbtn">Add to cart
                                            <i class="fa fa-caret-down"></i>
                                        </button>
                                        <div class="dropdown-content">
                                            <a href="#">S</a>
                                            <a href="#">L</a>
                                            <a href="#">XL</a>
                                        </div>
                                    </div>
                                </h4>
                            </div>
<!--                            <div class="overlay">
                                <button onclick="window.location.href = 'Cart.html';" class="cart-button">
                                    Add to cart <i class="fa fa-shopping-cart"></i>
                                </button>
                            </div>-->
                            <div id="popup6" class="popup">
                                <div class="popup-content">
                                    <!-- Attention!! -->
                                    <h1 style="font-size: 30px; line-height: 0px;">'Simplicity'</h1>
                                    <img src="/Images/pexels-daniel-xavier-1239291.jpg" class="modal-image">
                                    <a href="#+" class="close-popup">&times;</a>
                                </div>
                            </div>
<!--                            <br>
                            <a href="#popup7"><img src="/Images/pexels-yulianto-poitier-1231365.jpg">
                                <h4>'Happiness'</h4>
                            </a>
                            <div class="overlay">
                                <button onclick="window.location.href = 'Cart.html';" class="cart-button">
                                    Add to cart <i class="fa fa-shopping-cart"></i>
                                </button>
                            </div>-->
                        </figure>
<!--                        <div id="popup7" class="popup">
                            <div class="popup-content">
                                <h1>'Happiness'</h1>
                                <img src="/Images/pexels-yulianto-poitier-1231365.jpg" class="modal-image">
                                <a href="#+" class="close-popup">&times;</a>
                            </div>
                        </div>-->

                        <figure class="col-4">
                            <a href="#popup8"><img src="/Images/pexels-mentatdgt-1024311.jpg">
                            </a>
                            <div class="desc">
                                <h4>'Confidence'
                                    <div class="dropdown">
                                        <button class="cartbtn">Add to cart
                                            <i class="fa fa-caret-down"></i>
                                        </button>
                                        <div class="dropdown-content">
                                            <a href="#">S</a>
                                            <a href="#">L</a>
                                            <a href="#">XL</a>
                                        </div>
                                    </div>
                                </h4>
                            </div>
<!--                            <div class="overlay">
                                <button onclick="window.location.href = 'Cart.html';" class="cart-button">
                                    Add to cart <i class="fa fa-shopping-cart"></i>
                                </button>
                            </div>-->
                        </figure>
                        <div id="popup8" class="popup">
                            <div class="popup-content">
                                <h1>'Confidence'</h1>
                                <img src="/Images/pexels-mentatdgt-1024311.jpg" class="modal-image">
                                <a href="#+" class="close-popup">&times;</a>
                            </div>
                        </div>

                        <!-- <div id="modal" onclick="this.style.display='none'">
                            <figure id="modal-content">
                              <img id="img1">
                            </figure>
                          </div> -->
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
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3145.941054270136!2d23.73827821565579!3d37.95516230953271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14a1bd74bbb87737%3A0x67cc69af825c4e17!2zzpfPgM61zq_Pgc6_z4UgNSwgzpTOrM-Gzr3OtyDOkc-Ez4TOuc66zq7PgiAxNzIgMzc!5e0!3m2!1sel!2sgr!4v1615095404442!5m2!1sel!2sgr" 
                                    width="300" height="200" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                        </div>
                    </div>
                </div>
                <div class="copyright"><p>Copyright&copy; 2021</p></div>
            </div>
    </div>
            <script src="/JS/2.js"></script>
    </body>
</html>
