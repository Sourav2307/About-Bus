package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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


@WebServlet("/CheckLoginservlet")
public class CheckLoginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CheckLoginservlet() {
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
		 ArrayList<BusUser> users = database.getUser("ALL");
		 System.out.println(users);
		 Map<String, String> usersMap = new HashMap<>();
		 String role = null;
		 BusUser ur = null;
		 for( BusUser u:users) {
			 usersMap.put(u.getUsername(), u.getPassword());
			 if(u.getUsername().equals(request.getParameter("username")))
				 role=u.getRole();
		 }
		 System.out.println("Role = "+role);
		 String u=request.getParameter("username");
		 String p=request.getParameter("password");
		System.out.println("u="+u);
		System.out.println("p="+p);
		String existingPassword = usersMap.get(u);
		System.out.println("existingPassword: "+existingPassword);
		if(existingPassword != null)
		  if(existingPassword.equals(p))	{
			//success, forward request to success.jsp
			 //request.setAttribute("username", request.getParameter("username"));
			  System.out.println("before checking : "+role);
			  if(role.equals("admin")) {
				  RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
				  rd.forward(request, response);
					response.sendRedirect(request.getContextPath()+"admin.jsp");

			  }else {
					 RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
					 rd.forward(request, response);
					 
			  }
		  }else {
			  //no success, include request from error.jsp
	            request.setAttribute("errorMessage", "Password or username is/are incorrect.");

	            // Forward back to the login page
	            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
	            dispatcher.forward(request, response);
		  }
		else {
		  //no success, include request from error.jsp
			  //no success, include request from error.jsp
            request.setAttribute("errorMessage", "Password or username is/are incorrect.");

            // Forward back to the login page
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
		}
		//session logic
		HttpSession session = request.getSession();
		session.setAttribute("username", request.getParameter("username"));
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
//class fields
	Database database;
}
