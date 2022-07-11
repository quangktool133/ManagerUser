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
import manager.webapp.dao.impl.UserDaoImpl;
import manager.webapp.model.Role;
import manager.webapp.model.User;

/**
 * Servlet implementation class SearchController
 */
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private User user;
	private UserDaoImpl userDAO;
	private Role role;
	private RoleDaoImpl roleDAO;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController() {
        super();
        user = new User();
		userDAO = new UserDaoImpl();
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
				request.setAttribute("listRole", roleList);
			}
			int id=0;
			try {
				id = Integer.parseInt(request.getParameter("id"));
			} catch(NumberFormatException e) {
				response.sendRedirect(request.getContextPath() +"/admin/user");
				return;
			}
			String search = request.getParameter("s");
			ArrayList<User> userList = new ArrayList<User>();
			if(id == 0) {
				userList = userDAO.searchName(search);
			} else {
				userList = userDAO.searchNameAndRole(search,id);
			}
			
				request.setAttribute("searchWord", search);
				request.setAttribute("idCurrent", id);
				request.setAttribute("listUser", userList);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/show-search.jsp");
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
		HttpSession session = request.getSession();
		User userCurrent = (User) session.getAttribute("userCurrent");
		if (userCurrent != null && "admin".equals(userCurrent.getRole().getRole())) {
			ArrayList<Role> roleList = roleDAO.getAll();
			if (roleList != null && roleList.size() > 0) {
				request.setAttribute("listRole", roleList);
			}
			int id=0;
			
			String search = request.getParameter("searchIpnut");
			ArrayList<User> userList = new ArrayList<User>();
			if(id == 0) {
				userList = userDAO.searchName(search);
			}
				request.setAttribute("searchWord", search);
				request.setAttribute("idCurrent", id);
				request.setAttribute("listUser", userList);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/show-search.jsp");
				rd.forward(request, response);
			
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/admin/login.jsp");
			rd.forward(request, response);
			return;
			
		}
	}

}
