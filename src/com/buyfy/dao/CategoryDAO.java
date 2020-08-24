//Model package
package com.buyfy.dao;

// Import java statement for the program
import java.util.List;

// Import file for the program
import com.buyfy.model.Category;


// Creating an interface with methods for the categories of the products
public interface CategoryDAO {
	
	// method for saving a category of the product
	boolean saveCategory(Category category);	
	
	// method for deleting a category of the product by cid
	boolean deleteCategoryById(long cid);
	
	// method to get the category by cid
	Category getCategoryById(long cid);
	
	// method to get the category by name
	Category getCategoryByName(String categoryName);
	
	// method to update the category of the product
	boolean updateCategory(Category category);
	
	// List to get all the categories of the products
	List<Category> getAllCategories();
}
