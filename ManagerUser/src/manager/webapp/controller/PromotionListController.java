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
import manager.webapp.dao.impl.UserDaoImpl;
import manager.webapp.model.Promotion;
import manager.webapp.model.User;

/**
 * Servlet implementation class PromotionController
 */
public class PromotionListController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Promotion promotion;
    private PromotionDaoImpl promotionDAO;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PromotionListController() {
        super();
        promotion = new Promotion();
        promotionDAO = new PromotionDaoImpl();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User userCurrent = (User) session.getAttribute("userCurrent");
        if (userCurrent != null && "admin".equals(userCurrent.getRole().getRole())) {
            ArrayList<Promotion> userPromotion = promotionDAO.getAll();
//			if (userPromotion != null && userPromotion.size() > 0) {
            request.setAttribute("promotionList", userPromotion);
            RequestDispatcher rd = request.getRequestDispatcher("/admin/show-promotion.jsp");
            rd.forward(request, response);
//			} else {
//				request.setAttribute("errorMessage", "Error!!!");
//				RequestDispatcher rd = request.getRequestDispatcher("/admin/login.jsp");
//				rd.forward(request, response);
//			}
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("/admin/login.jsp");
            rd.forward(request, response);
            return;

        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        processRequest(request, response);
    }

}
