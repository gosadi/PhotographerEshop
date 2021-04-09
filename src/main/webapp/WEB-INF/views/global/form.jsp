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
        <link rel="stylesheet" href="/CSS/form.css">
    </head>

    <body>

        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form:form  action="${pageContext.request.contextPath}/register" method="POST" modelAttribute="accountuser" >
                    <h1>Create Account</h1>
                    <form:input type="text" placeholder="Firstname" path="firstname" name="firstname" required="required" />
                    <form:errors path="firstname" ></form:errors>
                    <form:input type="text" placeholder="Lastname" path="lastname" name="lastname" required="required"/>
                    <form:errors path="lastname" ></form:errors>
                    <form:input type="text" placeholder="Username" path="username" name="username" required="required" />
                    <form:errors path="username" ></form:errors>
                    <form:input type="password" placeholder="Password" path="password" name="password" required="required" />
                    <form:errors path="password" ></form:errors>
                    <form:input type="email" placeholder="Email" path="email" name="email" required="required" />
                    <form:errors path="email" ></form:errors>
                    <form:input type="text" placeholder="Address" path="address" name="address" required="required" />
                    <form:errors path="address" ></form:errors>
                    <form:input type="text" placeholder="City" path="city" name="city" required="required" />
                     <form:errors path="city" ></form:errors>
                    <form:input type="text" placeholder="Postal code" path="postalcode" name="postalcode" required="required" />
                    <form:errors path="postalcode" ></form:errors>
                    <form:button type="submit">Sign Up</form:button>
                </form:form>
            </div>

            <div class="form-container sign-in-container">
                <form:form action="${pageContext.request.contextPath}/authenticate" method="POST">

                    <h1>Sign in</h1>
                    <input type="text" placeholder="Username" name="username"/>
                    <input type="password" placeholder="Password" name="password"/>
                    <a href="#">Forgot your password?</a>
                    <button type="Submit" value="Login">Sign In</button>
                    <br>
                    <br>
                    <p>${message}</p>
                    <!--               
                    <c:if test="${param.logout != null}">
                        You have logged out successfully!
                    </c:if>
                    -->
                    
                    <c:if test="${param.error != null}">
                        <div class="error">
                            <i  style="color:red;">Invalid credentials. Please try again</i>
                        </div>
                    </c:if>
                    
                    <c:if test="${registered != null}">
                        <div class="registered">
                            <i>Successfully registered! Please sign in.</i>
                        </div>
                    </c:if>
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
        <script src="/JS/form.js"></script>
    </body>

</html>