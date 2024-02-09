package entities;

public class BusUser {
	

	public BusUser(int userId, String username, String email, String password, String role) {
		super();
		this.userId = userId;
		this.username = username;
		this.email = email;
		this.password = password;
		this.role= role;
	}
	public BusUser() {
	}
	@Override
	public String toString() {
		return "BusUser [userId=" + userId + ", username=" + username + ", email=" + email + ", password=" + password + ", role= "+ role
				+ "]";
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	//class fields
	int userId;
	String username;
	String email;
	String password;
	String role;
}
