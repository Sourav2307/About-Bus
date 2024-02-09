<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/user.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <style>
        /* CSS styles for the page */
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
            background-color: white;
        }

        .input-group {
            margin-bottom: 30px;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
        }

        .input-group input[type="text"] {
            width: 100%;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .function{
			background-color: white;
			        
        }
    </style>
  
</head>
<body>
  <header>
  <jsp:include page="header.jsp" />
  
      <div class="title">
      <h1>  ABOUT BUS</h1>
      <% 
      
String userName =(String) session.getAttribute("username");

if(userName == null)
	userName = new String();
%>
    </div>
    <div class=main>
      <div class="logo">
        <img src="img/logo2.png">
      </div>
    <div class="Welcome">
  <h1><u>Welcome to our bus service</u></h1>
</div>
  <div class="login">
    <form id="loginform" method="post" action="queryResult.jsp">
      <label>Source address</label>
      <br>
      <input type="text" name="source" id="sname" placeholder="Source Address" required>
      <br><br>
       <label>Destination address</label>
      <br>
      <input type="text" name="destination" id="dname" placeholder="Destination address" required>
      <div id="suggestions"></div>
      <br><br><br>
       <script>
        $(document).ready(function () {
            $("#sname").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "autocomplete",
                        type: "GET",
                        data: {
                            term: request.term
                        },
                        success: function (data) {
                            response(data.split("\n"));
                        }
                    });
                },
                minLength: 1
            });
        });
    </script>
          <script>
        $(document).ready(function () {
            $("#dname").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "autocomplete",
                        type: "GET",
                        data: {
                            term: request.term
                        },
                        success: function (data) {
                            response(data.split("\n"));
                        }
                    });
                },
                minLength: 1
            });
        });
    </script>
      <input type="reset" name="submit" id="submit" value="CLEAR">
      <input type="submit" name="submit" id="submit" value="SEARCH">
      <input type="submit" value="BACK" onclick="history.back()">
      <br>
    </form>
    </div>
</header>
</body>
</html>