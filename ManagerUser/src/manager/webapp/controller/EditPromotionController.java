package manager.webapp.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import manager.webapp.dao.impl.PromotionDaoImpl;
import manager.webapp.dao.impl.PromotionHistoryDaoImpl;
import manager.webapp.dao.impl.UserDaoImpl;
import manager.webapp.model.Promotion;
import manager.webapp.model.PromotionHistory;
import manager.webapp.model.User;

/**
 * Servlet implementation class EditPromotionController
 */
@WebServlet("/EditPromotionController")
public class EditPromotionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Promotion promotion;
	private PromotionDaoImpl promotionDAO;   
	private UserDaoImpl userDAO; 
	private PromotionHistoryDaoImpl promotionHistoryDAO;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPromotionController() {
        super();
        promotion = new Promotion();
        userDAO = new UserDaoImpl();
		promotionDAO = new PromotionDaoImpl();
		promotionHistoryDAO = new PromotionHistoryDaoImpl();
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
			Promotion userPromotion = promotionDAO.getById(id);
			if (userPromotion != null ) {
				request.setAttribute("promotionCurrent", userPromotion);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/editpromotion.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("errorMessage", "Error!!!");
				RequestDispatcher rd = request.getRequestDispatcher("/admin/show-promotion.jsp");
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
		HttpSession session = request.getSession();
		User userCurrent = (User) session.getAttribute("userCurrent");
		int id = 0;
		int idUser =0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
			idUser = Integer.parseInt(request.getParameter("userID"));
		} catch(NumberFormatException e) {
			response.sendRedirect(request.getContextPath() +"/admin/promotion");
			return;
		}
		int promotion = Integer.parseInt(request.getParameter("user-promotion"));
		User getName = userDAO.getUserById(idUser);
		if(getName != null) {
		}
		if (promotionDAO.editPromtion(id, promotion) > 0) {
			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			 String status = userCurrent.getFullname()+" changed " +getName.getFullname()+ "'s promotion to the list";
			 PromotionHistory item = new PromotionHistory(0,userCurrent,status,timestamp.getTime());
			if(promotionHistoryDAO.insertHistory(item)>0) {
			 response.sendRedirect(request.getContextPath() +"/admin/promotion?msg=2");
				return;
			 }
		 } else {
			 response.sendRedirect(request.getContextPath() +"/admin/promotion/edit?id="+ id);
			 return;
		 }
	}

}
