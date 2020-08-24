// Model package
package com.buyfy.dao;

// Import java statements for the program
import java.util.List;
// Import files for the program
import com.buyfy.model.Product;

// Creating an interface with methods for the products
public interface ProductDAO {
	
	// method for saving a product 
	boolean save(Product p);
	
	// List to get all the products 
	List<Product> getAllProducts();
	
	// method to get the products by pid
	Product getProductById(long pid);
	
	// method for updating the products	
	boolean update(Product product);
	
	// method for deleting the products by pid
	boolean deleteProductById(long pid);
	
}
