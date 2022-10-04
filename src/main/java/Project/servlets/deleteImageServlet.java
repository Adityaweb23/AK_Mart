package Project.servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Project.dao.offerimageDao;
import Project.helper.connectionProvider;

/**
 * Servlet implementation class deleteImageServlet
 */
@WebServlet("/deleteImageServlet")
public class deleteImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String img=request.getParameter("imgs");
		String path="pics"+File.separator+img;
		offerimageDao ofd=new offerimageDao(connectionProvider.getConnection());
		if(ofd.deleteImage(img)) {
			helper.deleteFile(path);
//			response.sendRedirect("admin.jsp");
		}else {
			response.sendRedirect("index.jsp");
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
