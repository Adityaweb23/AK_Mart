package Project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Project.enteties.user;

public class userDao {
	Connection con;
	public userDao(Connection con) {
		this.con=con;
	}
	
	public boolean saveUser(user user) {
		boolean f=false;
		try {
			String q="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
			PreparedStatement pst=con.prepareStatement(q);
			String uname=user.getUname();
			String email=user.getEmail();
			String password=user.getPassword();
			String gender=user.getGender();
			String about=user.getAbout();
			pst.setString(1, uname);
			pst.setString(2, email);
			pst.setString(3, password);
			pst.setString(4, gender);
			pst.setString(5, about);
			pst.executeUpdate();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
	
	public user getUserByEmailAndPassword(String email,String password) {
		user u=null;
		try {
			String q="select * from user where email=? and password=?";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				u=new user();
				u.setId(rs.getInt("id"));
				u.setUname(rs.getString("name"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				u.setGender(rs.getString("gender"));
				u.setAbout(rs.getNString("about"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	public user getUserbyId(int id){
		user u=null;
		String q="select * from user where id=?";
		try {
			
		PreparedStatement pst=con.prepareStatement(q);
		pst.setInt(1, id);
		ResultSet rs=pst.executeQuery();
		u=new user();
		u.setId(rs.getInt("id"));
		u.setUname(rs.getString("name"));
		u.setEmail(rs.getString("email"));
		u.setPassword(rs.getString("password"));
		u.setGender(rs.getString("gender"));
		u.setAbout(rs.getNString("about"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return u;
	}
	public boolean editUser(user user) {
		boolean f=false;
		String q="update user set name=?,email=?,password=?,about=?,gender=? where id=?";
		try {
			PreparedStatement pst= con.prepareStatement(q);
			pst.setString(1, user.getUname());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());
			pst.setString(4, user.getAbout());
			pst.setString(5, user.getGender());
			pst.setInt(6, user.getId());
			pst.executeUpdate();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}