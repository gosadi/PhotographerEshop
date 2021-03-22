<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <sec:authorize access="hasRole('ADMIN')">
        <div>
                <a href="/admin">Administrator Home Page</a>
            </div>
        </sec:authorize>
        
        <div>
                <a href="/user">User Home Page</a>
            </div>
        
         <form:form action="/logout" method="POST">
            <input type="submit" value="Logout">
        </form:form>
        
        
    </body>
</html>