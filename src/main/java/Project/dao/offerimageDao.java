package Project.dao;

import java.sql.*;
import java.util.ArrayList;

public class offerimageDao {
	Connection con;
	
	public offerimageDao(Connection con) {
		this.con=con;
	}
	
	public boolean saveImage(String img) {
		boolean f=false;
		try {
			String q="insert into images(image) values(?)";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setString(1, img);
			pst.executeUpdate();
			f=true;
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean deleteImage(String img) {
		boolean f=false;
		try {
			String q="delete from images where image=?";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setString(1, img);
			f=pst.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
	public ArrayList<String> getImages(){
		ArrayList<String> arr=new ArrayList<String>();
		try {
			String q="select * from images";
			PreparedStatement pst=con.prepareStatement(q);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				String s=rs.getString("image");
				arr.add(s);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
}
