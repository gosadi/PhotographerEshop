<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chat</title>
        <link rel="stylesheet" href="/CSS/style.css">
        <link rel="stylesheet" href="/CSS/socket.css">
        <link rel="icon" type="image/png" href="/Images/favicon.png">
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
                            <sec:authorize access="hasRole('ADMIN')">
                            <li><a href="${pageContext.request.contextPath}/logout" class="btn">Logout</a></li>
                            </sec:authorize>
                            <sec:authorize access="!hasRole('ADMIN') && isAuthenticated()">
                            <li><a href="${pageContext.request.contextPath}/cart" class="btn cart"><img src="/Images/cart.png" alt="cart" class="cart"></a></li>
                                </sec:authorize>
                            <sec:authorize access="!hasRole('ADMIN') && isAuthenticated()">
                            <li><div class="dropdown"><a href="#" class="btn-prof">
                                        <img src="/Images/icon-avatar-1.jpg" alt="Avatar" class="avatar"></a>
                                    <div class="dropdown-content">
                                        <a href="${pageContext.request.contextPath}/user/user-history"><sec:authentication property="principal.username"/>'s History</a>
                                        <a href="${pageContext.request.contextPath}/user/user-edit"><sec:authentication property="principal.username"/>'s Info</a>
                                        <a href="${pageContext.request.contextPath}/logout">Logout</a>
                                    </div>
                                </div>
                            </li>
                        </sec:authorize>
                    </ul>
                </nav>
            </div>
            <div class="categories">
                <div class="wrapper2">
                    <div class="row">
                        <div class="col-3">
                            <div id="username-page">
                                <div class="username-page-container">
                                    <h1 class="title">Give a username!</h1>
                                    <form id="usernameForm" name="usernameForm">
                                        <div class="form-group">
                                            <input type="text" id="name" placeholder="Username" autocomplete="off" class="form-control" />
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="accent username-submit">Start Chatting</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div id="chat-page" class="hidden">
                                <div class="chat-container">
                                    <div class="chat-header">
                                        <h2>How can I help you?</h2>
                                    </div>
                                    <div class="connecting">
                                        Connecting...
                                    </div>
                                    <ul id="messageArea"></ul>
                                    <form id="messageForm" name="messageForm">
                                        <div class="form-group">
                                            <div class="input-group clearfix">
                                                <input type="text" id="message" placeholder="Type a message..." autocomplete="off" class="form-control"/>
                                                <button type="submit" class="primary">Send</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <div class="wrapper">
                    <div class="row">
                        <div id="pp" class="col-2">
                            <h3>Contact Info</h3>
                            <p>Address: Ipeirou 5, 17237 Daphne</p>
                            <p>Telephone: 213 807865</p>
                            <p>E-mail: photografos@gmail.com</p>
                            <p>Business Hours: 0900 - 1700, Monday to Friday</p>
                        </div>
                        <div id="pp" class="col-2">
                            <h3>Follow us</h3>
                            <ul>
                                <li><a href="#" class=""><img src="/Images/facebook.png" alt="Facebook"></a></li>
                                <li><a href="#" class=""><img src="/Images/twitter.png" alt="Twitter"></a></li>
                                <li><a href="#" class=""><img src="/Images/instagram.png" alt="Instagram"></a></li>
                                <li><a href="#" class=""><img src="/Images/youtube.png" alt="Youtube"></a></li>
                            </ul>
                        </div>
                        <div id="pp" class="col-2" id="iframe">
                            <h3>Directions</h3>
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3145.941054270136!2d23.73827821565579!3d37.95516230953271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14a1bd74bbb87737%3A0x67cc69af825c4e17!2zzpfPgM61zq_Pgc6_z4UgNSwgzpTOrM-Gzr3OtyDOkc-Ez4TOuc66zq7PgiAxNzIgMzc!5e0!3m2!1sel!2sgr!4v1615095404442!5m2!1sel!2sgr" 
                                    width="300" height="200" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                        </div>
                    </div>
                </div>
                <div class="copyright"><p>Copyright&copy; 2021</p></div>
            </div>
        </div> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
        <script src="/JS/1.js"></script>
        <script src="/JS/socket.js"></script>
    </body>
</html>


