<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entities.Fare" %>

<%
    // Get the source and destination values from the form data
    String source = request.getParameter("source");
    String destination = request.getParameter("destination");

    ArrayList<Fare> resultList = new ArrayList<>();

    // ... (rest of the code remains the same as in query.jsp)
        if (source != null && destination != null) {
        // Establish the database connection
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbUsername = "system";
        String dbPassword = "root";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
            
            // Prepare the SQL query
            String sqlQuery = "SELECT rs.stop_name AS source_stop_name, rd.stop_name AS destination_stop_name, b.bus_no, f.fare_amount, rv.stop_name AS Via_Route "
                            + "FROM Route r "
                            + "JOIN Fare f ON r.route_id = f.route_id "
                            + "JOIN Bus b ON f.bus_no = b.bus_no "
                            + "JOIN BusStop rs ON r.source_id = rs.stop_id "
                            + "JOIN BusStop rd ON r.destination_id = rd.stop_id "
                            +"JOIN BusStop rv ON r.via_route_id = rv.stop_id "
                            + "WHERE rs.stop_name = ? AND rd.stop_name = ? "
                            +"OR (rs.stop_name = ? AND rd.stop_name = ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, source);
            preparedStatement.setString(2, destination);
            preparedStatement.setString(3, destination);
            preparedStatement.setString(4, source);

            // Execute the query
            ResultSet resultSet = preparedStatement.executeQuery();

            // Process the query results (store them in resultList)
            while (resultSet.next()) {
                String sourceStopName = resultSet.getString("source_stop_name");
                String destinationStopName = resultSet.getString("destination_stop_name");
                String busNo = resultSet.getString("bus_no");
                double fareAmount = resultSet.getDouble("fare_amount");
                String viaRoute= resultSet.getString("Via_Route");
                
                Fare fare = new Fare();
                fare.setSourceName(sourceStopName);
                fare.setDestinationName(destinationStopName);
                fare.setBusNo(busNo);
                fare.setFare(fareAmount);
                fare.setViaRoute(viaRoute);
                resultList.add(fare);
            }

            // Close resources
            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions here
        }
    } else {
        // Handle the case when source and destination are not available in the session
        // For example, redirect to an error page or back to the login page
    }

%>

<!DOCTYPE html>
<html>
<head>
    <title>Query Results</title>
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
	background-image: url(img/businfo.jpg);
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


    <!-- Your HTML and display logic here to show the query results -->
    <%-- Example: Displaying the query results --%>

    
    <% if (!resultList.isEmpty()) { %>
			<ul>
				<li> <a href="https://www.google.com/maps/dir/${sessionScope.source}/${sessionScope.destination}/@22.5674447,88.2966542,13z/data=!4m2!4m1!3e3?entry=ttu">View in Google Map</a></li>
			</ul>
			        <div class="title">
			
        <h1>All Information About Bus</h1>
        <table border="1">
        <thead>
            <tr>
                <th>Source Stop Name</th>
                <th>Destination Stop Name</th>
                <th>Bus No</th>
                <th>Fare Amount</th>
                <th>Via Route</th>
            </tr>
          </thead>
          <tbody>  
            <%-- Loop through the resultList to display the data --%>
            <% for (Fare f : resultList) { %>
                <tr>
                    <td><%= f.getSourceName() %></td>
                    <td><%= f.getDestinationName() %></td>
                    <td><%= f.getBusNo() %></td>
                    <td><%= f.getFare() %></td>
                    <td><%= f.getViaRoute() %></td>
                </tr>
            <% } %>
            </tbody>
        </table>
              <input type="submit" value="BACK" onclick="history.back()">
        
    </div>
        <% } else { %>
        <div class="title">
        <p>No results found.</p>
        			<ul>
				<li> <a href="https://www.google.com/maps/dir///@22.5674447,88.2966542,13z/data=!4m2!4m1!3e3?entry=ttu">You can check your route from Google Map</a></li>
			</ul>
    <% } %>
    </div>
    </header>
</body>
</html>
