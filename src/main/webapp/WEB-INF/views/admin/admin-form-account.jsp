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
        <link rel="stylesheet" href="/CSS/admin-form-account.css">
    </head>
    


    <body>

        <div class="container" id="container">
            <div class="form-container">
                <form:form action="${pageContext.request.contextPath}/admin/update" method="POST">

                    <h2><u>Change the account ${accountToEdit.id} details</u></h2>
                    <label for="username"><i>Account username:</i></label>
                    <input type="text"  name="username" value="${accountToEdit.username}" readonly="readonly"/>
                    <label for="firstname"><i>Account firstname:</i></label>
                    <input type="text"  name="firstname" value="${accountToEdit.firstname}"/>
                    <label for="lastname"><i>Account lastname:</i></label>
                    <input type="text"  name="lastname" value="${accountToEdit.lastname}"/>
                    <label for="email"><i>Account email:</i></label>
                    <input type="email"  name="email" value="${accountToEdit.email}"/>
                    <label for="address"><i>Account address:</i></label>
                    <input type="text"  name="address" value="${accountToEdit.address}"/>
                    <label for="city"><i>Account city:</i></label>
                    <input type="text"  name="city" value="${accountToEdit.city}"/>
                    <label for="postalcode"><i>Account postalcode:</i>
                        <input type="number"  name="postalcode" value="${accountToEdit.postalcode}"/>
                        <label for="roles"><i>Account Role:</i></label>
                        <div class="selectWrapper">
                            <select name="roles">
                                <c:forEach items="${roles}" var = "role">
                                    <c:forEach items="${accountToEdit.roles}" var= "accountToEditRole">
                                        <option value="" disabled selected="true" hidden="true">${accountToEditRole.name}</option>
                                    </c:forEach>
                                    <option value="${role.id}">${role.name}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <button type="Submit" value="Submit">Submit</button>
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

            <!--            <div class="overlay-container">
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
                        </div>-->
        </div>

    </body>

</html>