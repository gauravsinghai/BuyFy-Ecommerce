// Model package
package com.buyfy.servlet;

//Import java io IOException
import java.io.IOException;
// Import java Util List
import java.util.List;
// Importing javax servlet files
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
// Importing ProductController
import com.buyfy.controllers.ProductController;
// Importing Product Model
import com.buyfy.model.Product;

/**
 * Servlet implementation class DisplayAllProductsServ
 */
@WebServlet("/DisplayAllProductsServ")
public class DisplayAllProductsServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DisplayAllProductsServ() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// List to get all the products
			List<Product> product = ProductController.getAllProducts();
			HttpSession session = request.getSession();
			session.setAttribute("productsList", product);
			// Dispatching current request to products-table.jsp
			RequestDispatcher rd = request.getRequestDispatcher("products-table.jsp");
			rd.forward(request, response);
		} catch (Exception ex) {
			ex.printStackTrace();
			// Redirecting to error.jsp
			response.sendRedirect("error.jsp");
		}
	}

}
