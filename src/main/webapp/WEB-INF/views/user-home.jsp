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

        <form:form action="/logout" method="POST">
            <input type="submit" value="Logout">
        </form:form>
    </body>
</html>