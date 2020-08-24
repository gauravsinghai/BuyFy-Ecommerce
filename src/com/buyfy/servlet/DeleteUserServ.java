// Package - servlet

package com.buyfy.servlet;

/*
 * Import Statements used 
 */
// Importing Java IO and Utils 
import java.io.IOException;
import java.io.PrintWriter;
//Importing Javax servlets

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//Importing File Uploads 

import com.buyfy.controllers.UserController;

/**
 * Servlet implementation class DeleteUserServ
 */
@WebServlet("/DeleteUserServ")
public class DeleteUserServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteUserServ() {
		super();
        // TODO Auto-generated constructor stub

	}
	 // Method to handle GET method request.
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	      // Set response content type
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			// getting user id from request parameter and parsing it to long 

			long uid = Long.parseLong(request.getParameter("uid"));
			//checking if user is deleted
			System.out.println("ID >>" + uid);
			boolean isDeleted = UserController.deleteUserById(uid);
			System.out.println("STATUS : >"+isDeleted);
			if (isDeleted) {
				
				out.print("true");
			} else {
				out.print("false");
			}
		} catch (Exception e) {
			out.print("false");
		}
	}
}
