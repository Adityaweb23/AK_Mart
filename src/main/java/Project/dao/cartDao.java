package Project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class cartDao {
	Connection con;
	public cartDao(Connection con) {
		this.con=con;
	}
	
	public boolean addToCart(int pid,int uid) {
		boolean f=false;
		try {
			String q="insert into cart(pid,uid) values(?,?)";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			pst.execute();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public ArrayList<Integer> getProductsbyUid(int uid){
		ArrayList<Integer> ar=new ArrayList<Integer>();
		try {
			String q="select * from cart where uid=?";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setInt(1, uid);
			ResultSet rs=pst.executeQuery();
			while(rs.next()) {
				int cid=rs.getInt("caid");
				int id=rs.getInt("pid");
				System.out.println(id);
				ar.add(id);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ar;
	}
	
	public boolean removeproduct(int uid,int pid) {
		boolean f=false;
		try {
			String q="delete from cart where pid=? and uid=?";
			PreparedStatement pst=con.prepareStatement(q);
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			pst.execute();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
		
	}
}
