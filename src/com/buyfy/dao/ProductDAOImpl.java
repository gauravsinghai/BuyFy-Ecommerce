// Model package
package com.buyfy.dao;
// Import java statements for the program
import java.util.List;
// Import hibernate statements for the program
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import com.buyfy.hibernate.util.HibernateUtil;
import com.buyfy.model.Product;

public class ProductDAOImpl implements ProductDAO {

	// Method for saving the Product
	@Override
	public boolean save(Product product) {
			// creating transaction variable
			Transaction tx = null;
			// creating session factory variable
			SessionFactory factory = null;
			// creating session variable
			Session session = null;
			try {
				// Preparing session factory for work
				factory = HibernateUtil.getSessionFactory();
				// instantiating session factory
				session = factory.openSession();
				tx = session.getTransaction();
				tx.begin();
				// saving a product
				session.save(product);
				// committing the data
				tx.commit();
				return true;
			}catch(Exception ex) {
				if(tx!= null) {
					// if exception occurs
					tx.rollback();
				}
				ex.printStackTrace();
				return false;
			}
		}

	//Method for updating the product
	public boolean update(Product product) {
		//creating transaction variable
		Transaction tx = null;
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		try {
			// Preparing session factory for work
			factory = HibernateUtil.getSessionFactory();
			// instantiating session factory
			session = factory.openSession();
			tx = session.getTransaction();
			tx.begin();
			// updating the product
			session.update(product);
			// committing the data
			tx.commit();
			return true;
		}catch(Exception ex) {
			if(tx!=null) {
				// if exception occurs
				tx.rollback();
			}
			ex.printStackTrace();
		}
		return false;
	}

	// List for getting all products
	public List<Product> getAllProducts(){
		//creating transaction variable
		Transaction tx = null;
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		List<Product> prodList = null;
		try {
			// Preparing session factory for work
			factory = HibernateUtil.getSessionFactory();
			// instantiating session factory
			session = factory.openSession();
			tx = session.getTransaction();
			tx.begin();
			// HQL query to get all the products through list
			Query qry = session.createQuery("from Product u");
			prodList = qry.list();
		}catch(Exception ex) {
			if(tx!=null) {
				// if exception ocurs
				tx.rollback();
			}
			ex.printStackTrace();
		}
		return prodList;
	}
	
	// Method for searching product by pid
	public Product getProductById(long pid) {
		// creating transaction variable
		Transaction tx = null;
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		// creating product variable
		Product product = null;
		try {
			// Preparing session factory for work
			factory = HibernateUtil.getSessionFactory();
			// instantiating session factory
			session = factory.openSession();
			tx = session.getTransaction();
			tx.begin();
			// getting product using pid 
			product= (Product)session.get(Product.class, pid);
			// committing the data
			tx.commit();
		}catch(Exception ex) {
			if(tx!= null) {
				// if exception occurs
				tx.rollback();
			}
			ex.printStackTrace();
		}
		finally{
			session.close();
		}
		return product;
	}
	// Method for deleting product by pid
	@Override
	public boolean deleteProductById(long pid) {
		// creating transaction variable
		Transaction tx = null;
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		// creating product variable
		Product product = null;
		try {
			// Preparing session factory for work
			factory = HibernateUtil.getSessionFactory();
			// instantiating session factory
			session = factory.openSession();
			tx = session.getTransaction();
			tx.begin();
			// getting the product by pid
			product = getProductById(pid);
			//deleting the product 
			session.delete(product);
			// committing the data 
			tx.commit();
			return true;
		}catch(Exception ex) {
			if(tx!=null) {
				// if exception occurs
				tx.rollback();
			}
			ex.printStackTrace();
		}
		return false;
	}

}
