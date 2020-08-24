// Package - servlet
package com.buyfy.servlet;
/*
 * Import Statements used 
 */
// Importing Java IO and Utils 

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

//Importing Javax servlets

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Importing File Uploads

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
//Importing User Model and controllers 
import com.buyfy.controllers.ProductController;
import com.buyfy.model.Image;

/**
 * Servlet implementation class AddProductServ and SAVEorUPDATE
 */
@WebServlet("/AddProductServ")
public class AddProductServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddProductServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      // Set response content type
		response.setContentType("text/html");
		// Allocate a output writer to write the response message into the network
		// socket
		PrintWriter out = response.getWriter();
		try {
				/*
				 * Constatnt's for image's name and path
				 */
				// Path for where to save user image
				final String PROD_IMG_REL_PATH = "/images/products/";
				final String PROD_IMG_ABS_PATH = getServletContext().getRealPath(PROD_IMG_REL_PATH);
				final String PROD_DESC_REL_PATH = "/details/products/description/";
				final String PROD_DESC_ABS_PATH = getServletContext().getRealPath(PROD_DESC_REL_PATH);

				// If user does not provide user image then default will be provided
              //final String DEFAULT_IMAGE_NAME = "default.jpg";
				int maxFileSize = 5000 * 1024;
				int maxMemSize = 5000 * 1024;

				String fileName = null;
				File imageFile = null;
				Image image = null;
				Set<Image> productImages = new HashSet<>();
				/*
				 * Product Attributes
				 */
				long productId =0;
				long userId = 0;
				String categoryType = "";
				String categorySubType = "";
				String productName = "";
				String description =  "";
				String productFileName = "";
				double productPrice = 0.0;
				double productDiscountPrice = 0.0;
			
				// Checking if the request is MultiPart Content Request or not
				boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
				if (isMultipartContent) {
					DiskFileItemFactory factory = new DiskFileItemFactory();
					// Setting Max Memory Size for files
					factory.setSizeThreshold(maxMemSize);

					ServletFileUpload upload = new ServletFileUpload(factory);
					// Setting Max Memory Size for files
					upload.setFileSizeMax(maxFileSize);
//				try {
					/* Creating List of FileItes Iterator for iterating through all the data
					 * send by the form and Parsing all the data from request object
					 * */ 
						List<FileItem> fields = upload.parseRequest(request);
						Iterator<FileItem> it = fields.iterator();
						// Iterating through File Items 	.
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
									// If the file size is greater than 0 

									if (sizeInBytes > 0) {
										imageFile = new File(PROD_IMG_ABS_PATH + fileName);
										// If the Image With this Name is Already Present
										if (imageFile.exists()) {
											imageFile = new File(
													PROD_IMG_ABS_PATH + (int) (Math.random() * 100000000) + fileName);
										}
										// Writing Image File
										fileItem.write(imageFile);
										// creating image object and adding setting attributes values
										image = new Image();
										image.setName(imageFile.getName());
										image.setPath(PROD_IMG_REL_PATH);
										// add Images to set of Product Images
										productImages.add(image);

									}
								} catch (Exception e) {
									e.printStackTrace();
								}
								
							}
							// Fields which are not file type
							else {
								
								if (fileItem.getFieldName().equals("product-id")) {
									productId = Long.parseLong(fileItem.getString());
								} else if (fileItem.getFieldName().equals("user-id")) {
									userId = Long.parseLong(fileItem.getString());
								} else if (fileItem.getFieldName().equals("product-name")) {
									productName = fileItem.getString();
								} else if (fileItem.getFieldName().equals("category-type")) {
									categoryType = fileItem.getString();
								} else if (fileItem.getFieldName().equals("subcategory")) {
									categorySubType = fileItem.getString();
								} else if (fileItem.getFieldName().equals("product-description")) {
									description = fileItem.getString();
								} else if (fileItem.getFieldName().equals("product-price")) {
									productPrice = Double.parseDouble(fileItem.getString());
								} else if (fileItem.getFieldName().equals("product-discounted-price")) {
									productDiscountPrice = Double.parseDouble(fileItem.getString());
								} 
							}
						}
//					} catch (FileUploadException fux) {
//						fux.printStackTrace();
//					}
					int filenumber = (int)Math.ceil(Math.random()*1000000);
					File desc = new File(PROD_DESC_ABS_PATH+filenumber+".txt");
					if(!desc.exists()) {
						desc.createNewFile();
					}
					FileWriter fr = new FileWriter(desc);
					fr.write(description);
					fr.close();
					
					productFileName = desc.getName();
					/*
					 * Passing all the user details into updateUserAllDetails and this will
					 * update all the values. Details changed by user will be updated and 
					 * details not changed by the user will remain as it is.
					 */
					boolean isproductCreated = 
							ProductController.save(productName, userId, productFileName, productPrice, 
									productDiscountPrice, categoryType, categorySubType, productImages);

					// RequestDispatcher Object for index.html Page
					RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
					// msg for message regarding user details updation
					String msg = "";
					// tag for changing alert color (alert-success or alert-danger)
					String tag = "";
					if (isproductCreated) {
						tag = "success";
						msg = productName+" Created Successfully";
					
					} else {
						//changing color alert
						tag = "danger"; 
						msg = productName +" Not Created";
					}
					String msgAlert = "<div class='alert alert-"+tag+" alert-dismissible fade show m-0' role='alert'>" + 
							"  <strong>"+msg+"</strong>" + 
							"  <button type='button' class='close' data-dismiss='alert' aria-label='Close'>" + 
							"    <span aria-hidden='true'>&times;</span>" + 
							"  </button>" + 
							"</div>";
					request.setAttribute("productAddedMsg", msgAlert);
					rd.forward(request, response);

				} // if(MultipartContent) end
			}
		// If Any Servlet Exception Then Redirect To Error Page or Maintenance Page
		catch (Exception ex) {
			ex.printStackTrace();
//			response.sendRedirect("error.html");
		} finally {
			out.close();
		}
	}
	}


