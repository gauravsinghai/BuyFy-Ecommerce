// Package servlet
package com.buyfy.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.buyfy.model.Cart;
import com.buyfy.model.Image;
import com.buyfy.model.Product;
import com.buyfy.model.ProductQuantity;
import com.buyfy.model.User;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import static com.buyfy.contrib.auth.Authentication.*;

/**
 * Servlet implementation class LoginServ
 */
@WebServlet("/LoginServ")
public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServ() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String cartToJson(Cart cart) {
		// Creating Empty JSON for the case if the cart is empty
		String cartJson = "{}";
		// Checking if cart is not Empty
		if (cart != null) {
			// Creating GsonBuilder Object
			GsonBuilder gsonMapBuilder = new GsonBuilder();
			// Creating Gson object using GsonBuilder 
			Gson gsonObject = gsonMapBuilder.create();
			/* Creating Products Map of String and Object array
			 * Map Key will be pr(ProdcutId) and
			 * value will be an array of product quantity, price , imageURL
			 * */
			Map<String, Object> products = new HashMap<>();
			// Iterating through user cart
			for (ProductQuantity pQty : cart.getProducts()) {
				// Getting Product from ProductQuantity Object as pQty
				Product prod = pQty.getProduct();
				// Creating ArrayList of Images
				ArrayList<Image> images = new ArrayList<>(prod.getImages());
				/* Getting price if the discounted price is less than 0 which
				 * means price has not on discounted products list
				 * */
				double price = prod.getDiscountedPrice() > 0 ? prod.getDiscountedPrice() : prod.getPrice();
				// Creating JSON values array
				Object prodDetails[] = { pQty.getQuantity(), prod.getName(), price, "images/products/"+images.get(0).getName() };
				// Creating Key and Value pair of products details
				products.put("pr" + prod.getId(), prodDetails);
			}
			// Parsing gson object to json object
			cartJson = gsonObject.toJson(products);
		}
		// returning Cart JSON Format
		return cartJson;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");
		String email = null;
		String password = null;
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;
		try {
			// Getting email and password from request object
			email = request.getParameter("email");
			password = request.getParameter("password");
			// checking if user is authenticated
			User user = authenticate(email, password);
			if (user != null) {
				// Setting User Essential Details for Session Attributes
				session.setAttribute("email", user.getEmail());
				session.setAttribute("firstName", user.getFirstName());
				session.setAttribute("lastName", user.getLastName());
				session.setAttribute("userType", user.getAccountType());
				session.setAttribute("user", user);
				session.setAttribute("id", user.getId());
				session.setAttribute("cart", cartToJson(user.getCart()));
				// forward request to index.jsp after creating user session
				rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			} else {
				/* If the details is not correct then forward it's request to
				 * login.jsp back with error message
				 * */
				request.setAttribute("isIncorrect", true);
				rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("500.jsp");

		}
	}

}
