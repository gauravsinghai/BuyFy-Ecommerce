// model package
package com.buyfy.dao;
// Importing java statements for the program
import java.util.LinkedList;
import java.util.List;
// Importing hibernate statements for the program
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
// Importing HibernateUtil for SessionFactory
import com.buyfy.hibernate.util.HibernateUtil;
// Importing Address, Order and User Model
import com.buyfy.model.Address;
import com.buyfy.model.Order;
import com.buyfy.model.User;

public class UserDAOImpl implements UserDAO {

	// Creating No Argument Constructor
	public UserDAOImpl() {}
	
	// Method to Save User
	@Override
	public long save(User e) {
		// creating transaction variable
		Transaction tx = null;
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		try {
			// preparing session factory for work
			factory = HibernateUtil.getSessionFactory();
			// instantiating session factory
			session = factory.getCurrentSession();
			tx = session.getTransaction();
			// saving user
			tx.begin();
			long id = (long) session.save(e);
			// committing the data
			tx.commit();
			return id;
		}
		catch(Exception ex){
			if(tx!=null) {
				// if exception occurs
				tx.rollback();
			}
			ex.printStackTrace();
			return -1;
		}
	}

	// Method to Delete User
	@Override
	public boolean delete(long uid) {
		// creating transaction variable
		Transaction tx = null;
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		try {
			// preparing session factory for work
			factory = HibernateUtil.getSessionFactory();
			// instantiating session factory
			session = factory.getCurrentSession();
			tx = session.getTransaction();
			tx.begin();
			User u = (User)session.get(User.class, uid);
			// deleting the user
			session.delete(u);
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

	// Method to get the list Of all users
	@Override
	public List<User> getAllUsers() {
		// creating transaction variable
		Transaction tx = null;
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		List<User> userList = null;
		try {
			// Preparing session factory for work
			factory = HibernateUtil.getSessionFactory();
			// instantiating session factory
			session = factory.getCurrentSession();
			tx = session.getTransaction();
			tx.begin();
			// HQL query to get all the users through list
			Query qry = session.createQuery("from User u");
			userList = qry.list();
		}catch(Exception ex) {
			if(tx!=null) {
				// if exception occurs
				tx.rollback();
			}
			ex.printStackTrace();
		}
		return userList;
	}

	// Method to get Employees By Id
	@Override
	public User getUserById(long uid) {
		// creating transaction variable
		Transaction tx = null;
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		// creating user variable
		User user = null;
		try {
			// Preparing session factory for work
			factory = HibernateUtil.getSessionFactory();
			// instantiating session factory
			session = factory.openSession();
			tx = session.getTransaction();
			tx.begin();
			// getting users by uid
			user = (User)session.get(User.class, uid);
			// committing the data
			tx.commit();
		}catch(Exception ex) {
			if(tx!= null) {
				// if exception occurs
				tx.rollback();
			}
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return user;
	}

	// Method to update the User By Id
	@Override
	public boolean update(User user) {
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
			// updating the user
			session.update(user);
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

	// Method to add Address of the user by uid
	@Override
	public boolean addAddress(long uid, Address address) {
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
			// getting user by uid
			User user = getUserById(uid);
			// adding the address
			user.getAddress().add(address);
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

	// Method to add Order of the user by uid
	public boolean addOrder(long uid, Order order) {
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
			// Getting users by uid
			User user = getUserById(uid);
			// adding orders
			user.getOrders().add(order);
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
	// Method to get User by email
	@Override
	public User getUserByEmail(String email) {
		// creating transaction variable
		Transaction tx = null;
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		// creating user variable
		User user = null;
		try {
			//Preparing session factory for work
			factory = HibernateUtil.getSessionFactory();
			// instantiating session factory
			session = factory.getCurrentSession();
			tx = session.getTransaction();
			tx.begin();
			// HQL query to get users by email 
			String hql = "from User u where u.email = :email";
			Query query = session.createQuery(hql);
			query.setParameter("email", email);
			user = (User)(query.list().size()> 0?query.list().get(0):null);
			// committing the data
			tx.commit();
		}catch(Exception ex) {
			if(tx!= null) {
				// if exception occurs
				tx.rollback();
			}
			ex.printStackTrace();
		}
		return user;
	}
	// List for the orders of the user by userId
	@Override
	public List<Order> getUserOrdersByUserId(long userId) {
		// creating transaction variable
		Transaction tx = null;
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		// creating user variable
		User user = null;
		List<Order> orders =  new LinkedList<>();
		try {
			// Preparing session factory for work
			factory = HibernateUtil.getSessionFactory();
			// instantiating session factory
			session = factory.getCurrentSession();
			tx = session.getTransaction();
			tx.begin();
			// HQL query to get orders by uid through list
			String hql = "select orders from User u where u.id = :id";
			Query query = session.createQuery(hql);
			query.setParameter("id", userId);
			orders = query.list();
			// committing the data
			tx.commit();
		}catch(Exception ex) {
			if(tx!= null) {
				// if exception occurs
				tx.rollback();
			}
			ex.printStackTrace();
		}
		return orders;
	}

}
