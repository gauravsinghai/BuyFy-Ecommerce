// Model package
package com.buyfy.dao;

// Import java statement for the program
import java.util.List;
// Import files needed for the program
import com.buyfy.model.Feedback;

// Creating an interface with method for feedbacks
public interface FeedbackDAO {
	// method for saving a feedback from a user
	boolean save(String name, String email, String description);
	
	// List to get all the feedbacks of the user
	List<Feedback> getAllFeedbacks();
}
