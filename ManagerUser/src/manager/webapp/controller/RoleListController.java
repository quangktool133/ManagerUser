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
 * Servlet implementation class RoleListController
 */
public class RoleListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Role role;
    private RoleDaoImpl roleDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoleListController() {
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
			ArrayList<Role> roleList = roleDAO.getAll();
			if (roleList != null && roleList.size() > 0) {
				request.setAttribute("roleList", roleList);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/show-role.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("errorMessage", "Error!!!");
				RequestDispatcher rd = request.getRequestDispatcher("/admin/login.jsp");
				rd.forward(request, response);
			}
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
