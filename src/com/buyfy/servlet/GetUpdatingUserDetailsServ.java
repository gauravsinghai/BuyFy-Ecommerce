// servlet Package
package com.buyfy.servlet;

//Import Files Used In this Program
import java.io.IOException;
//Importing Javax servlets

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//Importing User Model and controller 

import com.buyfy.controllers.UserController;
import com.buyfy.model.User;

/**
 * Servlet implementation class GetUpdatingUserDetailsServ
 */
@WebServlet("/GetUpdatingUserDetailsServ")
public class GetUpdatingUserDetailsServ extends HttpServlet 
{
	// serial version uid
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	// No Argument GetUpdatingUserDetailsServ Constructor
	public GetUpdatingUserDetailsServ() 
	{
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		RequestDispatcher rd = null;
		try 
		{
			//getting user id from request parameter and parsing it to an integer
			long id = Integer.parseInt(request.getParameter("uid"));
			//get user by id
			User user = UserController.getUserById(id);
			// setting user as a request attribute
			request.setAttribute("user", user);
			// forwarding request to update-user.jsp
			rd = request.getRequestDispatcher("update-user.jsp");
			rd.forward(request, response);

		} 
		// If Any Servlet Exception Occurs Then Redirect To 500 Error Page or Maintenance Page
		catch (Exception e) 
		{
			e.printStackTrace();
			response.sendRedirect("500.jsp");
		}
	}
}
