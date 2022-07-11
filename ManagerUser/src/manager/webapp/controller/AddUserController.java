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

import manager.webapp.dao.impl.RoleDaoImpl;
import manager.webapp.dao.impl.UserDaoImpl;
import manager.webapp.model.Role;
import manager.webapp.model.User;
import manager.webbapp.util.Common;
import manager.webbapp.util.FileUtil;

/**
 * Servlet implementation class AddUser
 */
@MultipartConfig
public class AddUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private User user;
	private Role role;
	private UserDaoImpl userDAO;   
	private RoleDaoImpl roleDAO;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserController() {
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
				RequestDispatcher rd = request.getRequestDispatcher("/admin/adduser.jsp");
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
		request.setCharacterEncoding("UTF-8");
		//get data
		
		 String name = request.getParameter("user-name");
		 String email = request.getParameter("user-email");
		 String phone = request.getParameter("user-phone");
		 String userName = request.getParameter("user-userName");
		 String password = request.getParameter("user-password");
		 
		 if(!userDAO.checkUserName(userName)) {
		 try {
				password = Common.textToEndcode(password);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		 int role = Integer.parseInt(request.getParameter("user-role"));
		 Part filePart = request.getPart("user-image");
		 Timestamp dateCreate = new Timestamp(new Date().getTime());
		 //thư mục chứa file
		 String dirPathName = request.getServletContext().getRealPath("/file");
		 File dirFile = new File (dirPathName);
		 if (!dirFile.exists()) {
			 dirFile.mkdirs();
		 }
		 
		 //lấy tên file từ part
		 String fileName = FileUtil.getName(filePart);
		 //đổi tên file
		 String picture = FileUtil.rename(fileName);
		 // đường dẫn file
		 String filePathName = dirPathName + File.separator+ picture;
		 System.out.println(filePathName);
//		 Role  cate = roleDAO.getRole(role);
		 Role  cate = new Role(role,"","");
		 User item = new User(0, name, userName, password, picture, email, phone, cate, 1);
		 if (userDAO.addUser(item) > 0) {
			 //thành công
			 //ghi file
			 if(!fileName.isEmpty()) {
				 filePart.write(filePathName);
			 }
			 response.sendRedirect(request.getContextPath() +"/admin/user?msg=1");
				return;
		 } else {
			 ArrayList<Role> roleList = roleDAO.getAll();
			 request.setAttribute("listRole", roleList);
				
				RequestDispatcher rd = request.getRequestDispatcher("/admin/user/add");
				rd.forward(request, response);
		 }
		 } else {
			 response.sendRedirect(request.getContextPath() +"/admin/user/add?msg=1");
				return;
		 }
	}

}
