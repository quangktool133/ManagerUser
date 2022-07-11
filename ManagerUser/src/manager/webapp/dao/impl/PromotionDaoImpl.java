package manager.webapp.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import manager.webapp.dao.PromotionDAO;
import manager.webapp.jdbc.connectDB;
import manager.webapp.model.Promotion;
import manager.webapp.model.Role;
import manager.webapp.model.User;

public class PromotionDaoImpl extends connectDB implements PromotionDAO{
	private Connection conn;
	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;
	@Override
	public ArrayList<Promotion> getAll() {
		ArrayList<Promotion> item = new ArrayList<Promotion>();
		// get connection
				conn = connectDB.getConnect();

				// query
				String query = "select p.id as pid, p.promotion as promotion, users.id as id, users.fullname as fullname, users.username as username, users.password as password, users.image as image, users.email as email, users.phone as phone, users.role_id as role_id, users.status as status from promotion as p left join users  on p.userID = users.id;";
						
				try {
					pst = conn.prepareStatement(query);
					rs = pst.executeQuery();
					while  (rs.next()) {
						int pid = rs.getInt("pid");
						int promotion = rs.getInt("promotion");
						int id =  rs.getInt("id");
						String fullname = rs.getString("fullname");
						String image = rs.getString("image");
						String email = rs.getString("email");
						String phone = rs.getString("phone");
						int role_id = rs.getInt("role_id");
						String username = rs.getString("username");
						String password = rs.getString("password");
						Role temp = new Role(role_id,"","");
						int status = rs.getInt("status");
						User userTemp = new User(id,fullname, username,password,image,email,phone,temp,status);		
						Promotion pTemp = new Promotion(pid, userTemp, promotion);
						item.add(pTemp);
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
	public int addPromotion(Promotion item) {
		int result = 0;

		// get connection
		conn = connectDB.getConnect();

		// query
		String query = "insert into promotion(userID, promotion) values(?,?);";
						

		try {
			pst = conn.prepareStatement(query);
			pst.setInt(1,item.getUser().getId());
			pst.setInt(2,item.getRank());
			
			
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
	public Promotion getById(int id) {
		Promotion item =null;

		// get connection
		conn = connectDB.getConnect();


		// query
		String query = "select p.id as pid, p.promotion as promotion, users.id as id, users.fullname as fullname, users.username as username, users.password as password, users.image as image, users.email as email, users.phone as phone, users.role_id as role_id, users.status as status from promotion as p left join users  on p.userID = users.id;";
				
		try {
			pst = conn.prepareStatement(query);
			rs = pst.executeQuery();
			while  (rs.next()) {
				int pid = rs.getInt("pid");
				int uid = rs.getInt("id");
				int promotion = rs.getInt("promotion");
				String fullname = rs.getString("fullname");
				String image = rs.getString("image");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				int role_id = rs.getInt("role_id");
				String username = rs.getString("username");
				String password = rs.getString("password");
				Role temp = new Role(role_id,"","");
				int status = rs.getInt("status");
				User userTemp = new User(uid,fullname, username,password,image,email,phone,temp,status);		
				 item = new Promotion(pid, userTemp, promotion);
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
	public int editPromtion(int id, int promotion) {
		int result = 0;

		// get connection
		conn = connectDB.getConnect();

		// query
		String query = "UPDATE promotion SET promotion = ? WHERE id = ?";
						

		try {
			pst = conn.prepareStatement(query);
			pst.setInt(1,promotion);
			pst.setInt(2,id);
			
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
	public int delItem(int id) {
		int result = 0;
		// get connection
		conn = connectDB.getConnect();

		// query
		String query = "DELETE  FROM promotion WHERE id = ?";

		try {
			pst = conn.prepareStatement(query);
			pst.setInt(1, id);
			result = pst.executeUpdate();
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
		return result;
	}
	public boolean checkExit(int idUser) {
		// get connection
				conn = connectDB.getConnect();

		// query
		String query = "SELECT * FROM promotion WHERE userID= ?";

		try {
			pst = conn.prepareStatement(query);
			pst.setInt(1, idUser);
			rs  = pst.executeQuery();
			if(rs.next()) {
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null && st != null && conn != null) {
				try {
					rs.close();
					st.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
return false;
	}
	

}
