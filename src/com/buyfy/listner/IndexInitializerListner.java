package com.buyfy.listner;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.buyfy.controllers.CategoryController;
import com.buyfy.model.Category;
import com.buyfy.model.Product;

/**
 * Application Lifecycle Listener implementation class IndexInitializerListner
 *
 */
@WebListener
public class IndexInitializerListner implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public IndexInitializerListner() {
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se) 
    { 
    	// Array of categories types
		final String categoriesTypes[] = {"electronics", "clothes", "accessories","sports", "books"};
		// List to store all categories objects
		List<Category> categories = new LinkedList<>();
		// creating http session object
		HttpSession httpSession =  se.getSession();
		// getting all the categories objects by name
		for(String cat: categoriesTypes) {
			Category category = CategoryController.getCategoryByName(cat);
			// Creating Category as catData
			Category catData = new Category();
			// Setting catData category type
			catData.setCategoryType(category.getCategoryType());
			// Creating Set<Product> for storing products
			Set<Product> catProds  =new HashSet<>();
			int i=0;

			// adding products into category data products set
			for(Product p: category.getProducts()) {
				// we only want to add 4 products for each category to display on index page
				if(i++==8) {
					break;
				}
				catProds.add(p);
			}
			catData.setProducts(catProds);
			// adding category object to an array of category
			categories.add(catData);
		}
		// setting List<Category> as Http session attribute
		httpSession.setAttribute("categories", categories);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
    }
	
}
