// Package - servlet

package com.buyfy.servlet;


// Java io imports
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
// Java util's imports
import java.util.Iterator;
import java.util.List;
// Javax Servlet imports
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//Importing File Uploads 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

//Importing User Model and controllers 
import com.buyfy.controllers.UserController;
import com.buyfy.mail.Mail;
import com.buyfy.model.User;
/**
 * Servlet implementation class AddUserServ
 */
@WebServlet("/AddUserServ")
public class AddUserServ extends HttpServlet {
	// SerialVersionUid
	private static final long serialVersionUID = 1L;

	// No-Arguments Constructor
	public AddUserServ() {
		super();
	}

	/*
	 * This AUT_TOKEN is used as a validator for incoming request's to check whether
	 * they are authorized
	 */
	static final String AUTH_TOKEN = "03c77a7ed94e11fb00d61913f743f7e09c0abf4df5c1080f51e17895542d77c5";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/*
		 * auth_token will be in hidden form to check that the request is authorized and
		 * the request is coming from our web-site page only.
		 */
		// Set the response message's MIME type
		response.setContentType("text/html");
		// Allocate a output writer to write the response message into the network socket
		PrintWriter out = response.getWriter();
		try {
			HttpSession httpsession = request.getSession();
			String auth_token = (String) httpsession.getAttribute("auth-token");
			// Checking if the auth_token is same as AUTH_TOKEN
			if (auth_token.equals(AUTH_TOKEN) && auth_token!=null) {
				/*Constatnt's for image's name and path
				 */
				// Path for where to save user image
				final String USER_IMG_REL_PATH = "/images/users/";
				final String USER_IMG_ABS_PATH = getServletContext().getRealPath(USER_IMG_REL_PATH);
				// If user does not provide user image then default will be provided
				final String DEFAULT_IMAGE_NAME = "default.jpg";
				int maxFileSize = 5000 * 1024;
				int maxMemSize = 5000 * 1024;

				String fileName = null;
				File imageFile = null;
				/*
				 * User Attributes
				 */
				// User Personnel Details
				String firstName = null;
				String lastName = null;
				String gender = null;
				String phone = null;
				String email = null;
				String password = null;
				String dob = null;
				String accountType = null;
				// User Address Details
				String addressLine1 = null;
				String addressLine2 = null;
				String city = null;
				String state = null;
				String postalCode = null;
				String country = null;
				
				// Checking if the request is MultiPart Content Request or not

				boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
				if (isMultipartContent) {
					DiskFileItemFactory factory = new DiskFileItemFactory();
					// Setting Max Memory Size for files

					factory.setSizeThreshold(maxMemSize);

					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setFileSizeMax(maxFileSize);
					try {
						/* Creating List of FileItes Iterator for iterating through all the data
						 * send by the form and Parsing all the data from request object
						 * */ 
						List<FileItem> fields = upload.parseRequest(request);
						Iterator<FileItem> it = fields.iterator();
						// Iterating through File Items given by the SignUp Form
						while (it.hasNext()) {
							// Creating FileItem Object
							FileItem fileItem = (FileItem) it.next();
							// IsFormField is boolean value to check if it is normal item or File Type Item
							boolean isFormField = fileItem.isFormField();
							// if there is any photo
							if (!isFormField) {
								
								fileName =  fileItem.getName();
								// File size in bytes
								long sizeInBytes = fileItem.getSize();
								try {
									// // If the file size is greater than 0 it will be given  absolute path
									if (sizeInBytes > 0) {
										imageFile = new File(USER_IMG_ABS_PATH + fileName);
										// If the Image With this Name is Already Present
										if (imageFile.exists()) {
											imageFile = new File(
													USER_IMG_ABS_PATH + (int) (Math.random() * 100000000) + fileName);
										}
									} else {
										// else it will be default value
										imageFile = new File(USER_IMG_ABS_PATH + DEFAULT_IMAGE_NAME);
									}
									// Writing Image File
									fileItem.write(imageFile);
								} catch (Exception e) {
									e.printStackTrace();
								}
							}
						
							// Fields which are not file type
							else {
								if (fileItem.getFieldName().equals("first-name")) {
									firstName = fileItem.getString();
								} else if (fileItem.getFieldName().equals("last-name")) {
									lastName = fileItem.getString();
								} else if (fileItem.getFieldName().equals("gender")) {
									gender = fileItem.getString();
								} else if (fileItem.getFieldName().equals("phone")) {
									phone = fileItem.getString();
								} else if (fileItem.getFieldName().equals("email")) {
									email = fileItem.getString().toLowerCase();
								} else if (fileItem.getFieldName().equals("password")) {
									password = fileItem.getString();
								} else if (fileItem.getFieldName().equals("dob")) {
									dob = fileItem.getString();
								} else if (fileItem.getFieldName().equals("account-type")) {
									accountType = fileItem.getString().toLowerCase();
								} else if (fileItem.getFieldName().equals("address-line1")) {
									addressLine1 = fileItem.getString();
								} else if (fileItem.getFieldName().equals("address-line2")) {
									addressLine2 = fileItem.getString();
								} else if (fileItem.getFieldName().equals("city")) {
									city = fileItem.getString();
								} else if (fileItem.getFieldName().equals("state")) {
									state = fileItem.getString();
								} else if (fileItem.getFieldName().equals("postalcode")) {
									postalCode = fileItem.getString();
								} else if (fileItem.getFieldName().equals("country")) {
									country = fileItem.getString();
								}
							}
							// Catch Block for FileUploadException

						}
					} catch (FileUploadException fux) {
						fux.printStackTrace();
					}
					// adding details of user
					long userId = UserController.save(firstName, lastName, dob, email, password, gender, phone,
							accountType, addressLine1, addressLine2, city, state, postalCode, country,
							imageFile.getName(), USER_IMG_REL_PATH);

					
					// RequestDispatcher Object 
					RequestDispatcher rd = null;
					if (userId > 0) {
						// sending greeting mail for creating an account on our website
						Mail.sendNewAccountGreetMail(firstName+" "+lastName, email);
						
						// Getting HttpSession Object
						HttpSession httpSession = request.getSession();
						// Getting if any user is in current session
						User currUser = (User)httpSession.getAttribute("user");
						/* Checking if the current session is not null and
						 * current user is admin or not 
						 */
						if(currUser != null && currUser.getAccountType().equals("admin")) {
							
							// Creating alert message for displaying to user
							String msgAlert = "<div class='alert alert-success alert-dismissible fade show my-3' role='alert'>" + 
									"  <strong>"+firstName+" "+lastName+" created successfully</strong>" + 
									"  <button type='button' class='close' data-dismiss='alert' aria-label='Close'>" + 
									"    <span aria-hidden='true'>&times;</span>" + 
									"  </button>" + 
									"</div>";
							request.setAttribute("userCreatedMessage", msgAlert);
							// Updating users list in session
							List<User> user = UserController.getAllUsers();
							httpSession = request.getSession();
							httpSession.setAttribute("usersList", user);
							rd  = request.getRequestDispatcher("users-table.jsp");
							rd.forward(request, response);
						}else {
							
							// Login User
							// set user new details for session
							User user = UserController.getUserById(userId);
							httpsession.setAttribute("user", user);
							httpsession.setAttribute("email", email);
							httpsession.setAttribute("firstName", firstName);
							httpsession.setAttribute("lastName", lastName);
							httpsession.setAttribute("userType", accountType);
							httpsession.setAttribute("id", userId);
							httpsession.setAttribute("cart", "{}");
							rd  = request.getRequestDispatcher("index.jsp");
							rd.forward(request, response);
						}
					} else {
						request.setAttribute("isCreated", false);
						// RequestDispatcher Object for sign up Page

						rd  = request.getRequestDispatcher("signup.jsp");
						rd.include(request, response);
					}
				} // if(MultipartContent) end
			}
		}
		// If Any Servlet Exception Then Redirect To Error Page or Maintenance Page
		catch (Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("500.jsp");
		} finally {
			out.close();
		}
	}
}
