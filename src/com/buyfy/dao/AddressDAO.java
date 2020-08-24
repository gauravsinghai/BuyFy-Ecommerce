// Model package
package com.buyfy.dao;
// Import file needed for the program
import com.buyfy.model.Address;
// Creating an interface with methods for the address of the user
public interface AddressDAO {
	// method for saving the address of the user
	boolean save(Address address);
	// method for updating the address of the user		 
	boolean update(Address address);
	// method for deleting the address of the user
	boolean delete(long aid);
}
