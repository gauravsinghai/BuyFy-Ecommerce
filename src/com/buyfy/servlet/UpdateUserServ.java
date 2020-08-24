// Package - servlet
package com.buyfy.servlet;

/*
 * Import Statements used 
 */
// Importing Java IO and Utils 
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
// Importing Javax servlets
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Importing File Uploads 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import com.buyfy.controllers.UserController;
// Importing User Model 
import com.buyfy.model.User;

/**
 * Servlet implementation class UpdateUserServ
 */
@WebServlet("/UpdateUserServ")
public class UpdateUserServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/* Authorization Token will be used to check if the request is coming for
	 * Authorized Place or not
	 * */
	static final String AUTH_TOKEN = "03c77a7ed94e11fb00d61913f743f7e09c0abf4df5c1080f51e17895542d77c5";
    
	/**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServ() {
        super();
        // TODO Auto-generated constructor stub
    }

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
				System.out.println("--------- In -------------");
				/*
				 * Constatnt's for image's name and path
				 */
				// Relative Path for where to save user image
				final String USER_IMG_REL_PATH = "/images/users/";
				// Absolute Path for where to save user image
				final String USER_IMG_ABS_PATH = getServletContext().getRealPath(USER_IMG_REL_PATH);
				// If user does not provide user image then default will be provided
				int maxFileSize = 5000 * 1024;
				int maxMemSize = 5000 * 1024;
				String fileName = null;
				File imageFile = null;
				/*
				 * User Attributes - User Personnel Details
				 */
				long userId  = -1;
				String firstName = null;
				String lastName = null;
				String gender = null;
				String phone = null;
				String email = null;
				String password = null;
				// user account type (Admin, Merchant, Basic User)
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
					// Setting Max File Size
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
							// if there is any File Data
							if (!isFormField) {
								fileName =  fileItem.getName();
								// File size in bytes
								long sizeInBytes = fileItem.getSize();
								try {
									// If the file size is greater than 0 then only update the user profile picture
									if (sizeInBytes > 0) {
										imageFile = new File(USER_IMG_ABS_PATH + fileName);
										// If the Image With this Name is Already Present
										if (imageFile.exists()) {
											imageFile = new File(
													USER_IMG_ABS_PATH + (int) (Math.random() * 100000000) + fileName);
										}
										// Writing Image File
										fileItem.write(imageFile);
									}
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
								} else if (fileItem.getFieldName().equals("user-id")) {
									userId = Long.parseLong(fileItem.getString());
								}
							}
						}
						// Catch Block for FileUploadException
					} catch (FileUploadException fux) {
						fux.printStackTrace();
					}
					
					/*
					 * Passing all the user details into updateUserAllDetails and this will
					 * update all the values. Details changed by user will be updated and 
					 * details not changed by the user will remain as it is.
					 */
					boolean isUpdated = UserController.updateUserAllDetails(userId, firstName, lastName,email, password, 
							gender, phone,accountType, addressLine1, addressLine2, city, state, postalCode, country,imageFile);
				
					// RequestDispatcher Object for index.html Page
					RequestDispatcher rd  = request.getRequestDispatcher("user-display.jsp");
					/* Variables to store alert design for whether
					 * user details has been updated or not
					 * */ 
					// tag for changing alert color (alert-success or alert-danger)
					String tag = "";
					// msg for message regarding user details updation
					String msg = "";
					// If user has been updated successfully
					if (isUpdated) {
						// set user new details for session
						User user = UserController.getUserById(userId);
						httpsession.setAttribute("user", user);
						tag = "success";
						msg = "Details Updated Successfully";
					
					} else {
						tag = "danger"; 
						msg = "Details did not Updated";
					}
					// Creating alert message for displaying to user
					String msgAlert = "<div class='alert alert-"+tag+" alert-dismissible fade show my-3' role='alert'>" + 
							"  <strong>"+msg+"</strong>" + 
							"  <button type='button' class='close' data-dismiss='alert' aria-label='Close'>" + 
							"    <span aria-hidden='true'>&times;</span>" + 
							"  </button>" + 
							"</div>";
					// Setting alert message to request attribute
					request.setAttribute("updateUserMessage", msgAlert);
					// Forwarding request to user-dispalay.jsp page to display message to user
					rd.forward(request, response);
				} // if(MultipartContent) end
			}
		}
		// If Any Servlet Exception Occurs Then Redirect To 500 Error Page or Maintenance Page
		catch (Exception ex) {
			ex.printStackTrace();
			response.sendRedirect("500.jsp");
		} finally {
			out.close();
		}
	}
}
