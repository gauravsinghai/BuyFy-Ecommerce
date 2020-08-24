// Model package
package com.buyfy.dao;

// Import java statements for the program 
import java.util.List;

// Import hibernate statements for the program 
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

// Import files needed for the program
import com.buyfy.hibernate.util.HibernateUtil;
import com.buyfy.model.Category;

public class CategoryDAOImpl implements CategoryDAO {
	// Method for saving or updating category of the products for the users
	@Override
	public boolean saveCategory(Category category) {
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
			session = factory.getCurrentSession();
			tx = session.getTransaction();
			tx.begin();
			// saving or updating the category
			session.saveOrUpdate(category);
			// comitting the data
			tx.commit();
			return true;
		}
		catch(Exception ex){
			if(tx!=null) {
				// if exception occurs rollback
				tx.rollback();
			}
			ex.printStackTrace();
			return false;
		}
	}
	
	// Method for deleting category of the products by category id
	@Override
	public boolean deleteCategoryById(long cid) {
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
			session = factory.getCurrentSession();
			tx = session.getTransaction();
			tx.begin();
			// HQL query for deleting a category 
			String hql = "delete from Category c where a.id=:id";
			Query query = session.createQuery(hql);
			query.setParameter("id", cid);
			int res = query.executeUpdate();
			// committing the data
			tx.commit();
			// returning greater than 0
			return (res>0?true:false);
		}catch(Exception ex) {
			if(tx!= null) {
				// if exception occurs
				tx.rollback();
			}
			ex.printStackTrace();
			return false;
		}
	}
	
	// Method to get the categories of the products by category id
	@Override
	public Category getCategoryById(long cid) {
	// creating transaction variable
		Transaction tx = null;
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		// creating category variable
		Category category = null;
		try {
			//Preparing session factory for work
			factory = HibernateUtil.getSessionFactory();
			// instantiating session factory
			session = factory.openSession();
			tx = session.getTransaction();
			tx.begin();
			category= (Category)session.get(Category.class, cid);
			// committing the data
			tx.commit();
		}catch(Exception ex) {
			if(tx!= null) {
				// if exception occurs rollback
				tx.rollback();
			}
			ex.printStackTrace();
		}
		return category;
	}
	
	// List for displaying all the categories
	@Override
	public List<Category> getAllCategories(){
		// creating transaction variable
		Transaction tx = null;
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		List<Category> categoryList = null;
		try {
			// preparing session factory for work
			factory = HibernateUtil.getSessionFactory();
			// instantiating session factory
			session = factory.openSession();
			tx = session.getTransaction();
			tx.begin();
			// HQL query for getting all categories
			Query qry = session.createQuery("from Category c");
			categoryList = qry.list();
		}catch(Exception ex) {
			if(tx!=null) {
				// if exception occurs
				tx.rollback();
			}
			ex.printStackTrace();
		}
		return categoryList;
	}
	
	// Method to get category by category name 
	@Override
	public Category getCategoryByName(String categoryName) {
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		// creating category variable
		Category category = null;
		try {
			// Preparing session factory for work
			factory = HibernateUtil.getSessionFactory();
			// instantiating session factory
			session = factory.getCurrentSession();
			session.beginTransaction();
			// HQL query for getting a category by name
			String hql = "from Category c where c.categoryType = :categoryName";
			Query query = session.createQuery(hql);
			query.setParameter("categoryName", categoryName);
			if(query.list().size() > 0) {
				category = (Category)query.list().get(0);
			}
			// committing the data
			session.getTransaction().commit();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return category;
	}
	// Method for updating category of the products for the user
	@Override
	public boolean updateCategory(Category category) {
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
			session = factory.getCurrentSession();
			tx = session.getTransaction();
			tx.begin();
			// updating the category
			session.update(category);
			// committing the data
			tx.commit();
			return true;
		}catch(Exception ex) {
			if(tx!=null) {
				// if exception occurs rollback
				tx.rollback();
			}
			ex.printStackTrace();
		}
		return false;
	}

}
