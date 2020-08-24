// Package - servlet
package com.buyfy.servlet;

/*
 * Import Statements used 
 */
// Importing Java IO and Utils 
import java.io.IOException;
import java.io.PrintWriter;

//Importing Javax servlets
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//Importing User Model and controllers 

import com.buyfy.controllers.UserController;
import com.buyfy.model.User;

/**
 * Servlet implementation class CheckUserExistServ
 */
@WebServlet("/CheckUserExistServ")
// checking if user exist
public class CheckUserExistServ extends HttpServlet {
	//serial version uid
	private static final long serialVersionUID = 1L;
	
    public CheckUserExistServ() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// Allocate a output writer to write the response message into the network socket

		PrintWriter out = null;
		try {
		      // Set response content type
			response.setContentType("text/html");
			out = response.getWriter();
			String email = request.getParameter("email");
			// set user new details for session
			User user = UserController.getUserByEmail(email);
			// checking user if exist or not
			if(user != null) {
				out.print("true");
			}else {
				out.print("false");
			}
			// If Any Servlet Exception Occurs Then Redirect To 500 Error Page or Maintenance Page

		}catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("500.jsp");
		}
	}
}
