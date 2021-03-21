<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login/Register</title>
        <link rel="stylesheet" href="CSS/form.css">
    </head>

    <body>

        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form:form method="post" action="/register" modelAttribute="accountuser" >
                    <h1>Create Account</h1>
                    <form:input type="text" placeholder="Firstname" path="firstname" name="firstname" required="required" />
                    <form:input type="text" placeholder="Lastname" path="lastname" name="lastname" required="required"/>
                    <form:input type="text" placeholder="Username" path="username" name="username" required="required" />
                    <form:input type="password" placeholder="Password" path="password" name="password" required="required" />
                    <form:input type="email" placeholder="Email" path="email" name="email" required="required" />
                    <form:input type="text" placeholder="Address" path="address" name="address" required="required" />
                    <form:input type="text" placeholder="City" path="city" name="city" required="required" />
                    <input type="number" placeholder="Postal code" path="postacode" name="postalcode" required="required">
                    <form:button type="submit">Sign Up</form:button> 
                </form:form>
            </div>
            
            <div class="form-container sign-in-container">
                <form:form action="${pageContext.request.contextPath}/authenticate" method="POST">
                    <h1>Sign in</h1>
                    <input type="text" placeholder="Username" />
                    <input type="password" placeholder="Password" />
                    <a href="#">Forgot your password?</a>
                    <button type="submit">Sign In</button>
                </form:form>
            </div>
            
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="JS/form.js"></script>
    </body>

</html>