<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/login.css">
    </head>

    <body>

        <div class="form-container">

            <form:form action="${pageContext.request.contextPath}/authenticate" method="POST">

                <h1>Sign in</h1>
                <input type="text" placeholder="Username" name="username"/>
                <input type="password" placeholder="Password" name="password"/>
                <!--                    <a href="#">Forgot your password?</a>-->
                <button type="Submit" value="Login">Sign In</button>
                <br>
                <a href="/register">Sign Up</a>
                <br>
                <c:if test="${param.logout != null}">
                    You have logged out successfully!
                </c:if>
                <c:if test="${param.error != null}">
                    <div class="error">
                        <i>Invalid credentials. Please try again</i>
                    </div>
                </c:if>
                <c:if test="${registered != null}">
                    <div class="registered">
                        <i>Successfully registered! Please sign in.</i>
                    </div>
                </c:if>
            </form:form>
        </div>

    </body>

</html> 