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
 * Servlet implementation class DisplayUserServ
 */
@WebServlet("/DisplayUserServ")
public class DisplayUserServ extends HttpServlet 
{
	// serial version uid
	private static final long serialVersionUID = 1L;
    
	/**
     * @see HttpServlet#HttpServlet()
     */
	// No Argument DisplayUserServ Constructor
	public DisplayUserServ() 
	{	
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		RequestDispatcher rd = null;
		try 
		{
			// getting user id from request parameter and parsing it to an integer
			long id = Integer.parseInt(request.getParameter("uid"));
			//get the user by id
			User user = UserController.getUserById(id);
			// setting user as request attribute 
			request.setAttribute("user", user);
			// forwarding request to user-dispaly.jsp
			rd = request.getRequestDispatcher("user-display.jsp");
			rd.forward(request, response);
		}
		// If Any Servlet Exception Occurs Then Redirect To error Page or Maintenance Page
		catch(Exception e) 
		{
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
}
