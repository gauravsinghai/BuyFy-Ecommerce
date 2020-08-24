// Package - servlet
package com.buyfy.servlet;

/*
 * Import statments used
 */
// Importing java io and util 
import java.io.IOException;
import java.util.HashSet;
import java.util.Map.Entry;
import java.util.Set;
//Importing java servlet   
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
//Importing OrderController, ProductController adn UserController
import com.buyfy.controllers.OrderController;
import com.buyfy.controllers.ProductController;
import com.buyfy.controllers.UserController;
// Importing Models
import com.buyfy.model.Address;
import com.buyfy.model.Cart;
import com.buyfy.model.Order;
import com.buyfy.model.Product;
import com.buyfy.model.ProductQuantity;
import com.buyfy.model.User;
// Importing Gson Files
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class CheckoutServ
 */
@WebServlet("/CheckoutServ")
public class CheckoutServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServ() {
        super();
        // TODO Auto-generated constructor stub
    }

  
    /* This method will get ordersList which is JSON Object 
     * and fetches all the data regarding object and created 
     * Set<ProductQuantity> for storing order and their corresponding 
     * quantity
     */
    public Set<ProductQuantity> jsonToProductQuantity(String ordersList){
		JsonParser parser = new JsonParser();
		JsonElement jsonTree = parser.parse(ordersList);
		// Creating Set<ProductQuantity> for string order and their corresponding quantity
		Set<ProductQuantity> products = new HashSet<>();
		
		if(jsonTree.isJsonObject()){
		    JsonObject jsonObject = jsonTree.getAsJsonObject();
		    for(Entry<String, JsonElement> j : jsonObject.entrySet()) {

		    	// Getting product id from JSON Key
		    	long pid = Long.parseLong((j.getKey().replace("pr", "")));
		    	
		    	Product product = ProductController.getProductById(pid);
		    	// Getting JSON Key value
		    	JsonElement keys =  j.getValue();
		    	JsonArray arrKeys = keys.getAsJsonArray();
		    	// Fetching quantity from JSON list
		    	int qty = arrKeys.get(0).getAsInt();
		    	
		    	ProductQuantity prodAndQty = new ProductQuantity();
		    	prodAndQty.setProduct(product);
		    	prodAndQty.setQuantity(qty);
		    	
		    	products.add(prodAndQty);
		    }
		}
		return products;
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// Order Attributes
		long userId = -1;
		String fname = null;
		String lname = null;
		String address1 = null;
		String address2 = null;
		String ordersList = null;
		String country = null;
		String state = null;
		String city = null;
		String phone = null;
		String postalcode = null;
		// Request Dispatcher 
		RequestDispatcher rd  = null;
		try {
			// getting all the details of products from request object
			userId = Long.parseLong(request.getParameter("user-id"));
			fname = request.getParameter("first-name");
			lname = request.getParameter("last-name");
			phone = request.getParameter("phone");
			ordersList = request.getParameter("orders-list");

			address1 = request.getParameter("address-line1");
			address2 = request.getParameter("address-line2");
			country = request.getParameter("country");
			state = request.getParameter("state");
			city = request.getParameter("city");
			postalcode = request.getParameter("postalcode");
			
			// Product Quantity Set for storing Products and their corresponding quantities 
			Set<ProductQuantity> prodAndQty = jsonToProductQuantity(ordersList);
			Address address = getAddressObject(address1, address2, country, state, city, postalcode);
			HttpSession httpSession = request.getSession();
			User user = UserController.getUserById(userId);
			long orderId = OrderController.saveOrder(user, fname, lname, phone, address, prodAndQty); 
			if(orderId > 0) {
				// Assign Cart to Empty JSON Object
				httpSession.setAttribute("cart","{}");
				user.setCart(new Cart());
				// Get Order By Id
				Order order = OrderController.getOrderById(orderId);
				// Removing Order if it already exist
				request.removeAttribute("order");
				// set orders as request attribute
				request.setAttribute("order", order);
				// Forwarding request to TxnTest.jsp 
				rd  = request.getRequestDispatcher("TxnTest.jsp");
				rd.forward(request, response);
			}else {
				throw new Exception("Order Not Saved!");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("500.jsp");
		}
	}

	// Method to return address object by getting address attributes as parameter
	private Address getAddressObject(String address1, String address2, String country, String state, String city, String postalcode) {
		Address address = new Address();
		address.setAddressLine1(address1);
		address.setAddressLine2(address2);
		address.setCity(city);
		address.setCountry(country);
		address.setState(state);
		address.setPostalCode(postalcode);
		return address;
	}

}
