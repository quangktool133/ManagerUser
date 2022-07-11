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
public class EditRoleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private Role role;
	    private RoleDaoImpl roleDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditRoleController() {
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
			int id = 0;
			try {
				id = Integer.parseInt(request.getParameter("id"));
			} catch(NumberFormatException e) {
				response.sendRedirect(request.getContextPath() +"/admin/user");
				return;
			}
			if(id != 0) {
			Role role = roleDAO.getRole(id);
			request.setAttribute("role", role);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/editrole.jsp");
				rd.forward(request, response);
			} else {
				
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/admin/show-role.jsp");
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
		 int id = 0;
			try {
				id = Integer.parseInt(request.getParameter("id"));
			} catch(NumberFormatException e) {
				response.sendRedirect(request.getContextPath() +"/admin/user");
				return;
			}
		
			Role roletemp = roleDAO.getRole(id);
			
		 Role temp = new Role(roletemp.getId(),role,description);
		 if (roleDAO.editRole(temp) > 0) {
			 //th�nh c�ng
			 //ghi file
			 
			 response.sendRedirect(request.getContextPath() +"/admin/role");
				return;
		 } else {
			 
				
			 response.sendRedirect(request.getContextPath() +"/admin/role/edit");
			 return;
		 }
	}

}
