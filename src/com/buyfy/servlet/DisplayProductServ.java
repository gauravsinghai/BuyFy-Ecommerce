//Model package
package com.buyfy.servlet;
// Import java io IOException
import java.io.IOException;
// Importing javax servlet files
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// Import ProductController
import com.buyfy.controllers.ProductController;
// Importing Product Model
import com.buyfy.model.Product;

/**
 * Servlet implementation class DisplayProduct
 */
@WebServlet("/DisplayProductServ")
public class DisplayProductServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DisplayProductServ() {	super();	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		// Getting product Id from request object and parsing it to long
		long pid = Long.parseLong(request.getParameter("id"));
		// Getting User by userId 
		Product product = ProductController.getProductById(pid);
		request.setAttribute("product", product);
		// RequestDispatcher for dispatching current request to product-display.jsp
		RequestDispatcher rd = request.getRequestDispatcher("product-display.jsp");
		rd.forward(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			// Redirecting request to 500.jsp
			response.sendRedirect("500.jsp");
		}
	}

}
