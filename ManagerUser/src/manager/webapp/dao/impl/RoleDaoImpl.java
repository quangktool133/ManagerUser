package manager.webapp.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import manager.webapp.dao.RoleDAO;
import manager.webapp.jdbc.connectDB;

import manager.webapp.model.Role;
import manager.webapp.model.User;

public class RoleDaoImpl extends connectDB implements RoleDAO {
	private Connection conn;
	private PreparedStatement pst;
	private Statement st;
	private ResultSet rs;
	
	@Override
	public ArrayList<Role> getAll() {
		ArrayList<Role> item = new ArrayList<Role>();
		// get connection
				conn = connectDB.getConnect();

				// query
				String query = "select id, name_role, decription from role_user;";

				try {
					pst = conn.prepareStatement(query);
					rs = pst.executeQuery();
					while  (rs.next()) {
						int id =  rs.getInt("id");
						String role = rs.getString("name_role");
						String decription = rs.getString("decription");
						Role temp = new Role(id,role,decription);
						item.add(temp);
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

	public Role getRole(int role) {
		Role item =null;

		// get connection
		conn = connectDB.getConnect();

		// query
		String query = "select  name_role, decription from role_user where id = ?;";

		try {
			pst = conn.prepareStatement(query);
			pst.setInt(1, role);
			rs = pst.executeQuery();
			if (rs.next()) {
				String roleName = rs.getString("name_role");
				String decription = rs.getString("decription");
				 item = new Role(role,roleName,decription);
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

	public int addRole(Role item) {
		int result = 0;

		// get connection
		conn = connectDB.getConnect();

		// query
		String query = "insert into role_user(name_role, decription) values(?,?);";
						

		try {
			pst = conn.prepareStatement(query);
			pst.setString(1,item.getRole());
			pst.setString(2,item.getDescriptions());
			
			
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

	public int editRole(Role item) {
		int result = 0;

		// get connection
		conn = connectDB.getConnect();

		// query
		String query = "UPDATE role_user SET name_role = ?, decription = ? WHERE id = ?;";
						

		try {
			pst = conn.prepareStatement(query);
			pst.setString(1,item.getRole());
			pst.setString(2,item.getDescriptions());
			pst.setInt(3,item.getId());
			
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
		String query = "DELETE  FROM role_user WHERE id = ?";

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




}
