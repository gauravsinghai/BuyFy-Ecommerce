// Package- controllers
package com.buyfy.controllers;
// Importing Model and DAO
import com.buyfy.dao.CategoryDAO;
import com.buyfy.dao.CategoryDAOImpl;
import com.buyfy.model.Category;

public class CategoryController {
	// creating DAO for category
	private static CategoryDAO dao = new CategoryDAOImpl();
	
	// Method to save a product category 
	public static boolean saveCategory(Category category) {
		// saving category
		return dao.saveCategory(category);
	}
	// Method to get category by cid
	public static Category getCategoryById(long cid) {
		// getting category by cid
		return dao.getCategoryById(cid);
	}
	// Method to get category by name
	public static Category getCategoryByName(String category) {
		// getting category by name
		return dao.getCategoryByName(category);
	}
}
