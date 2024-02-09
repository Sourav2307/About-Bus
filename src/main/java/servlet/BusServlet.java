package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;
import entities.Bus;


@WebServlet("/BusServlet")
public class BusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private Database busDao;

    @Override
    public void init() {
        busDao = new Database();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Bus> buses = busDao.getAllBuses();
        request.setAttribute("buses", buses);
        request.getRequestDispatcher("bus.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int busId = Integer.parseInt(request.getParameter("busId"));
        String busNo = request.getParameter("busNo");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String operator = request.getParameter("operator");

        Bus bus = new Bus();
        bus.setBusId(busId);
        bus.setBusNo(busNo);
        bus.setCapacity(capacity);
        bus.setOperator(operator);

        busDao.addBus(bus);

        response.sendRedirect(request.getContextPath() + "/BusServlet");
    }
}

