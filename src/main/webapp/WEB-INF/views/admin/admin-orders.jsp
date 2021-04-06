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
                            <li><a href="${pageContext.request.contextPath}/admin/products"><u>View</u> Products</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/orders"><u>View</u> Orders</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/admins"><u>View</u> Admins</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/users"><u>View</u> Users</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/addProduct"><u>Add</u> Product</a></li>
                            <li><a href="#"><u>Add</u> Account</a></li>
                        </ul>
                    </nav>
                </div>
                            
                <div class="adminTable">
                    <table>
                        <thead>
                        <th>Order ID</th>
                        <th>Order Date</th>
                        <th>Order Price</th>
                        <th>Account ID</th>
                        <th>Account Firstname</th>
                        <th>Account Lastname</th>
                        <th>Order Payment</th>
                        <th>Order Details</th>
                        </thead>
                        <c:forEach items="${orders}" var = "order">
                            <tr>
                                <td>${order.id}</td>
                                <td>${order.orderDate}</td>
                                <td>${order.totalPrice}€</td>
                                <td>${order.account.id}</td>
                                <td>${order.account.firstname}</td>
                                <td>${order.account.lastname}</td>
                                <td>${order.payment.name}</td>
                                <td><a href="/admin/orders/orderdetails?id=${order.id}">ViewOrderDetails</a></td>
                            </tr>
                        </c:forEach>

                    </table>
                </div>

            </div>

            <div class="copyright"><p>Copyright&copy; 2021</p></div>
        </div>


        <script src="/JS/1.js"></script>
    </body>
</html>

