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

import Project.dao.productDao;
import Project.enteties.product;
import Project.helper.connectionProvider;

/**
 * Servlet implementation class addProductServlet
 */
@MultipartConfig
@WebServlet("/addProductServlet")
public class addProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addProductServlet() {
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
			int cid=Integer.parseInt(request.getParameter("cid"));
			String ptitle=request.getParameter("ptitle");
			int pprice=Integer.parseInt(request.getParameter("pprice"));
			Part pimage=request.getPart("pimage");
			String pdescription=request.getParameter("pdescription");
			product p=new product(ptitle,pprice,pdescription,pimage.getSubmittedFileName(),cid);
			String path=request.getRealPath("/")+"productpic"+File.separator+pimage.getSubmittedFileName();
			productDao pd=new productDao(connectionProvider.getConnection());
			if(pd.addProduct(p)) {
				helper.saveImage(pimage.getInputStream(), path);
				response.sendRedirect("admin.jsp");
			}else {
				response.sendRedirect("index.jsp");
				
			}
	}

}
