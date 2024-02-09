package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database;
import entities.BusUser;


@WebServlet("/Registrationservlet")
public class Registrationservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Registrationservlet() {
        super();
    }


	public void init(ServletConfig config) throws ServletException {
		ServletContext ctx = config.getServletContext();
		database = (Database)ctx.getAttribute("dbconnection");
		if(database==null) {
			database= new Database();
			
			ctx.setAttribute("dbconnection", database);
		}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int id = 0;
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String confirm=request.getParameter("cpassword");
		String role="user";
		System.out.println(password+" "+confirm);
		if(password.equals(confirm)) {
			String sql="SELECT count(*) AS COUNT FROM BusUser";
			con=database.getConnection();
			try {
				Statement statement = con.createStatement();
				rs = statement.executeQuery(sql);
				if(rs.next()) {
					id= rs.getInt("COUNT");
					System.out.println("Present id= "+id);
					if(id==0) {
						System.out.println("no data is there");
						id=1;
					}
					else {
						id=id+1;
						System.out.println("setting id = "+id);
					}
					System.out.println("id= "+id);
				}else {
					System.out.println("result set does not found.");
				}
				BusUser user = new BusUser(id,username,email,password,role);
				database.writeUser(user);
	            // Registration successful, set a success message in the session
	            HttpSession session = request.getSession();
	            session.setAttribute("registrationMessage", "Registration successful");

	            // Redirect to the login page
	            response.sendRedirect("login.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else {
            // Registration failed, set an error message as a request attribute
            request.setAttribute("errorMessage", "Password and confirm password must be same.");

            // Forward back to the registration page
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	//class fields
	Database database;
	BusUser users=new BusUser();
	Connection con;
	ResultSet rs;

}
