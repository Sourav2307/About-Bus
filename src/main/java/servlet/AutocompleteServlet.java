package servlet;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AutocompleteServlet extends HttpServlet {
  
	
	private static final long serialVersionUID = 1L;
	private List<String> suggestions = new ArrayList<>();

    public void init() throws ServletException {
        // Load the data from the database when the servlet is initialized
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String username = "system";
        String password = "root";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection connection = DriverManager.getConnection(url, username, password);

            String sql = "SELECT stop_name FROM BusStop";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                String stopName = resultSet.getString("stop_name");
                System.out.println(stopName);
                suggestions.add(stopName);
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String term = request.getParameter("term");
        List<String> matchingSuggestions = getMatchingSuggestions(term);

        // Set the response content type to plain text
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        // Write suggestions separated by new lines
        for (String suggestion : matchingSuggestions) {
            response.getWriter().println(suggestion);
        }
    }

    private List<String> getMatchingSuggestions(String term) {
        List<String> matchingSuggestions = new ArrayList<>();

        for (String suggestion : suggestions) {
            if (suggestion.toLowerCase().startsWith(term.toLowerCase())) {
                matchingSuggestions.add(suggestion);
            }
        }

        return matchingSuggestions;
    }
}
