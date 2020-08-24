// Package servlet
package com.buyfy.servlet;

// importing java IO
import java.io.IOException;
import java.io.PrintWriter;

// importing javax.servlet
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//importing product controllers
import com.buyfy.controllers.ProductController;

/**
 * Servlet implementation class AddProdReviewServ
 */
@WebServlet("/AddProdReviewServ")
public class AddProdReviewServ extends HttpServlet {
	// serial version uid
	private static final long serialVersionUID = 1L;

    public AddProdReviewServ() {
        super();
     // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = null;
		try {
		      // Set response content type
			response.setContentType("text/html");
			out = response.getWriter();
			long uid = Long.parseLong(request.getParameter("uid"));
			long pid = Long.parseLong(request.getParameter("pid"));
			String review = request.getParameter("reviewMsg");
			boolean reviewAdded = ProductController.addReview(pid, review, uid);
			// checking if review is added
			
			if(reviewAdded) {
				out.print("true");
			}else {
				out.print("false");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			out.print("false");
		}
	}
}
