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
        <title>Login/Register</title>
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
                            <li><a href="${pageContext.request.contextPath}/admin/addUser"><u>Add</u> Account</a></li>
                        </ul>
                    </nav>
                </div>

                <div class="admin-form-container">
                    <form:form action="${pageContext.request.contextPath}/admin/users/update" method="POST">

                        <h2><u>Change the account ${accountToEdit.id} details</u></h2>
                        <input type="text" name="id" value="${accountToEdit.id}" hidden="hidden"/>
                        <label for="username"><i>Account username:</i></label>
                        <input type="text"  name="username" value="${accountToEdit.username}" readonly="readonly"/>
                        <input type="text" name="password" value="${accountToEdit.password}" hidden="hidden"/>
                        <label for="firstname"><i>Account firstname:</i></label>
                        <input type="text"  name="firstname" value="${accountToEdit.firstname}" required="required"/>
                        <label for="lastname"><i>Account lastname:</i></label>
                        <input type="text"  name="lastname" value="${accountToEdit.lastname}" required="required"/>
                        <label for="email"><i>Account email:</i></label>
                        <input type="email"  name="email" value="${accountToEdit.email}" required="required"/>
                        <label for="address"><i>Account address:</i></label>
                        <input type="text"  name="address" value="${accountToEdit.address}" required="required"/>
                        <label for="city"><i>Account city:</i></label>
                        <input type="text"  name="city" value="${accountToEdit.city}" required="required"/>
                        <label for="postalcode"><i>Account postalcode:</i>
                            <input type="number"  name="postalcode" value="${accountToEdit.postalcode}" required="required"/>
                            <label for="roles"><i>Account Roles:</i></label>
                            <div class="selectWrapper">
                                <select name="roles"  value="${accountToEdit.roles}" required="required" multiple="multiple">
                                    <c:forEach items="${rolesToEdit}" var = "role">
                                        <option value="${role.id}">${role.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <button type="Submit" value="Submit">Submit</button>
                        </form:form>
                </div>     
            </div>   
            <div class="copyright"><p>Copyright&copy; 2021</p></div>
        </div>
        <script src="/JS/1.js"></script>
    </body>

</html>