<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Bus</title>
    <style type="text/css">

    </style>
</head>
<body>
    <h1>Add Bus</h1>
    <div class="container">
    <div class="title">Registration</div>
    <div class="content">
    <form action="BusServlet" method="post">
            <div class="user-details">
          <div class="input-box">
            <span class="details">Bus ID</span>
            <input type="text" name="busId" placeholder="Enter the bus id" required>
          </div>
          <div class="input-box">
            <span class="details">Bus No</span>
            <input type="text" name="busNo" placeholder="Enter the bus no" required>
          </div>
          <div class="input-box">
            <span class="details">Capacity</span>
            <input type="text" name="capacity" placeholder="Enter the Bus Capacity" required>
          </div>
          <div class="input-box">
            <span class="details">Operator</span>
         <select name = "operator">
            <option value = "Private" selected>Private</option>
            <option value = "Government">Government</option>
         </select>          
         </div>
                 <input type="submit" value="Add">
          </div>
          </form>
          </div>
          </div>
    <br>
    <a href="BusServlet">Back to Bus Records</a>
</body>
</html>
