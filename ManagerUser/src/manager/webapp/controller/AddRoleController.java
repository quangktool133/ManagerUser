package manager.webapp.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import manager.webapp.dao.impl.RoleDaoImpl;
import manager.webapp.model.Role;
import manager.webapp.model.User;

/**
 * Servlet implementation class AddRoleController
 */
@WebServlet("/AddRoleController")
public class AddRoleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private Role role;
	    private RoleDaoImpl roleDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRoleController() {
        super();
        role = new Role();
        roleDAO = new RoleDaoImpl();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User userCurrent = (User) session.getAttribute("userCurrent");
		if (userCurrent != null && "admin".equals(userCurrent.getRole().getRole())) {
			
				RequestDispatcher rd = request.getRequestDispatcher("/admin/addrole.jsp");
				rd.forward(request, response);
			
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/admin/login.jsp");
			rd.forward(request, response);
			return;
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//get data
		
		 String role = request.getParameter("role-input");
		 String description = request.getParameter("description-input");
		 Role temp = new Role(0,role,description);
		 if (roleDAO.addRole(temp) > 0) {
			 //thành công
			 //ghi file
			 
			 response.sendRedirect(request.getContextPath() +"/admin/role");
				return;
		 } else {
			 
				
			 response.sendRedirect(request.getContextPath() +"/admin/role/add");
			 return;
		 }
	}

}
