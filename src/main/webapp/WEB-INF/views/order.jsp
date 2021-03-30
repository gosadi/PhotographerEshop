<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <h1>By the Order of Peaky Blinders</h1>

        <p>:-D</p>

        <form:form action="order" method="POST" modelAttribute="order">
            
          
            <p><strong>Choose Size:</strong></p>
          
            <c:forEach items="${sizes}" var="size">
            <form:select path="category" items="${sizes}" itemLabel="category.size" itemValue="category.size"/>
            </c:forEach>
            
           
            
            <br/>
            <input type="submit" value="Submit"/>

        </form:form>

        <form:form action="/logout" method="POST">
            <input type="submit" value="Logout">
        </form:form>
    </body>
</html>