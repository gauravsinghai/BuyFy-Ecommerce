// Model package
package com.buyfy.servlet;

// Import java io IOException
import java.io.IOException;
// Importing java util List
import java.util.List;
// Importing java servlet files
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
// Importing UserController
import com.buyfy.controllers.UserController;
// Importing User Model
import com.buyfy.model.User;

/**
 * Servlet implementation class DisplayAllUsersServ
 */
@WebServlet("/DisplayAllUsersServ")
public class DisplayAllUsersServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DisplayAllUsersServ() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = null;
		HttpSession httpSession = null;
		try {
			// List to get all the users
			List<User> user = UserController.getAllUsers();
			httpSession = request.getSession();
			httpSession.setAttribute("usersList", user);
			// RequestDispatcher for dispatching current request to users-table.jsp
			rd = request.getRequestDispatcher("users-table.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			response.setContentType("text/html");
			response.getWriter().append("Server Error");
			// RequestDispatcher for dispatching current request to admin-dashboard.html
			rd = request.getRequestDispatcher("admin-dashboard.html");
			rd.include(request, response);
		}
	}
}
