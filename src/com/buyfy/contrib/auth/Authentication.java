package com.buyfy.contrib.auth;

import static com.buyfy.contrib.auth.hasher.SecureHashingAlgo.*;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.buyfy.hibernate.util.HibernateUtil;
import com.buyfy.model.User;


// checks if the user is authenticated or not
public class Authentication {
	// this assumes that person is already a user
	public static User authenticate(String email, String password) {
		SessionFactory factory = null;
		Session session = null;
		Transaction tx = null;
		User user = null;
		try {
			factory = HibernateUtil.getSessionFactory();
			session = factory.openSession();
			tx = session.getTransaction();
			// begin transaction
			tx.begin();
			// HQL query for fetching user with email
			String hql = "from User u where u.email = :email";
			// Creating HQL Query
			Query query = session.createQuery(hql);
			// Setting email paramter
			query.setParameter("email", email);
			// Fetching first record in the list as there will be only one record per email
			user = (User)query.list().get(0);
			// generating hash of password given by user
			password = generateHash(password);
			// checking if the email and password are correct
			if(email.equals(user.getEmail()) && password.equals(user.getPassword())) {
				return user;
			}
			tx.commit();
		}catch(Exception ex){
			// if any exception occur then transaction will be rolled back
			if(tx!=null) {
				tx.rollback();
			}
			ex.printStackTrace();
			// return false for any exception occuring case
			return null;
		}
		// return false if user does not exist
		return null;
	}
}
