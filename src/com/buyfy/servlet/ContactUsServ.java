// servlet Package
package com.buyfy.servlet;

//Import Files Used In this Program 
import java.io.IOException;
//Importing Javax servlets
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//Importing FeedbackDAO Model 

import com.buyfy.dao.FeedbackDAO;
import com.buyfy.dao.FeedbackDAOImpl;

/**
 * Servlet implementation class ContactUsServ
 */
@WebServlet("/ContactUsServ")
public class ContactUsServ extends HttpServlet 
{
	// serial version uid
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	// No Argument ContactUsServ Constructor
    public ContactUsServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		String name = null;
		String email = null;
		String description = null;
		FeedbackDAO dao = null;
		RequestDispatcher rd = null;
		try 
		{
			response.setContentType("text/html");
			//get the name of user
			name = request.getParameter("name");
			//get the mail address of user
			email = request.getParameter("email");
			//get the description
			description = request.getParameter("description");
			dao = new FeedbackDAOImpl();
			rd = request.getRequestDispatcher("contact-us.jsp");
			
			//checking if the feedback is saved
			boolean isFeedbackSaved  = dao.save(name, email, description);
			if(isFeedbackSaved) 
			{
				request.setAttribute("feedbackSent", true);
				rd.include(request, response);
			}
			else 
			{
				request.setAttribute("feedbackSent", false);
				rd.include(request, response);
			}

		}
		// If Any Servlet Exception Occurs Then Redirect To 500 Error Page or Maintenance Page
		catch(Exception ex) 
		{
			ex.printStackTrace();
			response.sendRedirect("500.jsp");
		}
		
	}

}
