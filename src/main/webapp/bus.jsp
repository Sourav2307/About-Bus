<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bus View</title>
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
	background-image: url(img/bus1.jpg);
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
String sql = "SELECT * FROM Bus";
try{
statement = con.createStatement();
resultSet = statement.executeQuery(sql);
} catch (Exception e) {
    e.printStackTrace();
  }

%>
<div class="title">
<h1>Bus Table</h1>
<div class="wrapper">

<table border="1">
<thead>
	<tr>
		<th> Bus Id</th>
		<th> Bus No</th>
		<th> Capacity</th>
		<th> Bus Type</th>
		<th>Edit</th>
        <th>Delete</th>
	</tr>
</thead>
<tbody>
	        <% while(resultSet.next()){ %>
            <tr>
                <td><%= resultSet.getInt("bus_id") %></td>
                <td><%= resultSet.getString("bus_no") %></td>
                <td><%= resultSet.getInt("capacity") %></td>
                <td><%= resultSet.getString("operator") %></td>
				<td><a href="EditBus.jsp?busId=<%= resultSet.getInt("bus_id") %>">Edit</a></td>
				<td><a href="BusServlet?action=delete&busId=<%= resultSet.getInt("bus_id") %>">Delete</a></td>

            </tr>
        <% } %>
</tbody>
</table>
    <button onclick="window.location.href='AddBus.jsp';">Add Bus</button>
    <button onclick="history.back()">Back</button>
</div>
</div>
</header>
</body>
</html>