<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1>Hello User!</h1>

        <p>:-D</p>

        <div>
            <a href="/">User Home Page</a>
        </div>
        
          <div>
        <table border="2" style="font-size: 20px">
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Product Description</th>
                        <th>Image Path</th>
                        <th>Base Price</th>
                    </tr>
                </thead>
                <c:forEach items="${productsList}" var="product">
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.descr}</td>
                        <td>${product.path}</td>
                        <td>${product.base_price}</td>
                        <td>      
                    </tr>
                </c:forEach>
                </table>
            </div>


        <form:form action="/logout" method="POST">
            <input type="submit" value="Logout">
        </form:form>
    </body>
</html>