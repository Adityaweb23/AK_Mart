package Project.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project.dao.userDao;
import Project.enteties.user;
import Project.helper.connectionProvider;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public registerServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String uname=request.getParameter("uname");
		String uemail=request.getParameter("email");
		String upassword=request.getParameter("password");
		String gender=request.getParameter("gender");
		String about=request.getParameter("about");
		user user=new user(uname, uemail, upassword, gender, about);
		try {
			
			try {
				userDao ud=new userDao(connectionProvider.getConnection());
				if(ud.saveUser(user)) {
					response.sendRedirect("login.jsp");
					out.println("done");
				}else {
					
					response.sendRedirect("errorpage.jsp");
					out.println("someting went wrong");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
