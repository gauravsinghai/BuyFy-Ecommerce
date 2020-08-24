// servlet Package
package com.buyfy.servlet;

//Import Files Used In this Program
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
//Importing Javax servlets

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//Importing User Model and controller 
import com.buyfy.controllers.ProductController;
import com.buyfy.model.Product;

/**
 * Servlet implementation class ProductDescriptionServ
 */
@WebServlet("/ProductDescriptionServ")
public class ProductDescriptionServ extends HttpServlet 
{
	// serial version uid
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	// No Argument ProductDescriptionServ Constructor
    public ProductDescriptionServ() 
    {
        super();
    }

    // Importing User Model 

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// setting MIME type 
		response.setContentType("text/html");
		// PrintWriter for sending response back
		PrintWriter out = response.getWriter();
		// BufferedReader for reading data from Product description files 
		BufferedReader br = null;
		try 
		{
			//getting user id from request parameter and parsing it to an integer
			long id = Long.parseLong(request.getParameter("id"));
			//get the product by id
			Product product = ProductController.getProductById(id);
			// Absolute Path for product description
			final String PROD_DESC_REL_PATH = "/details/products/description/";
			// Absolute Path for product description
			final String PROD_DESC_ABS_PATH = getServletContext().getRealPath(PROD_DESC_REL_PATH);
			// File object for Product Description txt file
			File f = new File(PROD_DESC_ABS_PATH+product.getDescription());
			// FileReader for reading description of products from their files
			FileReader fr = new FileReader(f);
			br = new BufferedReader(fr);
			// Creating StringBuilder
			StringBuilder sb = new StringBuilder("");
			String str;
			// writing all the data in sb
			while((str = br.readLine())!= null) 
			{
				sb.append(str);
			}
			// sending response back to ajax call
			out.print(sb);
		} 
		//catch the exception
		catch (Exception e) 
		{
			e.printStackTrace();
		}finally {
			br.close();
		}
	}

}
