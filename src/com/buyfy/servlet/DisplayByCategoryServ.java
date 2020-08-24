// Package servlet
package com.buyfy.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyfy.controllers.CategoryController;
import com.buyfy.model.Category;

/**
 * Servlet implementation class DisplayByCategoryServ
 */
@WebServlet("/DisplayByCategoryServ")
public class DisplayByCategoryServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayByCategoryServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			// Getting category type from request object
			String categoryType  = request.getParameter("cat");
			// Getting all the products related with category type
			Category cat = CategoryController.getCategoryByName(categoryType);
			// Setting product as request attribute
			request.setAttribute("products", cat.getProducts());
			// Setting Category Type as request attribute
			request.setAttribute("query", categoryType);
			// forwarding request to search-disaply.jsp page
			RequestDispatcher rd = request.getRequestDispatcher("search-display.jsp");
			rd.forward(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("500.jsp");
		}
	}

}
