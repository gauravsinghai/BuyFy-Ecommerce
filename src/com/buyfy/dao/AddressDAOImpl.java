// Model package
package com.buyfy.dao;
// Import hibernate statements for the program
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
// Import files needed for the program
import com.buyfy.hibernate.util.HibernateUtil;
import com.buyfy.model.Address;

public class AddressDAOImpl implements AddressDAO {

	// Method to save address of the user
	@Override
	public boolean save(Address address) {
			//  creating transacton variable
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
				// saving address
				session.save(address);
				// committing the data
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

	// Method to update address of the user
	@Override
	public boolean update(Address address) {
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
			// updating address
			session.update(address);
			//committing the data
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

	// Method to delete address of the user by aid
	@Override
	public boolean delete(long aid) {
		// creating transaction variable
		Transaction tx = null;
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		try {
			// Preparing session factory for work
			factory = HibernateUtil.getSessionFactory();
			// Instantiating session factory
			session = factory.getCurrentSession();
			tx = session.getTransaction();
			tx.begin();
			// HQL query to delete an address using aid
			String hql = "delete from Address a where a.id=:id";
			Query query = session.createQuery(hql);
			query.setParameter("id", aid);
			int res = query.executeUpdate();
			// committing the data
			tx.commit();
			// returning result
			return (res>0?true:false);
		}
		catch(Exception ex) {
			if(tx!= null) {
				// if exception occurs rollback
				tx.rollback();
			}
			ex.printStackTrace();
			return false;
		}
	}

}
