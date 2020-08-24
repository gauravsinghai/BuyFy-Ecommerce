// Model package
package com.buyfy.dao;
// Import java statement for the program
import java.util.List;
import com.buyfy.model.Address;
import com.buyfy.model.Order;
import com.buyfy.model.User;

// Creating an interface with methods for the user
public interface UserDAO {
	// method for saving a user
	long save(User e);
	
	// method for deleting a user by userId
	boolean delete(long userId);
	
	// List to get all the users
	List<User> getAllUsers();
	
	// method to get users by userId
	User getUserById(long userId);
	
	// method to get users by email
	User getUserByEmail(String email);
	
	// method for updating a user
	boolean update(User user);
	
	// method to add address of the user by userId
	boolean addAddress(long userId, Address address);
	
	// method to add order of the user by userId
	boolean addOrder(long userId, Order order);
	
	// List to get all the orders of the user by userId
	List<Order> getUserOrdersByUserId(long userId);
}
