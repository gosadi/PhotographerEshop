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
        <title>Edit product</title>
        <link rel="icon" type="image/png" href="/Images/favicon.png">
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
                    <form:form action="${pageContext.request.contextPath}/admin/products/update" method="POST">

                        <h2><u>Change the product ${productToEdit.id} details</u></h2>
                        <input type="text" name="id" value="${productToEdit.id}" hidden="hidden"/>
                        
                        <label for="descr"><i>Product description:</i></label>
                        <input type="text"  name="descr" value="${productToEdit.descr}" required="required" maxlength="30"  minlength="5" />
                        
                        <label for="path"><i>Product image:</i></label>
                        <input type="text" name="path" value="${productToEdit.path}" hidden="hidden"/>
                        
                        <div><img src="${pageContext.request.contextPath}${productToEdit.path}" width="100px" height="150"></div>
                        <label for="basePrice"><i>Product base price:</i></label>
                        <input type="text"  name="basePrice" value="${productToEdit.basePrice}" required="required" min="0" />
                        
                        <label for="productcategory"><i>Product category:</i></label>
                            <div class="selectWrapper">
                                <select name="productcategory"  value="${productToEdit.productcategory}" required="required">
                                    <c:forEach items="${productCategoriesToEdit}" var = "productCat">
                                        <option value="${productCat.id}">${productCat.name}</option> <!-- SELECTED ITEM TO DROPDOWN -->
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