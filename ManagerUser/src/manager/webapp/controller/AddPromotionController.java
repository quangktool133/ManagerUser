package manager.webapp.controller;

import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import manager.webapp.dao.impl.PromotionDaoImpl;
import manager.webapp.dao.impl.PromotionHistoryDaoImpl;
import manager.webapp.dao.impl.RoleDaoImpl;
import manager.webapp.dao.impl.UserDaoImpl;
import manager.webapp.model.Promotion;
import manager.webapp.model.PromotionHistory;
import manager.webapp.model.Role;
import manager.webapp.model.User;
import manager.webbapp.util.Common;
import manager.webbapp.util.FileUtil;

/**
 * Servlet implementation class AddUser
 */
@MultipartConfig
public class AddPromotionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private User user;
	private Role role;
	private Promotion promotion;
	private UserDaoImpl userDAO;   
	private RoleDaoImpl roleDAO;   
	private PromotionDaoImpl promotionDAO;   
	private PromotionHistoryDaoImpl promotionHistoryDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPromotionController() {
        super();
        user = new User();
        userDAO = new UserDaoImpl();
        role = new Role();
        roleDAO = new RoleDaoImpl();
        promotion = new Promotion();
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
			ArrayList<User> roleList = userDAO.getAll();
			if (roleList != null && roleList.size() > 0) {
				request.setAttribute("listUser", roleList);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/addpromotion.jsp");
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
		request.setCharacterEncoding("UTF-8");
		//get data
		HttpSession session = request.getSession();
		 int id = 0;
		 try {
				id = Integer.parseInt(request.getParameter("user-choose"));
			} catch(NumberFormatException e) {
				response.sendRedirect(request.getContextPath() +"/admin/user");
				return;
			}
		 if(!promotionDAO.checkExit(id)) {
				Role temp = new Role(0, "", "");
				User userCurrent = (User) session.getAttribute("userCurrent");
				User userTemp = new User(id, "", "", "", "", "", "", temp, 0);
				User getName = userDAO.getUserById(id);
				Promotion pTemp = new Promotion(0, userTemp, 5);
		 if (promotionDAO.addPromotion(pTemp) > 0) {
			 Timestamp timestamp = new Timestamp(System.currentTimeMillis());
			 String status = userCurrent.getFullname()+" added " +getName.getFullname()+ " to the list";
			 PromotionHistory item = new PromotionHistory(0,userCurrent,status,timestamp.getTime());
			if(promotionHistoryDAO.insertHistory(item)>0) {
			 response.sendRedirect(request.getContextPath() +"/admin/promotion?msg=1");
				return;
			 }
		 }
//		 } else {
//			 ArrayList<Role> roleList = roleDAO.getAll();
//			 request.setAttribute("listRole", roleList);
//				
//				RequestDispatcher rd = request.getRequestDispatcher("/admin/promotion/add");
//				rd.forward(request, response);
//		 }
		 } else {
			 ArrayList<Role> roleList = roleDAO.getAll();
			 request.setAttribute("listRole", roleList);
			 response.sendRedirect(request.getContextPath() +"/admin/promotion/add?msg=1");
				return;
		 }
	}

}
