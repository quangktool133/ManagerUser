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

import manager.webapp.dao.impl.PromotionDaoImpl;
import manager.webapp.dao.impl.PromotionHistoryDaoImpl;
import manager.webapp.model.Promotion;
import manager.webapp.model.PromotionHistory;
import manager.webapp.model.User;

/**
 * Servlet implementation class PromotionHistoryController
 */
public class PromotionHistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Promotion promotion;
	private PromotionDaoImpl promotionDAO;
	private PromotionHistory promotionHistory;   
	private PromotionHistoryDaoImpl promotionHistoryDAO;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PromotionHistoryController() {
        super();
        promotion = new Promotion();
		promotionDAO = new PromotionDaoImpl();
		promotionHistory = new PromotionHistory();
		promotionHistoryDAO = new PromotionHistoryDaoImpl();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User userCurrent = (User) session.getAttribute("userCurrent");
		if (userCurrent != null && "admin".equals(userCurrent.getRole().getRole())) {
			ArrayList<PromotionHistory> userPromotion = promotionHistoryDAO.getAll();
			if (userPromotion != null && userPromotion.size() > 0) {
				request.setAttribute("promotionHistoryList", userPromotion);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/show-promotion-history.jsp");
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
