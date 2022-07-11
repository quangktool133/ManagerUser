package manager.webapp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import manager.webapp.dao.UserDAO;
import manager.webapp.jdbc.connectDB;
import manager.webapp.model.Role;
import manager.webapp.model.User;

public class UserDaoImpl extends connectDB implements UserDAO {
	private Connection conn;
	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;

	@Override
	public User exitUser(String username, String password) {
		User item =null;

		// get connection
		conn = connectDB.getConnect();

		// query
		String query = "select users.id as id, users.fullname as fullname, users.username as username, users.password as password, users.image as image, users.email as email, users.phone as phone, users.role_id as role_id, r.name_role as role, users.status as status from users left join role_user as r on r.id = users.role_id WHERE users.username = ? and users.password = ?;";

		try {
			pst = conn.prepareStatement(query);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if (rs.next()) {
				int id =  rs.getInt("id");
				String fullname = rs.getString("fullname");
				String image = rs.getString("image");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				int role_id = rs.getInt("role_id");
				String role = rs.getString("role");
				Role temp = new Role(role_id,role,"");
				int status = rs.getInt("status");
				item = new User(id,fullname, username,password,image,email,phone,temp,status);			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null && pst != null && conn != null) {
				try {
					rs.close();
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return item;
	}

	@Override
	public ArrayList<User> getAll() {
		
			ArrayList<User> item = new ArrayList<User>();
		// get connection
				conn = connectDB.getConnect();

				// query
				String query = "select users.id as id, users.fullname as fullname, users.username as username, users.password as password, users.image as image, users.email as email, users.phone as phone, users.role_id as role_id, r.name_role as role, users.status as status from users left join role_user as r on r.id = users.role_id;";

				try {
					pst = conn.prepareStatement(query);
					rs = pst.executeQuery();
					while  (rs.next()) {
						int id =  rs.getInt("id");
						String fullname = rs.getString("fullname");
						String image = rs.getString("image");
						String email = rs.getString("email");
						String phone = rs.getString("phone");
						int role_id = rs.getInt("role_id");
						String username = rs.getString("username");
						String password = rs.getString("password");
						String role = rs.getString("role");
						Role temp = new Role(role_id,role,"");
						int status = rs.getInt("status");
						User userTemp = new User(id,fullname, username,password,image,email,phone,temp,status);			
						item.add(userTemp);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if (rs != null && pst != null && conn != null) {
						try {
							rs.close();
							pst.close();
							conn.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
				return item;
	}

	public int addUser(User item) {
		int result = 0;

		// get connection
		conn = connectDB.getConnect();

		// query
		String query = "insert into users(fullname,username, password,image,email,phone,role_id,status) values(?,?,?,?,?,?,?,?);";
						

		try {
			pst = conn.prepareStatement(query);
			pst.setString(1,item.getFullname());
			pst.setString(2,item.getUsername());
			pst.setString(3,item.getPassword());
			pst.setString(4,item.getImage());
			pst.setString(5,item.getEmail());
			pst.setString(6,item.getPhone());
			pst.setInt(7,item.getRole().getId());
			pst.setInt(8,item.getStatus());
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				try {
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		
		return result;
	}

	public User getUserById(int id) {
		User item = null;
		// get connection
				conn = connectDB.getConnect();

				// query
				String query = "select users.id as id, users.fullname as fullname, users.username as username, users.password as password, users.image as image, users.email as email, users.phone as phone, users.role_id as role_id, r.name_role as role, users.status as status from users left join role_user as r on r.id = users.role_id where users.id = ?;";

				try {
					pst = conn.prepareStatement(query);
					pst.setInt(1, id);
					rs = pst.executeQuery();
					if (rs.next()) {
						String fullname = rs.getString("fullname");
						String image = rs.getString("image");
						String email = rs.getString("email");
						String phone = rs.getString("phone");
						String username = rs.getString("username");
						String password = rs.getString("password");
						int role_id = rs.getInt("role_id");
						String role = rs.getString("role");
						Role temp = new Role(role_id,role,"");
						int status = rs.getInt("status");
						item = new User(id,fullname, username,password,image,email,phone,temp,status);			
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if (rs != null && pst != null && conn != null) {
						try {
							rs.close();
							pst.close();
							conn.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
				return item;
	}

	public int updateUser(User item) {
		int result = 0;

		// get connection
		conn = connectDB.getConnect();

		// query
		String query = "UPDATE users SET fullname = ?, username = ?, password = ?,image = ?,phone = ?,email = ?,role_id = ?, status = ? WHERE id = ?;";
						

		try {
			pst = conn.prepareStatement(query);
			pst.setString(1,item.getFullname());
			pst.setString(2,item.getUsername());
			pst.setString(3,item.getPassword());
			
			pst.setString(4,item.getImage());
			pst.setString(5,item.getPhone());
			pst.setString(6,item.getEmail());
			
			pst.setInt(7,item.getRole().getId());
			pst.setInt(8,item.getStatus());
			pst.setInt(9,item.getId());
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				try {
					pst.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		
		return result;
	}

//	public ArrayList<User> getAllWithPromotion() {
//
//		ArrayList<User> item = new ArrayList<User>();
//	// get connection
//			conn = connectDB.getConnect();
//
//			// query
//			String query = "select users.id as id, users.fullname as fullname, users.username as username, users.password as password, users.image as image, users.email as email, users.phone as phone, users.role_id as role_id, r.name_role as role, users.status as status from users left join role_user as r on r.id = users.role_id where users.id not in (select userID  from promotion) and users.status =1; ";
//
//			try {
//				pst = conn.prepareStatement(query);
//				rs = pst.executeQuery();
//				while  (rs.next()) {
//					int id =  rs.getInt("id");
//					String fullname = rs.getString("fullname");
//					String image = rs.getString("image");
//					String email = rs.getString("email");
//					String phone = rs.getString("phone");
//					int role_id = rs.getInt("role_id");
//					String username = rs.getString("username");
//					String password = rs.getString("password");
//					String role = rs.getString("role");
//					Role temp = new Role(role_id,role,"");
//					int status = rs.getInt("status");
//					User userTemp = new User(id,fullname, username,password,image,email,phone,temp,status);			
//					item.add(userTemp);
//				}
//			} catch (SQLException e) {
//				e.printStackTrace();
//			} finally {
//				if (rs != null && pst != null && conn != null) {
//					try {
//						rs.close();
//						pst.close();
//						conn.close();
//					} catch (SQLException e) {
//						e.printStackTrace();
//					}
//				}
//			}
//			return item;
//	}

	public ArrayList<User> searchName(String string) {
		ArrayList<User> item = new ArrayList<User>();
		// get connection
				conn = connectDB.getConnect();

				// query
				String query = "select users.id as id, users.fullname as fullname, users.username as username, users.password as password, users.image as image, users.email as email, users.phone as phone, users.role_id as role_id, r.name_role as role, users.status as status from users left join role_user as r on r.id = users.role_id where users.fullname like ?";

				try {
					pst = conn.prepareStatement(query);
					pst.setString(1, "%"+string+"%");
					rs = pst.executeQuery();
					while  (rs.next()) {
						int id =  rs.getInt("id");
						String fullname = rs.getString("fullname");
						String image = rs.getString("image");
						String email = rs.getString("email");
						String phone = rs.getString("phone");
						int role_id = rs.getInt("role_id");
						String username = rs.getString("username");
						String password = rs.getString("password");
						String role = rs.getString("role");
						Role temp = new Role(role_id,role,"");
						int status = rs.getInt("status");
						User userTemp = new User(id,fullname, username,password,image,email,phone,temp,status);			
						item.add(userTemp);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if (rs != null && pst != null && conn != null) {
						try {
							rs.close();
							pst.close();
							conn.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
				return item;
	}

	public ArrayList<User> searchNameAndRole(String search, int idRole) {
		ArrayList<User> item = new ArrayList<User>();
		// get connection
				conn = connectDB.getConnect();

				// query
				String query = "select users.id as id, users.fullname as fullname, users.username as username, users.password as password, users.image as image, users.email as email, users.phone as phone, users.role_id as role_id, r.name_role as role, users.status as status from users left join role_user as r on r.id = users.role_id where users.fullname like ? and users.role_id = ? ";

				try {
					pst = conn.prepareStatement(query);
					pst.setString(1, "%"+search+"%");
					pst.setInt(2, idRole);
					rs = pst.executeQuery();
					while  (rs.next()) {
						int id =  rs.getInt("id");
						String fullname = rs.getString("fullname");
						String image = rs.getString("image");
						String email = rs.getString("email");
						String phone = rs.getString("phone");
						int role_id = rs.getInt("role_id");
						String username = rs.getString("username");
						String password = rs.getString("password");
						String role = rs.getString("role");
						Role temp = new Role(role_id,role,"");
						int status = rs.getInt("status");
						User userTemp = new User(id,fullname, username,password,image,email,phone,temp,status);			
						item.add(userTemp);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if (rs != null && pst != null && conn != null) {
						try {
							rs.close();
							pst.close();
							conn.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
				return item;
	}

	public boolean checkUserName(String userName) {
		// get connection
				conn = connectDB.getConnect();

				// query
				String query = "select users.id as id, users.fullname as fullname, users.username as username, users.password as password, users.image as image, users.email as email, users.phone as phone, users.role_id as role_id, r.name_role as role, users.status as status from users left join role_user as r on r.id = users.role_id where users.username = ?;";

				try {
					pst = conn.prepareStatement(query);
					pst.setString(1, userName);
					rs = pst.executeQuery();
					if (rs.next()) {
						return true;	
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if (rs != null && pst != null && conn != null) {
						try {
							rs.close();
							pst.close();
							conn.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
				return false;
	}
	

}
