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
                        <sec:authorize access="hasRole('ADMIN')">
                            <li><a href="${pageContext.request.contextPath}/admin" class="btn"><sec:authentication property="principal.username"/></a></li>
                            </sec:authorize>
                        <li><a href="${pageContext.request.contextPath}/" class="btn">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/products" class="btn">Products</a></li>
                            <sec:authorize access="!hasAnyRole('ADMIN','USER')">
                            <li><a href="${pageContext.request.contextPath}/register" class="btn">Register/Sign In</a></li>
                            </sec:authorize>
                        <li><a href="${pageContext.request.contextPath}/aboutus" class="btn">About Us</a></li>
                            <sec:authorize access="hasRole('ADMIN')">
                            <li><a href="${pageContext.request.contextPath}/logout" class="btn">Logout</a></li>
                            </sec:authorize>
                            <sec:authorize access="!hasRole('ADMIN') && isAuthenticated()">
                            <li><a href="${pageContext.request.contextPath}/cart" class="btn cart"><img src="/Images/cart.png" alt="cart" class="cart"></a></li>
                                </sec:authorize>
                                <sec:authorize access="!hasRole('ADMIN') && isAuthenticated()">
                            <li><div class="dropdown"><a href="#" class="btn-prof">
                                        <img src="../Images/icon-avatar-1.jpg" alt="Avatar" class="avatar"></a>
                                    <div class="dropdown-content">
                                        <a href="${pageContext.request.contextPath}/user/user-history">History</a>
                                        <a href="${pageContext.request.contextPath}/user/user-info">Info</a>
                                        <a href="${pageContext.request.contextPath}/logout">Logout</a>
                                    </div>
                                </div>
                            </li>
                        </sec:authorize>
                    </ul>
                </nav>
            </div>
            <div class="categories">
                <div class="wrapper2">
                    <h2 style="text-align:center">Your Cart</h2>
                    <div class="row">
                        <form:form method="POST" action="${pageContext.request.contextPath}/cart/update">
                            <table border="1">
                                <tr>
                                    <th>Id</th>
                                    <th>Description</th>
                                    <th>Photo</th>
                                    <th>Price</th>

                                    <th>
                                        Quality x Quantity
                                        <input type="submit" value="Update"/>
                                    </th>
                                    <th>Sub Total</th>
                                    <th></th>
                                </tr>
                                <c:forEach items="${cart}" var = "item">
                                    <tr>
                                        <td>"${item.product.id}"</td>
                                        <td>"${item.product.descr}"</td>
                                        <td>
                                            <img src="${item.product.path}" width="100"/>
                                        </td>
                                        <td>"${item.product.basePrice}"</td>
                                        <td>
                                            <select name="category" value="${item.category}">
                                                <c:forEach items="${categories}" var="category">
                                                    <option value="${category.priceRate}">${category.name}</option>
                                                </c:forEach>
                                            </select>

                                            <input type="number" value="${item.quantity}" name="quantity" style="width:50px;" />
                                        </td>
                                        <td>"${item.product.basePrice * item.quantity * item.category.priceRate}"</td>   
                                        <td>
                                            <a href="${pageContext.request.contextPath}/cart/delete/${item.product.id}/${item.category.id}/${item.quantity}">
                                                <i class="fa fa-trash"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="5">Total</td>
                                    <td>"${cartTotal}"</td>
                                </tr>
                            </table>
                            <a href="${pageContext.request.contextPath}/products">Continue Shopping</a>
                            <br>
                            <a href="${pageContext.request.contextPath}/paypal">Pay with Paypal/credit card</a>
                            <br>
                            <a href="${pageContext.request.contextPath}/cart/cash">Pay with cash</a>
                        </form:form>
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