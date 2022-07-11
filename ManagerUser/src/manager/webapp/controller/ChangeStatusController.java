package manager.webapp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.webapp.dao.impl.UserDaoImpl;
import manager.webapp.model.User;

/**
 * Servlet implementation class ChangeStatusController
 */
public class ChangeStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private User user;
	private UserDaoImpl userDAO;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeStatusController() {
        super();
        user = new User();
        userDAO = new UserDaoImpl();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		User temp = userDAO.getUserById(id);
		if(1 == temp.getStatus()) {
			temp.setStatus(0);
		} else {
			temp.setStatus(1);
		}
		if(userDAO.updateUser(temp)>0) {
			RequestDispatcher rd = request.getRequestDispatcher("/admin/user");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
