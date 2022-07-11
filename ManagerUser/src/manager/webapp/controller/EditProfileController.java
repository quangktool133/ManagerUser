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
 * Servlet implementation class EditUserController
 */
@MultipartConfig
public class EditProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private User user;
	private Role role;
	private UserDaoImpl userDAO;
	private RoleDaoImpl roleDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditProfileController() {
		super();
		user = new User();
		userDAO = new UserDaoImpl();
		role = new Role();
		roleDAO = new RoleDaoImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		User userCurrent = (User) session.getAttribute("userCurrent");
		if (userCurrent != null) {
			ArrayList<Role> roleList = roleDAO.getAll();
			if (roleList != null && roleList.size() > 0) {

				int id = 0;
				try {
					id = Integer.parseInt(request.getParameter("id"));
				} catch (NumberFormatException e) {
					response.sendRedirect(request.getContextPath() + "/admin/login");
					return;
				}
				if (id != 0) {
					User user = userDAO.getUserById(id);
					request.setAttribute("user", user);
					RequestDispatcher rd = request.getRequestDispatcher("/user/editAccount.jsp");
					rd.forward(request, response);
					return;
				}

			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		// get data
		int id = 0;
		try {
			id = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return;
		}
		User userOld = userDAO.getUserById(id);
		String name = request.getParameter("user-name");
		String email = request.getParameter("user-email");
		String phone = request.getParameter("user-phone");
		String userName = request.getParameter("user-userName");
		String password = request.getParameter("user-password");
		int status = userOld.getStatus();
		if (!userOld.getPassword().equals(password)) {
			try {
				password = Common.textToEndcode(password);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		}
		int role = userOld.getRole().getId();
		if (userOld.getId() == id) {
			role = Integer.parseInt(request.getParameter("user-role"));
		}
		Part filePart = request.getPart("user-image");
		Timestamp dateCreate = new Timestamp(new Date().getTime());
		// thư mục chứa file
		String dirPathName = request.getServletContext().getRealPath("/file");
		File dirFile = new File(dirPathName);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}

		// lấy tên file từ part
		String fileName = FileUtil.getName(filePart);
		String picture = "";
		if (fileName.isEmpty()) {
			picture = userOld.getImage();
		} else {

			// đổi tên file
			picture = FileUtil.rename(fileName);
		}

		// đường dẫn file
		String filePathName = dirPathName + File.separator + picture;
//		 Role  cate = roleDAO.getRole(role);
		Role cate = new Role(role, "", "");
		User item = new User(id, name, userName, password, picture, email, phone, cate, status);
		if (userDAO.updateUser(item) > 0) {
			// thành công
			String oldFilePathName = dirPathName + File.separator + userOld.getImage();
			File oldFile = new File(oldFilePathName);
			if (oldFile.exists()) {
				oldFile.delete();
			}
			if (!fileName.isEmpty()) {
				filePart.write(filePathName);
			}
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return;
		} else {
			ArrayList<Role> roleList = roleDAO.getAll();

			RequestDispatcher rd = request.getRequestDispatcher("/admin/login");
			rd.forward(request, response);
		}
	}

}
