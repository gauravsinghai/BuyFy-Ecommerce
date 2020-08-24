// Package- controllers
package com.buyfy.controllers;
// Java IO imports
import java.io.IOException;
// Java util's imports
import java.util.Date;
import java.util.List;
import java.util.Set;
// Importing DAO and Model
import com.buyfy.dao.ProductDAO;
import com.buyfy.dao.ProductDAOImpl;
import com.buyfy.model.Category;
import com.buyfy.model.Image;
import com.buyfy.model.Product;
import com.buyfy.model.ProductReview;
import com.buyfy.model.User;

public class ProductController {
	// Creating DAO for product
	private static ProductDAO dao = new ProductDAOImpl();

	// Method to save a product	
	public static boolean save(String pname,long uid,String desc,double price,double discountedPrice, 
			String catType, String catSubtype, Set<Image> images) {
		boolean defaultAvailablility = true;
		float initialRanking = 1f;
		User vendor = UserController.getUserById(uid);
		Category category = CategoryController.getCategoryByName(catType);
		if(category == null) {
			category = new Category();
			category.setCategoryType(catType);
		}
		category.setCategoryType(catType);
		// new product
		Product prod = new Product();
		// setting product details
		prod.setName(pname);
		prod.setDescription(desc);
		prod.setPrice(price);
		prod.setDiscountedPrice(discountedPrice);
		prod.setProductAvailable(defaultAvailablility);
		prod.setRanking(initialRanking);
		prod.setSubCategory(catSubtype);
		prod.setImages(images);
		prod.setVendor(vendor);
		prod.setCategory(category);
		prod.setPublishDate(new Date());
		// set to get the product
		Set<Product> setProds = category.getProducts();
		// adding product
		setProds.add(prod);
		category.setProducts(setProds);
		try {
			// saving the category
			CategoryController.saveCategory(category);
		}
		catch(Exception ex) {
			return false;
		}
		//saving the product
		return dao.save(prod);
	}
	// Method to update the product
	public static boolean update(long pid, String pname, String desc,double price, String catType, String subCategory) {
		boolean isAvailabel = true;
		float initialRanking = 1f;
		// get product by pid
		Product prod = dao.getProductById(pid);
		
//		prod.getCategory().setCategorySubtype(catSubtype);
		prod.getCategory().setCategoryType(catType);
		// setting category details
		prod.setSubCategory(subCategory);
		prod.setName(pname);
		prod.setDescription(desc);
		prod.setPrice(price);
		prod.setProductAvailable(isAvailabel);
		prod.setRanking(initialRanking);
		// updating product
		return dao.update(prod);
	}
	// Method to delete product by pid
	public static boolean deleteProductById(long pid) throws IOException {
		// deleting product
		return dao.deleteProductById(pid);
	}
	// list to get all the products
	public static List<Product> getAllProducts(){
		// getting the products
		return dao.getAllProducts();
	}
	// Method to add a review for the product
	public static boolean addReview(long pid, String review, long uid) {
		// get the product by pid
		Product product = dao.getProductById(pid);
		// get the user by uid
		User user = UserController.getUserById(uid);
		// new review
		ProductReview productReview = new ProductReview();
		// setting review details
		productReview.setReview(review);
		productReview.setReviewer(user.getEmail());
		// adding review
		product.getReviews().add(productReview);
		// updating the product
		return dao.update(product);
	}
	// Method to get the product by pid
	public static Product getProductById(long pid) {
		// getting the product
		return dao.getProductById(pid);
	}
}
