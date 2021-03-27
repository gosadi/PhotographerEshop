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
                            <li><a href="${pageContext.request.contextPath}/admin/products">View Products</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/orders">View Orders</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/admins">View Admins</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/users">View Users</a></li>
                            <li><a href="#">Add Product</a></li>
                            <li><a href="#">Add Account</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="adminTable">
                    <table>
                        <thead>
                        <th>ID</th>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>Postalcode</th>
                        <th>Orders</th>
                        <th>update</th>
                        </thead>
                        <c:forEach items="${admins}" var = "account">
                            <tr>
                                <td>${account.id}</td>
                                <td>${account.firstname}</td>
                                <td>${account.lastname}</td>
                                <td>${account.username}</td>
                                <td>${account.email}</td>
                                <td>${account.address}</td>
                                <td>${account.city}</td>
                                <td>${account.postalcode}</td>
                                <td><a href="${pageContext.request.contextPath}/admin/accounts/orders?id=${account.id}">ViewOrders</a></td>
                                <td><a href="${pageContext.request.contextPath}/admin/accounts/edit/${account.id}"><img src="/Images/pencil.png" alt="edit"></a></td>
                            </tr>
                        </c:forEach>
                            <c:forEach items="${users}" var = "account">
                            <tr>
                                <td>${account.id}</td>
                                <td>${account.firstname}</td>
                                <td>${account.lastname}</td>
                                <td>${account.username}</td>
                                <td>${account.email}</td>
                                <td>${account.address}</td>
                                <td>${account.city}</td>
                                <td>${account.postalcode}</td>
                                <td><a href="${pageContext.request.contextPath}/admin/accounts/orders?id=${account.id}">ViewOrders</a></td>
                                <td><a href="${pageContext.request.contextPath}/admin/accounts/edit/${account.id}"><img src="/Images/pencil.png" alt="edit"></a></td>
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

