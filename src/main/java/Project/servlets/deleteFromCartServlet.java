package Project.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project.dao.cartDao;
import Project.helper.connectionProvider;

/**
 * Servlet implementation class deleteFromCartServlet
 */
@WebServlet("/deleteFromCartServlet")
public class deleteFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteFromCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid=Integer.parseInt(request.getParameter("pid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		cartDao cdao=new cartDao(connectionProvider.getConnection());
		PrintWriter out=response.getWriter();
		if(cdao.removeproduct(uid, pid)) {
			out.println("done");
		}else {
			out.println("something went wrong");
		}
	}

}
