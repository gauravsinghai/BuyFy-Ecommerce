//Package- controllers
package com.buyfy.controllers;
// Java util's and io imports
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.io.File;
// Importing DAO and Model
import com.buyfy.dao.UserDAO;
import com.buyfy.dao.UserDAOImpl;
import com.buyfy.model.Address;
import com.buyfy.model.Image;
import com.buyfy.model.Order;
import com.buyfy.model.User;
// Static Import for SecureHashingAlgo for password hashing purposes
import static com.buyfy.contrib.auth.hasher.SecureHashingAlgo.*;
// Data parsers import
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class UserController {
	private static UserDAO dao = new UserDAOImpl();

	// Saving an User
	public static long save(String firstName, String lastName,String dob,String email, String password, 
			String gender, String phone, String accountType, String addressLine1, 
			String addressLine2,String city, String state, String postalCode, String country,String photoName, String photoPath) {
		// Address
		Address a = new Address(addressLine1, addressLine2, city, state, postalCode, country);
		Set<Address> address = new HashSet<>();
		address.add(a);
		// Profile Picture
		Image profilePic = new Image();
		profilePic.setName(photoName);
		profilePic.setPath(photoPath);
		// User Object
		User user = new User();
		// Parsing String date to Date Object
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
		Date dobDate = null;
		try {
			dobDate=formatter.parse(dob);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		// Setting User Details
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setPassword(generateHash(password));
		user.setEmail(email);
		user.setAddress(address);
		user.setGender(gender);
		user.setProfilePic(profilePic);
		user.setPhone(phone);
		user.setAccountType(accountType);
		user.setAccountCreatedDate(new Date());
		user.setDob(dobDate);
		user.setProfilePic(profilePic);
		return dao.save(user);
	}
	
	// Fetching All Users List
	public static List<User> getAllUsers(){
		// getting all users
		return dao.getAllUsers();
	}
	
	// Fetching User By Its Id
	public static User getUserById(long uid) {
		//getting user by uid
		return dao.getUserById(uid);
	}
	// Fetching User by email
	public static User getUserByEmail(String email) {
		// getting user by email
		return dao.getUserByEmail(email);
	}
	
	// deleting user by id
	public static boolean deleteUserById(long userId) {
		// deleting user by userId
		return dao.delete(userId);
	}
	// adding an address
	public static boolean addUserAddress(long uid,  String accountType, String addressLine1, 
			String addressLine2,String city, String state, String postalCode, String country) {
		// new address
		Address address = new Address(addressLine1, addressLine2, city, state, postalCode, country);
		// adding the address
		return dao.addAddress(uid, address);
	}
	// Updating user details 
	public static boolean updateUserAllDetails(long userId, String firstName, String lastName,String email, String password, 
			String gender, String phone, String accountType, String addressLine1, 
			String addressLine2,String city, String state, String postalCode, String country,File photo) {
		// Fetching user by userId
		User user = dao.getUserById(userId);
		// Removing User Previous user Image
		try {
			File f = new File(user.getProfilePic().getPath()+user.getProfilePic().getName());
			// deleting the profile picture
			f.delete();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		// Address
		Address a = new Address(addressLine1, addressLine2, city, state, postalCode, country);
		Set<Address> address = new HashSet<>();
		address.add(a);
		// User Object
		
		// Setting User Details
		user.setFirstName(firstName);
		user.setLastName(lastName);
		/* If user enters a new password then change the password
		 * otherwise don't change the password
		 * */
		if(password.length()>7) {
			user.setPassword(generateHash(password));
		}
		user.setEmail(email);
		user.setAddress(address);
		user.setGender(gender);
		/* If photo is null the it means user does not upload
		 * new profile picture so profile picture will not be updated
		 * */ 
		if(photo != null) {
			Image image = new Image();
			image.setName(photo.getName());
			user.setProfilePic(image);
		}
		//setting user details
		user.setPhone(phone);
		user.setAccountType(accountType);
		user.setAccountCreatedDate(new Date());
		return dao.update(user);
	}
	// update user
	public static boolean updateUser(User user) {
		// updating the user
		return dao.update(user);
	}
	// list to get orders by userId
	public static List<Order> getUserOrdersByUserId(long userId){
		// getting orders by userId
		return dao.getUserOrdersByUserId(userId);
	}

}
