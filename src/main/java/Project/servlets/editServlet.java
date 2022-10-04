package Project.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Project.dao.userDao;
import Project.enteties.user;
import Project.helper.connectionProvider;


@WebServlet("/editServlet")
public class editServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public editServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession s=request.getSession();
		userDao usd=new userDao(connectionProvider.getConnection());
		int k=Integer.parseInt(request.getParameter("uid"));
		user u=(user)s.getAttribute("currentUser");
		int id=k;
		String uname=request.getParameter("uname");
		String uemail=request.getParameter("email");
		String upassword=request.getParameter("password");
		String gender=request.getParameter("gender");
		String about=request.getParameter("about");
		u.setId(id);
		u.setUname(uname);
		u.setEmail(uemail);
		u.setPassword(upassword);
		u.setGender(gender);
		u.setAbout(about);
		if(usd.editUser(u)) {
			s.setAttribute("succesmsg", "Your Details Updated Succesfully");
			response.sendRedirect("index.jsp");
		}else {
			s.setAttribute("errormsg", "Something Went Wrong");
			response.sendRedirect("index.jsp");
		}
	}
}
