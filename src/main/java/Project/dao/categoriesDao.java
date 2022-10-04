package Project.dao;

import java.sql.Connection;
import java.sql.*;
import java.util.ArrayList;

import Project.enteties.categories;

public class categoriesDao {
private Connection con;
	public categoriesDao(Connection con){
		this.con=con;
	}
	
	public ArrayList<categories> getAllCategories(){
		ArrayList<categories> ai=new ArrayList<categories>();
		try {
			String q="select * from categories";
			PreparedStatement pst=con.prepareStatement(q);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				categories cat=new categories();
				cat.setCid(rs.getInt("cid"));
				cat.setCname(rs.getString("name"));
				cat.setCdescription(rs.getString("description"));
				ai.add(cat);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return ai;
	}
	
	public boolean saveCategory(categories c) {
		boolean f=false;
		try {
			
		String q="insert into categories(name,description) values(?,?)";
		PreparedStatement pst=con.prepareStatement(q);
		pst.setString(1, c.getCname());
		pst.setString(2, c.getCdescription());
		pst.executeUpdate();
		f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public boolean deleteCategory(int cid) {
		boolean f=false;
		try {
			
		String q="delete from categories where cid=?";
		PreparedStatement pst=con.prepareStatement(q);
		pst.setInt(1, cid);
		f=pst.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
}
