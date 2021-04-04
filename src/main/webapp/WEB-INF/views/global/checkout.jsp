<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Paypal</title>
        <link rel="stylesheet" href="/CSS/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
        <div class="wrapper">
            <div class="navbar">
                <div class="logo">
                    <img src="/Images/logo2.png" width="125px">
                </div>
            </div>
            <div class="categories">
                <div class="wrapper2">
                    <h2 style="text-align:center">Check Out</h2>
                    <div class="paypalRow">
                        <div class="col-75">
                            <div class="container">
                                <form:form method="post"  action="/pay">
                                    <div class="col-50">
                                        <h3>Payment</h3>
                                        <label>Accepted Cards</label>
                                        <div class="icon-container">
                                            <i class="fa fa-cc-visa" style="color:navy; font-size: 50px"></i>
                                            <i class="fa fa-cc-amex" style="color:blue; font-size: 50px"></i>
                                            <i class="fa fa-cc-mastercard" style="color:red; font-size: 50px"></i>
                                            <i class="fa fa-cc-discover" style="color:orange; font-size: 50px"></i>
                                        </div>
                                        <label for="price">Total</label>
                                        <input type="text" id="price" name="price" value="${cartValue}" readonly="true">
                                        <label for="currency">Currency</label>
                                        <input type="text" id="currency" name="currency" value="EUR" readonly="true">
                                        <label for="method">Payment Method</label>
                                        <input type="text" id="method" name="method" value="PAYPAL" readonly="true">
                                        <label for="intent">Intent</label>
                                        <input type="text" id="intent" name="intent" value="sale" readonly="true">
                                        <label for="description">Payment Description</label>
                                        <input type="text" id="description" name="description" value="Photo Sale" readonly="true">

                                    </div>

                                    <input type="submit" value="Continue to checkout" class="paypalBtn">
                                </form:form>
                            </div>
                        </div>
                        <a href="${pageContext.request.contextPath}/cart">Return to Cart</a>
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