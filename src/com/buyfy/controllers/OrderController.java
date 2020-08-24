// Package- controllers
package com.buyfy.controllers;
// Java Util's Imports
import java.util.Date;
import java.util.List;
import java.util.Set;
// Importing Model and DAO
import com.buyfy.dao.OrderDAO;
import com.buyfy.dao.OrderDAOImpl;
import com.buyfy.model.Address;
import com.buyfy.model.Order;
import com.buyfy.model.Product;
import com.buyfy.model.ProductQuantity;
import com.buyfy.model.User;

public class OrderController {

	// Creating a DAO for order
	static final OrderDAO dao = new OrderDAOImpl();
	// This method will return total amount of order
	// First it will retrieve all the Products from Set of ProductQuantity
	// and then retrieve order price and quantity and return the total 
	// amount of the Order
	// This method will return
	public static double getTotalAmount(Set<ProductQuantity> prodAndQty) {
		double totalAmount = 0;
		for(ProductQuantity pQty : prodAndQty) {
			Product prod = pQty.getProduct();
			double price = prod.getDiscountedPrice()>0?prod.getDiscountedPrice():prod.getPrice();
			totalAmount += pQty.getQuantity()*price;
		}
		return totalAmount;
	}
	
	// Method to save an order
	public static long saveOrder(User user, String firstName, String lastName, 
			String phone, Address address, Set<ProductQuantity> prodAndQty) {
		Order order = new Order();
		// Setting order details
		order.setUser(user);
		order.setFirstName(firstName);
		order.setLastName(lastName);
		order.setPhone(phone);
		order.setAddress(address);
		order.setProducts(prodAndQty);
		order.setOrderDate(new Date());
		order.setOrderDelivered(false);
		order.setTransacStatus(false);
		order.setSalesTax(0);
		order.setAmount(getTotalAmount(prodAndQty));
		// Creating a set to get orders
		Set<Order> orders =  user.getOrders();
		orders.add(order);
		user.setOrders(orders);
		// saving order
		long orderId = dao.saveOrder(order);
		if(UserController.updateUser(user)) {
		return orderId;
		}else {
			return 0;
		}
	}
	//Method to get an order by orderId
	public static Order getOrderById(long orderId) {
		// getting order
		return dao.getOrderById(orderId);
	}
	// Method to update order 
	public static boolean updateOrder(Order order) {
		// updating order
		return dao.updateOrder(order);
	}
	// Method to remove an order by orderId
	public static boolean removeOrderById(long orderId) {
		// deleting order
		return dao.deleteOrder(orderId);
	}
	// list to get all orders
	public static List<Order> getAllOrders(){
		// getting all the orders
		return dao.getAllOrders();
	}
}
