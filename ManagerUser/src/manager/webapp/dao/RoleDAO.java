package manager.webapp.dao;

import java.util.ArrayList;

import manager.webapp.model.Role;

public interface RoleDAO {
	public ArrayList<Role> getAll(); 
	public Role getRole(int role);
	int addRole(Role item);
}
