package manager.webapp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import manager.webapp.dao.PromotionHistoryDao;
import manager.webapp.jdbc.connectDB;
import manager.webapp.model.Promotion;
import manager.webapp.model.PromotionHistory;
import manager.webapp.model.Role;
import manager.webapp.model.User;

public class PromotionHistoryDaoImpl extends connectDB implements PromotionHistoryDao {
	private Connection conn;
	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;
	public int insertHistory(PromotionHistory item) {
		int result = 0;

		// get connection
		conn = connectDB.getConnect();

		// query
		String query = "INSERT INTO promotion_history (userId, status, date_update) VALUES (?,?,?);";
						

		try {
			pst = conn.prepareStatement(query);
			pst.setInt(1,item.getUser().getId());
			pst.setString(2,item.getDecription());
			pst.setLong(3,item.getDate_create());
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
	public ArrayList<PromotionHistory> getAll() {
		ArrayList<PromotionHistory> item = new ArrayList<PromotionHistory>();
		// get connection
				conn = connectDB.getConnect();

				// query
				String query = "SELECT promotion_history.id as pID ,userId ,promotion_history.status as decription ,date_update, users.id as id, users.fullname as fullname, users.username as username, users.password as password, users.image as image, users.email as email, users.phone as phone, users.role_id as role_id, users.status as status FROM promotion_history left join users  on userID = users.id; ";
						
				try {
					pst = conn.prepareStatement(query);
					rs = pst.executeQuery();
					while  (rs.next()) {
						int pid = rs.getInt("pid");
						String decription = rs.getString("decription");
						long dateCreate = rs.getLong("date_update");
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
						PromotionHistory pTemp = new PromotionHistory(pid,userTemp,decription, dateCreate);
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
}
