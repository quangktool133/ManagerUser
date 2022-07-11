package manager.webapp.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import manager.webapp.dao.impl.PromotionDaoImpl;
import manager.webapp.dao.impl.PromotionHistoryDaoImpl;
import manager.webapp.dao.impl.RoleDaoImpl;
import manager.webapp.dao.impl.UserDaoImpl;
import manager.webapp.model.Promotion;
import manager.webapp.model.PromotionHistory;
import manager.webapp.model.Role;
import manager.webapp.model.User;

/**
 * Servlet implementation class DelRoleControler
 */
public class DelPromotionControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private Role role;
	 private Promotion promotion;
		private PromotionDaoImpl promotionDAO;	
		private UserDaoImpl userDAO; 
		private PromotionHistoryDaoImpl promotionHistoryDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelPromotionControler() {
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
				response.sendRedirect(request.getContextPath() +"/admin/promotion");
				return;
			}
			if(id != 0) {
			if (promotionDAO.delItem(id) > 0) {
				Promotion userPromotion = promotionDAO.getById(id);
				Timestamp timestamp = new Timestamp(System.currentTimeMillis());
				 String status = userCurrent.getFullname()+" has removed  " +userPromotion.getUser().getFullname()+ " from the list";
				 PromotionHistory item = new PromotionHistory(0,userCurrent,status,timestamp.getTime());
				if(promotionHistoryDAO.insertHistory(item)>0) {
					response.sendRedirect(request.getContextPath() +"/admin/promotion?msg=3");
					return;
				 }
				
			} else {
				response.sendRedirect(request.getContextPath() +"/admin/promotion");
				return;
			}
			} else {
				response.sendRedirect(request.getContextPath() +"/admin/promotion");
				return;
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/admin/show-promotion.jsp");
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
