// Package-controllers
package com.buyfy.controllers;
// Importing DAO and Model
import com.buyfy.dao.AddressDAO;
import com.buyfy.dao.AddressDAOImpl;
import com.buyfy.model.Address;

public class AddressController {
	// Creating DAO for address
	private static AddressDAO dao = new AddressDAOImpl(); 
	
	// Method to Save Address
	public static boolean save(String addressLine1, String addressLine2, String city ,String state ,String postalCode ,String country) {
		Address address = new Address(addressLine1, addressLine2, city, state, postalCode, country);
		// saving address
		return dao.save(address);
	}
	
	// Method to Update Address
	public static boolean update(String addressLine1, String addressLine2, String city ,String state ,String postalCode ,String country) {
		Address address = new Address(addressLine1, addressLine2, city, state, postalCode, country);
		// updating address
		return dao.update(address);
	}
	
	// Method to Delete Address by aid
	public static boolean delete(long aid) {
		// deleting address
		return dao.delete(aid);
	}
}

