package Project.servlets;

import java.io.*;
import java.sql.Connection;

public class helper {
	
	public static boolean deleteFile(String path) {
		 boolean f=false;
		 try {
			File file=new File(path);
			 f=file.delete();
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return f;
	 }
	public static boolean saveImage(InputStream is,String path) {
		boolean f=false;
		try {
			byte[] b=new byte[is.available()];
			b=is.readAllBytes();
			FileOutputStream fis=new FileOutputStream(path);
			fis.write(b);
			fis.flush();
			fis.close();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
