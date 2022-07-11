package manager.webapp.dao;

import java.util.ArrayList;

import manager.webapp.model.User;

public interface UserDAO {
	public User exitUser( String username, String password); 
	public ArrayList<User> getAll(); 
	public User getUserById(int id);
	public int updateUser(User item);
}
