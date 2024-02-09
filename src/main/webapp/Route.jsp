<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus Route View</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
        <style>
        /* Center the table on the web page */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        header{
	background-image: url(img/route.jpg);
	height: 100vh;
	background-size: cover;
	background-position: center;
}

        /* Add styles for the scrollable table */
        table {
            width: 80%; /* Adjust the width as needed */
            border-collapse: collapse;
            table-layout: fixed;
            margin-bottom: 20px;
            align-items: center;
            table-position: center;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
            white-space: nowrap; /* Prevent line breaks inside table cells */
            overflow: hidden; /* Hide overflow to prevent cell content from stretching */
            text-overflow: ellipsis; /* Add ellipsis (...) when text overflows */
        }

        tbody {
            display: block;
            max-height: 300px; /* Adjust the height as needed */
            overflow-y: auto;
        }

        thead, tbody tr {
            display: table;
            width: 100%;
            table-layout: fixed;
        }
    </style>
</head>
<body>
<header>
<%@ page import="database.Database" %>
<%@ page import="java.sql.*" %>

<%
Connection con = null;
Statement statement = null;
ResultSet resultSet = null;
Database database=new Database();
con=database.getConnection();
String sql = "SELECT * FROM Route";
try{
statement = con.createStatement();
resultSet = statement.executeQuery(sql);
} catch (Exception e) {
    e.printStackTrace();
  }

%>
<div class="title">
<h1>Bus Route Table</h1>
<div class="wrapper">

<table border="1">
<thead>
	<tr>
		<th> Route Id</th>
		<th> Source</th>
		<th> Destination</th>
		<th> Via Route</th>
	</tr>
</thead>
<tbody>
	        <% while(resultSet.next()){ %>
            <tr>
                <td><%= resultSet.getInt("route_id") %></td>
                <td><%= resultSet.getString("source_id") %></td>
                <td><%= resultSet.getString("destination_id") %></td>
                <td><%= resultSet.getString("via_route_id") %></td>
                <!-- Add more table data cells for each column you want to display -->
            </tr>
        <% } %>
</tbody>
</table>
    <button onclick="window.location.href = 'add_data.jsp';">Add</button>
    <button onclick="window.location.href = 'edit_data.jsp';">Edit</button>
    <button onclick="window.location.href = 'delete_data.jsp';">Delete</button>
    <button onclick="history.back()">Back</button>
</div>
</div>
</header>
</body>
</html>