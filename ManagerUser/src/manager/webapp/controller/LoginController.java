package manager.webapp.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;

import manager.webapp.dao.impl.UserDaoImpl;
import manager.webapp.model.User;
import manager.webbapp.util.Common;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private User user;
	private UserDaoImpl userDAO;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        
        user = new User();
        userDAO = new UserDaoImpl();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/login.jsp");
    	dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  ServletException, IOException {
		String username = request.getParameter("admin-username");
		String password = request.getParameter("admin-password");
		try {
			password = Common.textToEndcode(password);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		User userCurrent = userDAO.exitUser(username, password);
		if(userCurrent != null && userCurrent.getStatus() == 1 && "admin".equals(userCurrent.getRole().getRole())) {
			HttpSession session = request.getSession();
			session.setAttribute("userCurrent", userCurrent);
			session.setAttribute("admin-username", username);
			session.setAttribute("admin-password", password);
			response.sendRedirect(request.getContextPath() + "/admin/user");
			return;
		} else if(userCurrent != null && userCurrent.getStatus() == 1 ) {
			HttpSession session = request.getSession();
			session.setAttribute("userCurrent", userCurrent);
			session.setAttribute("admin-username", username);
			session.setAttribute("admin-password", password);
			response.sendRedirect(request.getContextPath() + "/user?id="+userCurrent.getId());
			return;
		}
		else {
            request.setAttribute("errorMessage", "username or password incorrect!");
            RequestDispatcher rd = request.getRequestDispatcher("/admin/login.jsp");
            rd.forward(request, response);     
            return;
		}
	}
	
	
	public String convertToSHA256(String str) throws NoSuchAlgorithmException {
		
		return Common.textToEndcode(str);
		
	}
	

}
