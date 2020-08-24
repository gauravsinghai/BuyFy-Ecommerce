// Model package
package com.buyfy.servlet;

// Importing Java IO and Utils
import java.io.IOException;
import java.util.List;
// Importing Javax servlet files
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// Importing FeedbackDAO and FeedbackDAOImpl
import com.buyfy.dao.FeedbackDAO;
import com.buyfy.dao.FeedbackDAOImpl;
// Importing Feedback Model
import com.buyfy.model.Feedback;

/**
 * Servlet implementation class DisplayAllFeedback
 */
@WebServlet("/DisplayAllFeedback")
public class DisplayAllFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DisplayAllFeedback() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Linked List of Feedbacks to get all the feedbacks related to the User
		List<Feedback> feedbacks = null;
		FeedbackDAO dao = null;
		RequestDispatcher rd = null;
		try {
			dao = new FeedbackDAOImpl();
			feedbacks = dao.getAllFeedbacks();
			request.setAttribute("feedbacks", feedbacks);
			// RequestDispatcher for dispatching current request to feedbacks-display.jsp
			rd = request.getRequestDispatcher("feedbacks-display.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			response.setContentType("text/html");
			response.getWriter().append("Server Error");
			// RequestDispatcher for dispatching current request to admin-dashboard.html
			rd = request.getRequestDispatcher("admin-dashboard.html");
			rd.include(request, response);
		}
	}
}
