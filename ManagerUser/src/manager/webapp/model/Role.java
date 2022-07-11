package manager.webapp.model;

public class Role {
	private int id;
	private String role;
	private String descriptions;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public Role() {
		super();
	}

	public Role(int id, String role, String descriptions) {
		super();
		this.id = id;
		this.role = role;
		this.descriptions = descriptions;
	}

}
