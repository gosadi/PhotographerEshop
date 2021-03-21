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
<!--        <div class="container" id="container">-->

            <div class="form-container">
                <form:form method="post" action="/register" modelAttribute="accountuser" >
                    <h1>Create Account</h1>
                    <form:input type="text" placeholder="Firstname" path="firstname" name="firstname" required="required"/>
                    <form:input type="text" placeholder="Lastname" path="lastname" name="lastname" required="required"/>
                    <form:input type="text" placeholder="Username" path="username" name="username" required="required"/>
                    <form:input type="password" placeholder="Password" path="password" name="password" required="required"/>
                    <form:input type="email" placeholder="Email" path="email" name="email" required="required"/>
                    <form:input type="text" placeholder="Address" path="address" name="address" required="required"/>
                    <form:input type="text" placeholder="City" path="city" name="city" required="required"/>
                    <form:input type="number" placeholder="Postalcode" path="postalcode" name="postalcode" required="required"/>
                   
                    <button type="submit" value="Register">Sign Up</button>
                </form:form>
            </div>

    </body>

</html>