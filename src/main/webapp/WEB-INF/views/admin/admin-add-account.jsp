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
        <!--<link rel="stylesheet" href="/CSS/admin-form-account.css">-->
        <link rel="stylesheet" href="/CSS/style.css">
    </head>



    <body>

        <!--        <div class="container" id="container">-->
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
                    <form:form action="${pageContext.request.contextPath}/admin/addUser" method="POST" modelAttribute="newAccount">

                        <h2><u>Add a new account</u></h2>
                        <label for="username"><i>Account username:</i></label>
                        <form:input type="text" placeholder="nikosMats"  path="username" name="username" required="required" maxlength="20" />
                        <label for="city"><i>Account password:</i></label>
                        <form:input type="password" placeholder="Password" path="password" name="password" required ="required" pattern=".{4,68}" title="min 4 max 68 characters" />
                        <label for="firstname"><i>Account firstname:</i></label>
                        <form:input type="text" placeholder="Nikos" path="firstname" name="firstname" required="required" maxlength="30" />
                        <label for="lastname"><i>Account lastname:</i></label>
                        <form:input type="text" placeholder="Matsamplokos" path="lastname" name="lastname" required="required" maxlength="30" />
                        <label for="email"><i>Account email:</i></label>
                        <form:input type="email" placeholder="nikmats@gmail.com" path="email" name="email"  required="required" maxlength="50" />
                        <label for="address"><i>Account full address:</i></label>
                        <form:input type="text" placeholder="matsakonias 52" path="address" name="address" required="required" maxlength="50" />
                        <label for="city"><i>Account city:</i></label>
                        <form:input type="text" placeholder="Athens" path="city" name="city"  required="required" maxlength="50" />
                        <label for="postalcode"><i>Account postalcode:</i>
                            <form:input type="text" placeholder="15432" path="postalcode" name="postalcode" required="required" pattern="(?=.*\d).{5,}" title="Must contain only numbers and at least 5 characters" />
                            <label for="roles"><i>Make admin:</i></label>
                            <div class="selectWrapper">
                                <form:checkbox path="Roles" value="${adminRole}" />
                            </div>
                            <form:button type="Submit" value="Submit">Submit</form:button>
                        </form:form>
                </div>

            </div>
            <div class="copyright"><p>Copyright&copy; 2021</p></div>
        </div>
        <script src="/JS/1.js"></script>
    </body>

</html>