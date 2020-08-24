// Package servlet
package com.buyfy.servlet;

/*
 * Import Statements used 
 */
// Importing Java IOException
import java.io.IOException;
// Importing Javax Servlets 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class LogoutServ
 */
@WebServlet("/LogoutServ")
public class LogoutServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServ() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// Getting HttpSession for invalidating session
			HttpSession httpSession = request.getSession();
			
			// removing all attributes of session
			httpSession.removeAttribute("id");
			httpSession.removeAttribute("email");
			httpSession.removeAttribute("firstName");
			httpSession.removeAttribute("lastName");
			httpSession.removeAttribute("userType");
			httpSession.removeAttribute("cart");
			// Invalidating session
			httpSession.invalidate();
			// redirection to index.jsp
			response.sendRedirect("index.jsp");
		}catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("500.jsp");
		}
		
	}
}
