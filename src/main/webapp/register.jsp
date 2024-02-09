<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Registration or Sign Up form in HTML CSS | CodingLab </title> 
    <link rel="stylesheet" type="text/css" href="css/register.css">
   </head>
<body>
  <header>
    <div class="title">
      <h1>  ABOUT BUS</h1>
      </div>

    <div class=main>
      <div class="logo">
        <img src="img/logo2.png">
      </div>
    </div>
  <div class="wrapper">
    <h2>Registration</h2>
    <form action="Registrationservlet" method="post">
      <div class="input-box">
        <input type="text" name="username" placeholder="Enter your name" required>
      </div>
      <div class="input-box">
        <input type="email" name="email" placeholder="Enter your email" required>
      </div>
      <div class="input-box">
        <input type="password" name="password" placeholder="Create password" required>
      </div>
      <div class="input-box">
        <input type="password" name="cpassword" placeholder="Confirm password" required>
      </div>
      <div class="policy">
        <input type="checkbox">
        <h3>I accept all terms & condition</h3>
      </div>
    <!-- Check for an error message in the request and display it if it exists -->
    <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>
      <div class="input-box button">
        <input type="Submit" value="Register Now">
      </div>
      <div class="text">
        <h3>Already have an account? <a href="login.jsp">Login now</a></h3>
      </div>
    </form>
  </div>
<pre>



</pre>
  <form class="button1">
  <input type="button" value="Go back" onclick="history.back()">
  </form>
</header>
</body>
</html>
    