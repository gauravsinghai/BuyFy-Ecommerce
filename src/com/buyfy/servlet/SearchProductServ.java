// servlet Package
package com.buyfy.servlet;


//Import Files Used In this Program
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.StringTokenizer;
//Importing Javax servlets

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//Importing User Model and controller 

import com.buyfy.controllers.CategoryController;
import com.buyfy.controllers.ProductController;
import com.buyfy.model.Category;
import com.buyfy.model.Product;

/**
 * Servlet implementation class SearchProductServ
 */
@WebServlet("/SearchProductServ")
public class SearchProductServ extends HttpServlet 
{
	// serial version uid
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	// No Argument SearchProductServ Constructor
	public SearchProductServ() 
	{
		super();		
	}

	/*
	 * getProducts get Set of Products and a query to be searched in set of products
	 * and returns Set of Products. This method will check for the query string
	 * tokens separated with space as a delimiter and all the tokens are checked if
	 * the are in the names of given products set.
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		// for all categories
		final String ALL_CATEGORY = "all";
		// Query minimum length should be 3
		final int QUERY_MIN_LENGTH = 3;
		// Set of products to get category related products
		Set<Product> products = new HashSet<>();
		// Set of products to get matched products 
		Set<Product> matchedProducts = new HashSet<>();
		RequestDispatcher rd = null;
		try 
		{
			String search = request.getParameter("search");
			String searchCategory = request.getParameter("category").toLowerCase();
			if (search.length() >= QUERY_MIN_LENGTH) 
			{

				// If User wants to search in all categories
				if (searchCategory.equals(ALL_CATEGORY)) {
					products = new HashSet<Product>(ProductController.getAllProducts());
				}
				// If User wants to search in a particular category
				else 
				{
					// getting category for searching in particular category products
					Category category = CategoryController.getCategoryByName(searchCategory);
					products = category.getProducts();
				}

				// Getting all the Products matched with the user search query
				matchedProducts = getProducts(products, search);
			}
			// setting query as request attribute
			request.setAttribute("query", search);
			// setting matched products as session attribute 
			request.setAttribute("products", matchedProducts);
			// forwarding request to search-disaply.jsp page
			rd = request.getRequestDispatcher("search-display.jsp");
			rd.forward(request, response);

		} 
		// If Any Servlet Exception Occurs Then Redirect To 500 Error Page or Maintenance Page
		catch (Exception ex) 
		{
			ex.printStackTrace();
			response.sendRedirect("500.jsp");
		}
	}
}
