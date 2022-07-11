package manager.webapp.model;

import java.sql.Timestamp;

public class PromotionHistory {
	private int id;
	private User user;
	private String decription;
	private long date_create;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getDecription() {
		return decription;
	}

	public void setDecription(String decription) {
		this.decription = decription;
	}

	public long getDate_create() {
		return date_create;
	}

	public void setDate_create(long date_create) {
		this.date_create = date_create;
	}

	public PromotionHistory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PromotionHistory(int id, User user, String decription, long date_create) {
		super();
		this.id = id;
		this.user = user;
		this.decription = decription;
		this.date_create = date_create;
	}

	
}
