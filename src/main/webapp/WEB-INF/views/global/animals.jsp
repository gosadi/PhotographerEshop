<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Animals</title>
        <link rel="stylesheet" href="/CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
        <div class="wrapper">
            <div class="navbar">
                <div class="logo">
                    <img src="/Images/logo2.png" width="125px">
                </div>
                <nav>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/" class="btn">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/products" class="btn">Products</a></li>
                        <li><a href="${pageContext.request.contextPath}/register" class="btn">Register/Sign In</a></li>
                        <li><a href="cart.html" class="btn">My Cart</a></li>
                    </ul>
                </nav>
            </div>
            <div class="categories">
                <div class="wrapper2">
                    <h1 id="prodtitle">Animals</h1>
                    <div class="row">
                        <figure class="col-4">
                            <a href="#popup">
                                <img src="/Images/pexels-alex-andrews-2295744.jpg">
                            </a>
                            <div class="desc">
                                <h4>'Fox'
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
                                                                Add to cart 
                                                                <i class="fa fa-shopping-cart"></i>
                                                            </button>
                                                        </div>-->
                        </figure>
                        <div id="popup" class="popup">
                            <div class="popup-content">
                                <h1>'Fox'</h1>
                                <img src="/Images/pexels-alex-andrews-2295744.jpg" class="modal-image">
                                <!-- #+ is to prevent jumping to the top of the page when closing the modal.
                            It basically disables the anchor <a> tag, as long as there is no corresponding anchor tag in the page. -->
                                <a href="#+" class="close-popup">&times;</a>
                            </div>
                        </div>
                        <figure class="col-4">
                            <!--                            <a href="#popup2"><img src="/Images/pexels-chevanon-photography-1108099.jpg">
                                                            <h4>'Twins'</h4>  
                                                        </a>
                                                        <div class="overlay">
                                                            <button onclick="window.location.href = 'Cart.html';" class="cart-button">
                                                                Add to cart <i class="fa fa-shopping-cart"></i>
                                                            </button>
                                                        </div>
                                                        <div id="popup2" class="popup">
                                                            <div class="popup-content">
                                                                 Attention!! 
                                                                <h1 style="font-size: 30px;">'Twins'</h1>
                                                                <img src="/Images/pexels-chevanon-photography-1108099.jpg" class="modal-image">
                                                                <a href="#+" class="close-popup">&times;</a>
                                                            </div>
                                                        </div>-->
                            <a href="#popup3"><img src="/Images/pexels-david-dibert-635499.jpg">
                            </a>
                            <div class="desc">
                                <h4>'Freedom'
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
                            <!--                            <div class="overlay" style="bottom: 95px;">
                                                            <button class="cart-button">Add to cart <i class="fa fa-shopping-cart"></i></button>
                                                        </div>-->
                        </figure>

                        <div id="popup3" class="popup">
                            <div class="popup-content">
                                <h1>'Freedom'</h1>
                                <img src="/Images/pexels-david-dibert-635499.jpg" class="modal-image">
                                <a href="#+" class="close-popup">&times;</a>
                            </div>
                        </div>
                        <figure class="col-4">
                            <a href="#popup4"><img src="/Images/pexels-public-domain-pictures-41315.jpg">
                                <!--                                <h4>'King'</h4>
                                                                <div class="overlay">
                                                                    <button class="cart-button">Add to cart <i class="fa fa-shopping-cart"></i></button>
                                                                </div>-->
                            </a>
                            <div class="desc">
                                <h4>'King'
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
                        </figure>
                        <div id="popup4" class="popup">
                            <div class="popup-content">
                                <h1>'King'</h1>
                                <img src="/Images/pexels-public-domain-pictures-41315.jpg" class="modal-image">
                                <a href="#+" class="close-popup">&times;</a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <figure class="col-4">
                            <a href="#popup5"><img src="/Images/pexels-public-domain-pictures-87403.jpg">
                                <!--                                <div class="overlay">
                                                                    <button class="cart-button">Add to cart <i class="fa fa-shopping-cart"></i></button>
                                                                </div>-->
                            </a>
                            <div class="desc">
                                <h4>'Wild'
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
                        </figure>
                        <div id="popup5" class="popup">
                            <div class="popup-content">
                                <h1>'Wild'</h1>
                                <img src="/Images/pexels-public-domain-pictures-87403.jpg" class="modal-image">
                                <a href="#+" class="close-popup">&times;</a>
                            </div>
                        </div>

                        <figure class="col-4">
                            <a href="#popup6"><img src="/Images/pexels-flickr-145962.jpg">
                                <!--                                <div class="overlay">
                                                                    <button class="cart-button">Add to cart <i class="fa fa-shopping-cart"></i></button>
                                                                </div>-->
                            </a>
                            <div class="desc">
                                <h4>'Eagle'
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
                        </figure>
                        <div id="popup6" class="popup">
                            <div class="popup-content">
                                <h1>'Eagle'</h1>
                                <img src="/Images/pexels-flickr-145962.jpg" class="modal-image">
                                <a href="#+" class="close-popup">&times;</a>
                            </div>
                        </div>
                        <figure class="col-4">
                            <!--                            <a href="#popup7"><img src="/Images/pexels-kelvin-valerio-617278.jpg">
                                                            <h4>'Kitten'</h4>
                                                            <div class="overlay" style="bottom: 95px;">
                                                                <button class="cart-button">Add to cart <i class="fa fa-shopping-cart"></i>
                                                                </button>
                                                            </div>
                                                        </a>
                                                        <div id="popup7" class="popup">
                                                            <div class="popup-content">
                                                                 Attention!! 
                                                                <h1 style="font-size: 30px; line-height: 0px;">'Kitten'</h1>
                                                                <img src="/Images/pexels-kelvin-valerio-617278.jpg" class="modal-image">
                                                                <a href="#+" class="close-popup">&times;</a>
                                                            </div>
                                                        </div>-->

                            <a href="#popup8"><img src="/Images/pexels-public-domain-pictures-40984.jpg">
                                <!--                                <div class="overlay">
                                                                    <button class="cart-button">Add to cart <i class="fa fa-shopping-cart"></i>
                                                                    </button>
                                                                </div>-->
                            </a>
                            <div class="desc">
                                <h4>'Smart'
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

                        </figure>

                        <div id="popup8" class="popup">
                            <div class="popup-content">
                                <h1>'Smart'</h1>
                                <img src="/Images/pexels-pixabay-64219.jpg" class="modal-image">
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
