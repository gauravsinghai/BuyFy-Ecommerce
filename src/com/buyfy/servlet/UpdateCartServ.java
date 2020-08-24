// Package - servlet
package com.buyfy.servlet;

/*
 * Import Statements used 
 */
//Importing Java IO and Utils 
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.Map.Entry;
//Importing Javax servlets
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//Importing ProductController and UserController Controller 
import com.buyfy.controllers.ProductController;
import com.buyfy.controllers.UserController;
//Importing Product, ProductQuantity, Cart and User Model 
import com.buyfy.model.Product;
import com.buyfy.model.ProductQuantity;
import com.buyfy.model.User;
import com.buyfy.model.Cart;
//Importing JSON jars
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class UpdateCartServ
 */
@WebServlet("/UpdateCartServ")
public class UpdateCartServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartServ() {
        super();
        // TODO Auto-generated constructor stub
    }

    /*
     * jsonToProductQuantity Method will take an orderList which is a 
     * JSON Object and extract details about user cart and convert those
     * details and return Set<ProductQuantity> 
     */
    public Set<ProductQuantity> jsonToProductQuantity(String ordersList){
    	// JSON Parser Object for parsing orderList
		JsonParser parser = new JsonParser();
		// JSON Element for accessing each key in JSON Object
		JsonElement jsonTree = parser.parse(ordersList);
		// Creating Set<ProductQuantity> for storing details of user cart
		Set<ProductQuantity> products = new HashSet<>();
		
		// Checking if the orderList parsed is JSON Object or not
		if(jsonTree.isJsonObject()){
			// Getting JSON Object 
		    JsonObject jsonObject = jsonTree.getAsJsonObject();
		    for(Entry<String, JsonElement> j : jsonObject.entrySet()) {
		    	// Getting product id which is the key in JSON Object
		    	// pr+(productID)
		    	long pid = Long.parseLong((j.getKey().replace("pr", "")));
		    	// Getting product by its id
		    	Product product = ProductController.getProductById(pid);
		    	// JSON Element Object
		    	JsonElement keys =  j.getValue();
		    	// JSON Array - This will be for getting values related to a key
		    	JsonArray arrKeys = keys.getAsJsonArray();
		    	// Getting first element which is the quantity of product in user's cart
		    	int qty = arrKeys.get(0).getAsInt();
		    	// Creating ProductQuantity Object as prodAndQty
		    	ProductQuantity prodAndQty = new ProductQuantity();
		    	// Setting Product in ProductQuantity
		    	prodAndQty.setProduct(product);
		    	// Setting Product Quantity in ProductQuantity
		    	prodAndQty.setQuantity(qty);
		    	// Adding prodAndQty in products
		    	products.add(prodAndQty);
		    }
		}
		// returning Set<ProductQuantity>
		return products;
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// cartJson will get the JSON data from the webpage
		String cartJson = "";
		// This will get the response for DB Save or not condition
		String updateCartInDB = "";
		// user id
		long userId = -1;
		
		// Creating HttpSession Object 
		HttpSession httpSession = null;
		try {
			httpSession = request.getSession();
			response.setContentType("text/html");
			// Getting cart JSON Object
			cartJson =  request.getParameter("cart");
			// Getting whether to save data in DB for this request or not 
			updateCartInDB = request.getParameter("save");
			// Getting user id
			userId = Long.parseLong(request.getParameter("id"));
			
			/* If user closed window or changes window a DataBase
			 * Operation will be performed for updating user cart
			 * */
			if(updateCartInDB.equals("true")) {
				// Creating Set<ProductQuantity> for storing Products and their corresponding Quantity
				Set<ProductQuantity> products = new HashSet<>();
				// Converting JSON Object to Set<ProductQuantity> 
				products = jsonToProductQuantity(cartJson);
				// Creating Cart Object
				Cart cart = new Cart();
				// Setting Converted JSON List to cart products
				cart.setProducts(products);
				// Getting user
				User user = UserController.getUserById(userId);
				// Setting User Cart to new Updated Cart
				user.setCart(cart);
				// Updating User
				UserController.updateUser(user);
			}
			// Setting updated session cart attribute to new CART JSON Object
			httpSession.setAttribute("cart", cartJson);
		}catch(Exception ex) {
			ex.printStackTrace();
			// This will redirect user to 500 Error page
			response.sendRedirect("500.jsp");
		}	
	}
}
