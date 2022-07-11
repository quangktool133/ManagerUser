package manager.webapp.model;

public class Promotion {
	private int id;

	private User user;
	
	private int rank;

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

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public Promotion() {
		super();
	}


	public Promotion(int id, User user, int rank) {
		super();
		this.id = id;
		this.user = user;
		this.rank = rank;
	}

}
