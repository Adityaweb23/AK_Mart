package Project.servlets;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Project.dao.offerimageDao;
import Project.helper.connectionProvider;

/**
 * Servlet implementation class offerSectionServlet
 */
@MultipartConfig
@WebServlet("/offerSectionServlet")
public class offerSectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public offerSectionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part ppic=request.getPart("ppic");
		String path=request.getRealPath("/")+"pics"+File.separator+ppic.getSubmittedFileName();
		offerimageDao ofd=new offerimageDao(connectionProvider.getConnection());
		if(ofd.saveImage(ppic.getSubmittedFileName())) {
			helper.saveImage(ppic.getInputStream(), path);
			response.sendRedirect("admin.jsp");
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
