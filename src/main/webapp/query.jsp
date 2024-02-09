<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entities.BusUser" %> <!-- Assuming BusUser is in the correct package -->

<%
    // Get the source and destination values from the session
    String source = (String) session.getAttribute("source");
    String destination = (String) session.getAttribute("destination");

    ArrayList<BusUser> resultList = new ArrayList<>(); // Declaration moved outside if-block

    if (source != null && destination != null) {
        // Establish the database connection
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbUsername = "system";
        String dbPassword = "root";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
            
            // Prepare the SQL query
            String sqlQuery = "SELECT rs.stop_name AS source_stop_name, rd.stop_name AS destination_stop_name, b.bus_no, f.fare_amount "
                            + "FROM Route r "
                            + "JOIN Fare f ON r.route_id = f.route_id "
                            + "JOIN Bus b ON f.bus_no = b.bus_no "
                            + "JOIN BusStop rs ON r.source_id = rs.stop_id "
                            + "JOIN BusStop rd ON r.destination_id = rd.stop_id "
                            + "WHERE rs.stop_name = ? AND rd.stop_name = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, source);
            preparedStatement.setString(2, destination);

            // Execute the query
            ResultSet resultSet = preparedStatement.executeQuery();

            // Process the query results (store them in resultList)
            while (resultSet.next()) {
                String sourceStopName = resultSet.getString("source_stop_name");
                String destinationStopName = resultSet.getString("destination_stop_name");
                String busNo = resultSet.getString("bus_no");
                double fareAmount = resultSet.getDouble("fare_amount");
                
                BusUser user = new BusUser();
                user.setUsername(sourceStopName);
                user.setEmail(destinationStopName);
                user.setPassword(busNo);
                user.setRole(String.valueOf(fareAmount));
                resultList.add(user);
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
</head>
<body>
      <form action="queryResult.jsp" method="post">
        <label for="source">Source:</label>
        <input type="text" id="source" name="source">
        <label for="destination">Destination:</label>
        <input type="text" id="destination" name="destination">
        <input type="submit" value="Search">
    </form>
</body>
</html>