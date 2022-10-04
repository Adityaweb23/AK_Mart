package Project.enteties;

public class user {

	private String uname;
	private int id;
	private String email;
	private String password;
	private String gender;
	private String about;
	private boolean check;
	
	public user() {
		
	}
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public boolean isCheck() {
		return check;
	}

	public void setCheck(boolean check) {
		this.check = check;
	}

	public user(String uname, String email, String password, String about) {
		super();
		this.uname = uname;
		this.email = email;
		this.password = password;
		this.about = about;
	}
	public user(String uname, String email, String password, String gender, String about) {
		super();
		this.uname = uname;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
	}
	public user(int id,String uname, String email, String password, String gender, String about) {
		super();
		this.uname = uname;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.id=id;
	}
}
