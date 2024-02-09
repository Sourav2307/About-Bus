<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Admin</title>
	<link rel="stylesheet" type="text/css" href="css/admin.css">
</head>
<body>
	<header>
		<div class="main">
			<div class="logo">
				<img src="img/logo2.png">
				
			</div>
			<ul>
				<li> <a href="#">Hi, Admin</a></li>
			</ul>
		</div>

    <div class="title1">
      <h1>  ABOUT BUS</h1>
      
    </div>
		<div class="title">
			<h1><u>Admin</u></h1>
		</div>

		<div class="heading">
		<h1>Menu</h1>
	</div>

	<div class="button">
		<a href="Route.jsp" class="btn">Bus Route</a>
		<a href="bus.jsp" class="btn">Bus</a>
		<a href="Fare.jsp" class="btn">Fare</a>
		<a href="BusStop.jsp" class="btn">Bus Stop</a>
    </div>

    <form class="button1">
	<input type="button" value="Go back" onclick="history.back()">
	</form>
    </header>
</body>
</html>