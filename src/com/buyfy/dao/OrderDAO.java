// Model package
package com.buyfy.dao;

// Importing java IO
import java.util.List;
// Importing user model
import com.buyfy.model.Order;

// Creating an interface with the methods for orders
public interface OrderDAO {
	// method for saving an order of the user
	long saveOrder(Order order);
	
	// method for deleting an order by oid
	boolean deleteOrder(long orderId);
	
	// method for updating an order of the user
	boolean updateOrder(Order order);
	
	// method to get the order by orderId
	Order getOrderById(long orderId);
	
	// List to get all the orders of the user
	List<Order> getAllOrders();
}
