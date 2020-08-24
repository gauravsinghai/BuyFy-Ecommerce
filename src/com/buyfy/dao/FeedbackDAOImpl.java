// Model package
package com.buyfy.dao;

// Import java statements for the program
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
// Import hibernate statements for the program
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
// Import files needed for the program
import com.buyfy.hibernate.util.HibernateUtil;
import com.buyfy.model.Feedback;


public class FeedbackDAOImpl implements FeedbackDAO {
	// Method for saving the feedback with given parameters
	public boolean save(String name, String email, String description) {
		// creating transaction variable
		Transaction tx = null;
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		// creating feedback variable
		Feedback feedback = null;
		try {	
			// preapring session factory for work
			factory = HibernateUtil.getSessionFactory();
			// instantiating session factory
			session = factory.getCurrentSession();
			tx = session.getTransaction();
			tx.begin();
			feedback = new Feedback();
			// setting name
			feedback.setName(name);
			// setting description 
			feedback.setDesc(description);
			// setting email
			feedback.setEmail(email);
			// setting the time
			feedback.setTimeStamp(new Date());
			// saving feedback
			session.save(feedback);
			// committing the data
			tx.commit();
			return true;
		} catch (Exception ex) {
			if (tx != null) {
				// if exception occurs rollback
				tx.rollback();
			}
			ex.printStackTrace();
			return false;
		}
	}
	
	// List for displaying all the feedbacks
	@Override
	public List<Feedback> getAllFeedbacks(){
		// creating transaction variable
		Transaction tx = null;
		// creating session factory variable
		SessionFactory factory = null;
		// creating session variable
		Session session = null;
		List<Feedback> feedbacks = new LinkedList<>();
		try {
			// preparing session factory for work
			factory = HibernateUtil.getSessionFactory();
			// instantiating session factory
			session = factory.openSession();
			tx = session.getTransaction();
			tx.begin();
			// HQL query to get all the feedback
			Query qry = session.createQuery("from Feedback c ORDER BY Feedback_ID DESC");
			feedbacks = qry.list();
		}catch(Exception ex) {
			if(tx!=null) {
				// if exception occurs rollback
				tx.rollback();
			}
			ex.printStackTrace();
		}
		return feedbacks;
	}
}
