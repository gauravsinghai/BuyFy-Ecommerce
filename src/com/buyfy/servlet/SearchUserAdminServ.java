// Package servet
package com.buyfy.servlet;
// importing java io and utils files
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.StringTokenizer;
// importing javax servlet files
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// importing user controller
import com.buyfy.controllers.UserController;
// importing user model
import com.buyfy.model.User;

/**
 * Servlet implementation class SearchUserAdminServ
 */
@WebServlet("/SearchUserAdminServ")
public class SearchUserAdminServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchUserAdminServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	public Set<User> getUsers(Set<User> users, String query) 
	{
		Set<User> userSet = new HashSet<>();
		//searching products
		for (User u : users) 
		{
			String username = u.getFirstName().toLowerCase()+u.getLastName().toLowerCase();
			StringTokenizer qt = new StringTokenizer(query, " ");
			while (qt.hasMoreTokens()) 
			{
				String token = qt.nextToken().toLowerCase();
				if (username.contains(token) && token.length() > 2) 
				{
					userSet.add(u);
					break;
				}
			}
		}
		return userSet;
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = null;
		// Set of users to store all users
		Set<User> users = new HashSet<>();
		// Set of products for storing matched user result
		Set<User> matchedUsers = new HashSet<>();
		// RequestDisaptcher to dispatch request to search-user-admin-table.jsp
		RequestDispatcher rd = null;
		try {
			search = request.getParameter("username");
			users = new HashSet<User>(UserController.getAllUsers());
			// Getting all the Users matched with the admin search query
			matchedUsers = getUsers(users, search);
			// setting query as request attribute
			request.setAttribute("query", search);
			// setting matched users as session attribute 
			request.setAttribute("adminsearchusers", matchedUsers);
			// forwarding request to search-user-admin-table.jsp page
			rd = request.getRequestDispatcher("search-user-admin-table.jsp");
			rd.forward(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("500.jsp");
		}
	}
}
