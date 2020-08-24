// Package - servlet

package com.buyfy.servlet;
/*
 * Import Statements used 
 */
//Importing Java IO and Utils 

import java.io.IOException;
import java.io.PrintWriter;
//Importing Javax servlets
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//Importing User Model and controllers 
import com.buyfy.controllers.ProductController;

/**
 * Servlet implementation class DeleteProductServ
 */
@WebServlet("/DeleteProductServ")
public class DeleteProductServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteProductServ() {
        super();
        // TODO Auto-generated constructor stub

    }
    
    // Method to handle GET method request.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      // Set response content type
		response.setContentType("text/html");
		// Allocate a output writer to write the response message into the network socket

		PrintWriter out = response.getWriter();
		try {
			// getting product id from request parameter and parsing it to long 
			long pid = Long.parseLong(request.getParameter("id"));
			// checking if product is deleted
			boolean isDeleted = ProductController.deleteProductById(pid);
			if (isDeleted) {
				//if product deleted
				out.print("true");
			} else {
				out.print("false");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			out.print("false");
		}
	}
}
