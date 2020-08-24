package com.buyfy.servlet;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyfy.controllers.ProductController;
import com.buyfy.model.Product;

/**
 * Servlet implementation class SearchProdAdminServ
 */
@WebServlet("/SearchProdAdminServ")
public class SearchProdAdminServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProdAdminServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/*
	 * getProducts get Set of Products and a query to be searched in set of products
	 * and returns Set of Products. This method will check for the query string
	 * tokens separated with space as a delimiter and all the tokens are checked if
	 * they are in the names of given products set.
	 */
	public Set<Product> getProducts(Set<Product> products, String query) 
	{
		Set<Product> prodSet = new HashSet<>();
		//searching products
		for (Product p : products) 
		{
			String prodName = p.getName().toLowerCase();
			StringTokenizer qt = new StringTokenizer(query, " ");
			while (qt.hasMoreTokens()) 
			{
				String token = qt.nextToken().toLowerCase();
				if (prodName.contains(token) && token.length() > 2) 
				{
					prodSet.add(p);
					break;
				}
			}
		}
		return prodSet;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = null;
		// Set of products to store all products
		Set<Product> products = new HashSet<>();
		// Set of products to store matched products 
		Set<Product> matchedProducts = new HashSet<>();
		// RequestDisaptcher to dispatch request to search-prod-admin-table.jsp
		RequestDispatcher rd = null;
		try {
			search = request.getParameter("search");
			products = new HashSet<Product>(ProductController.getAllProducts());
			// Getting all the Products matched with the user search query
			matchedProducts = getProducts(products, search);
			// setting query as request attribute
			request.setAttribute("query", search);
			// setting matched products as session attribute 
			request.setAttribute("adminsearchproducts", matchedProducts);
			// forwarding request to search-prod-admin-table.jsp page
			rd = request.getRequestDispatcher("search-prod-admin-table.jsp");
			rd.forward(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("500.jsp");
		}
	}

}
