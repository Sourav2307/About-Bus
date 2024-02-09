<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Bus</title>
</head>
<body>
    <h1>Edit Bus</h1>
    <%
    int busId = Integer.parseInt(request.getParameter("busId"));
    // Now you can use the busId to fetch the bus record for editing
    // For example, you can use the busId to populate the form fields with existing data.
%>
    
    <form action="BusServlet" method="post">
        Bus ID: <input type="text" name="busId" value="${param.busId}" readonly><br>
        Bus No: <input type="text" name="busNo" required><br>
        Capacity: <input type="number" name="capacity" required><br>
        Operator:  <select name = "operator">
            <option value = "Private" selected>Private</option>
            <option value = "Government">Government</option>
         </select><br>
 
        <input type="submit" value="Update">
    </form>
    <br>
    <a href="BusServlet">Back to Bus Records</a>
</body>
</html>
