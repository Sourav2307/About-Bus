<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/login.css">

  
</head>
<body>
  <header>
      <div class="title">
      <h1>  ABOUT BUS</h1>
      </div>
    <script>
        // Check if there's a registration message in the session and display it temporarily
        var registrationMessage = "${sessionScope.registrationMessage}";
        if (registrationMessage) {
            alert(registrationMessage);
            // Remove the message from the session to avoid displaying it again on subsequent visits
            <% session.removeAttribute("registrationMessage"); %>
        }
    </script>
    <div class=main>
      <div class="logo">
        <img src="img/logo2.png">
      </div>
    </div>
<%session.getAttribute("username"); %>
  <h1><u>Login</u></h1>
  <img src="img/logologin2.png">
  <div class="login">
    <form id="loginform" action="CheckLoginservlet" method="post">
      <label>User Name</label>
      <br>
      <input type="text" name="username" id="uname" placeholder="username" required>
      <br><br>
      <label>Password</label>
      <br>
      <input type="password" name="password" id="pas" placeholder="Password" required>
    <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>
      <br><br>
      <input type="submit" name="submit" id="submit" value="Login">
      <br><br>
      <input type="checkbox" name="checkbox" id="check">
      <span>Remember me</span>
      <br><br>
      <label class="forget">Forgot</label>
      <a href="#">Password</a>
      <div class="text">
        <span>Doesn't have an account? <a href="register.jsp">Register now</a></span><br>
        <span>Go to back <a href="home.jsp">Home Page</a></span>
      </div>
    </form>
    </div>
</header>
</body>
</html>