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
        <title>Home</title>
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
            <div class="adminWrapper">
                <div class="adminMenu">
                    <nav>
                        <ul>
                            <li><a href="index.html">View Products</a></li>
                            <li><a href="#">View Orders</a></li>
                            <li><a href="#">View Accounts</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="adminTable">
                    <table>
                        <thead>
                        <th>Product ID</th>
                        <th>Product info.</th>
                        <th>Product</th>
                        <th>Product price</th>
                        <th>Product Category</th>
                        <th>update</th>
                        <th>delete</th>
                        </thead>
                        <c:forEach items="${products}" var = "product">
                            <tr>
                                <td>${product.id}</td>
                                <td>${product.descr}</td>
                                <td><img src="${product.path}" alt="" width="100px"></td>
                                <td>${product.basePrice}</td>
                                <td>${product.photocategory.name}</td>
                                <td><a href="#"><img src="/Images/pencil.png" alt="edit"></a></td>
                                <td><a href="#"><img src="/Images/eraser.png" alt="update"></a></td>
                            </tr>
                        </c:forEach>

                    </table>
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
                    <div class="chat" ><button class="chatButton"><a href="${pageContext.request.contextPath}/chat" class=""><h2>Live chat</h2></a></button></div>
                </div>
                <div class="copyright"><p>Copyright&copy; 2021</p></div>
            </div>
        </div> 
        <script src="/JS/1.js"></script>
    </body>
</html>

