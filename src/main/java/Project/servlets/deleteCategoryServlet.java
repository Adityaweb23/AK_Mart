package Project.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project.dao.categoriesDao;
import Project.helper.connectionProvider;

/**
 * Servlet implementation class deleteCategoryServlet
 */
@WebServlet("/deleteCategoryServlet")
public class deleteCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCategoryServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("ids"));
		categoriesDao cad=new categoriesDao(connectionProvider.getConnection());
		if(cad.deleteCategory(id)) {
			System.out.println("it's Done");
		}else {
			response.sendRedirect("index.jsp");
		}
	}
}
