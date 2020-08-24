// Model package
package com.buyfy.servlet;

// Import IO statement for the program
import java.io.IOException;
//Import java statements for the program
import java.util.LinkedList;
import java.util.List;
// Importing javax servlet files
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
// Importing UserController
import com.buyfy.controllers.UserController;
// Importing Order Model
import com.buyfy.model.Order;

/**
 * Servlet implementation class DisplayAllOrdersServ
 */
@WebServlet("/DisplayAllOrdersServ")
public class DisplayAllOrdersServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayAllOrdersServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// Linked List of Orders to get all the orders related to the User
		List<Order> orders = new LinkedList<>();
		// Creating HTTP Session variable
		HttpSession httpSession = null;
		RequestDispatcher rd = null; 
		try {
			httpSession = request.getSession();
			long userId = (long) httpSession.getAttribute("id");
			orders = UserController.getUserOrdersByUserId(userId);
			request.setAttribute("orders", orders);
			// RequestDispatcher for dispatching current request to my-order.jsp
			rd = request.getRequestDispatcher("my-order.jsp");
			rd.forward(request, response);
		}catch(Exception ex) {
			ex.printStackTrace();
			// Redirecting request to error.jsp
			response.sendRedirect("error.jsp");
		}
	}

}
