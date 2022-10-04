package Project.dao;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Project.enteties.product;

public class productDao {
	private Connection con;
	public productDao(Connection con) {
		this.con=con;
	}
	public boolean addProduct(product p) {
		boolean f=false;
		String q="insert into product(ptitle,pprice,pdescription,pimage,cid) values(?,?,?,?,?)";
		try {
			PreparedStatement pst=con.prepareStatement(q);
			pst.setString(1, p.getPtitle());
			pst.setInt(2, p.getPrice());
			pst.setString(3, p.getPdescription());
			pst.setString(4, p.getPimage());
			pst.setInt(5, p.getCid());
			pst.executeUpdate();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public ArrayList<product> getProducts(){
		ArrayList<product> al=new ArrayList<product>();
		try {
			String q="select * from product";
			PreparedStatement pst=con.prepareStatement(q);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				product p=new product();
				p.setPid(rs.getInt("pid"));
				p.setCid(rs.getInt("cid"));
				p.setPtitle(rs.getString("ptitle"));
				p.setPdescription(rs.getString("pdescription"));
				p.setPimage(rs.getString("pimage"));
				p.setPrice(rs.getInt("pprice"));
				al.add(p);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	public ArrayList<product> getProductsbyId(int id){
		ArrayList<product> al=new ArrayList<product>();
		try {
			String q="select * from product where pid=?";
			PreparedStatement pst=con.prepareStatement(q);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				product p=new product();
				p.setPid(rs.getInt("pid"));
				p.setCid(rs.getInt("cid"));
				p.setPtitle(rs.getString("ptitle"));
				p.setPdescription(rs.getString("pdescription"));
				p.setPimage(rs.getString("pimage"));
				p.setPrice(rs.getInt("pprice"));
				al.add(p);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	public boolean deleteProduct(int pid) {
		boolean f=false;
		try {
			String q="delete from product where pid=?";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setInt(1, pid);
			f=pst.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public product getproductById(int i) {
		product p=new product();
		try {
			String q="select * from product where pid=?";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setInt(1, i);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				p.setPid(rs.getInt("pid"));
				p.setCid(rs.getInt("cid"));
				p.setPtitle(rs.getString("ptitle"));
				p.setPdescription(rs.getString("pdescription"));
				p.setPimage(rs.getString("pimage"));
				p.setPrice(rs.getInt("pprice"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return p;
	}
}
