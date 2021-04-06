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
                            <li><a href="#"><u>Add</u> Account</a></li>
                        </ul>
                    </nav>
                </div>

                <div class="admin-form-container">
                    <form:form action="${pageContext.request.contextPath}/admin/addProduct" enctype="multipart/form-data" method="POST"  modelAttribute="product">
                        <h2><u>Add a new product</u></h2>
                        <label for="descr"><i>Product description:</i></label>
                        <form:input type="text" placeholder="Night Drive" path="descr" name="descr" required="required" />
                        <label for="file">Upload an image</label>
                        <input type="file" name="imageFile" accept="image/*" title="Please upload an image" required="required"/>
                        <label for="path"><i>Product Path:</i></label>
                        <form:input type="text" placeholder="/Images/photo_name" path="path" name="path" required="required" title="Please give a path as shown above"/>
                        <label for="basePrice"><i>Product Base Price:</i></label>
                        <form:input type="number" placeholder="150.00" path="basePrice" name="basePrice" required="required" step="0.1" min="0"/>
                        <label for="productcategory"><i>Product Category:</i></label>
                        <div class="selectWrapper">
                            <form:select path="productcategory" name="productcategory" >
                                <c:forEach  items="${productCategories}" var="productCategory">
                                    <option value="${productCategory.id}">${productCategory.name}</option>
                                </c:forEach>

                            </form:select>
                        </div>
                        <form:button type="Submit" value="Submit">Create</form:button>
                    </form:form>
                </div>
                
            </div>
            <div class="copyright"><p>Copyright&copy; 2021</p></div>
        </div>
        <script src="/JS/1.js"></script>
    </body>

</html>