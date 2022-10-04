package Project.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class connectionProvider {
	public static Connection con;
	
	public static Connection getConnection() {
		
		try {
			if(con==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kallu_ecommerce" ,"root" ,"root@123");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return con;
		
	}
}
