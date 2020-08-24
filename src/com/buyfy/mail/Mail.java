// Package - mail
package com.buyfy.mail;

/*
 * Imports statements used
 */
// Importing Java IO and Util
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

// Importing Jars for mailing
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

// Importing PDF Jars
import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;

// Importing Order and ProductQuantity Models
import com.buyfy.model.Order;
import com.buyfy.model.ProductQuantity;

public class Mail {
	
	// This will send a Greeting mail for users created BuyFy Account
	public static void sendNewAccountGreetMail(String name, String email) {
		// authentication info
		final String username = "bufy.cart@gmail.com";
		final String password = "BuyFy@123";
		String fromEmail = "bufy.cart@gmail.com";
		String toEmail = email;

		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		// this "smtp.gmail.com" should be change according to mail system
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		// Start our mail message
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(fromEmail));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			msg.setSubject("Account created");

			Multipart emailContent = new MimeMultipart();

			// Text body part
			MimeBodyPart text = new MimeBodyPart();
			text.setText("<html><head></head><body><tbody><tr><td align='center'></td>"
					+ "</tr><tr><td><table align='center' cellpadding='0' cellspacing='0'>"
					+ "<tbody><tr><td align='center'><table border='0' cellspacing='0' cellpadding='0'>"
					+ "<tbody><tr><td align='center' style='padding-left:60px'><img src='https://i.ibb.co/PDH4g1L/logo.png' alt='BuyFy' title='BuyFy' height='50' width='100' class='CToWUd'>"
					+ "</td><td align='right' valign='top'></td></tbody></table></td></tr><tr><td align='center'></td></tr><tr>"
					+ "<td align='left' style='padding-left:20px;font-family:\"Open Sans\",sans-serif,arial;font-size:20px;font-weight:600;line-height:26.5px;color:#222'><br>Welcome "
					+ name
					+ "</td></tr><tr><td style='height:10px'></td></tr><tr><td><table width='100%' border='0' cellpadding='0' cellspacing='0'>"
					+ "<tbody><tr><td style='height:25px'></td></tr><tr>"
					+ "<td align='left' style='padding-left:20px;font-family:\"Open Sans\",sans-serif,arial;font-size:15px;font-weight:600;line-height:23px;color:#222'>"
					+ " Welcome to BuyFy, we are glad to welcome you as our own in the BuyFy family. Our family is increasing with the support of customers like you."
					+ " We are thankful to you for choosing BuyFy over others, and we will do everything to provide you with our best goods and services. We will help"
					+ " you to provide you with our latest news and offers at the earliest.We will take our best initiative to serve you. Stay safe and Keep shopping"
					+ "<br><br>Thank You!</td></tr></tbody></table></td></tr></body></html>", "US-ASCII", "html");
			emailContent.addBodyPart(text);

			// Attach body parts
			msg.setContent(emailContent);

			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	// Sending Mail Verifcation
	public static int sendVerificationMail(String name, String email) {
		// authentication info
		final String username = "bufy.cart@gmail.com";
		final String password = "BuyFy@123";
		String fromEmail = "bufy.cart@gmail.com";
		String toEmail = email;

		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com"); // this "smtp.gmail.com" should be change according to mail
															// system
		properties.put("mail.smtp.port", "587");

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		int low = 100000;
		int high = 999999;
		final int OTP = (int) (Math.random() * (high - low)) + low;

		// Start our mail message
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(fromEmail));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
			msg.setSubject("Verification Mail");

			Multipart emailContent = new MimeMultipart();

			// Text body part
			MimeBodyPart text = new MimeBodyPart();
			text.setText("<html><head></head><body>" + "Your One Time Password is " + OTP + "</body></html>",
					"US-ASCII", "html");
			text.setText("<html><head></head><body><tbody><tr><td align='center'></td>"
					+ "</tr><tr><td><table align='center' cellpadding='0' cellspacing='0'>"
					+ "<tbody><tr><td align='center'><table border='0' cellspacing='0' cellpadding='0'>"
					+ "<tbody><tr><td align='center' style='padding-left:60px'><img src='https://i.ibb.co/PDH4g1L/logo.png' alt='BuyFy' title='BuyFy' height='50' width='100' class='CToWUd'>"
					+ "</td><td align='right' valign='top'></td></tbody></table></td></tr><tr><td align='center'></td></tr><tr>"
					+ "<td align='left' style='padding-left:20px;font-family:\"Open Sans\",sans-serif,arial;font-size:20px;font-weight:600;line-height:26.5px;color:#222'><br>"
					+ "To complete your sign in, please enter the following code for verification :" + OTP
					+ "</td></tr><tr><td style='height:10px'></td></tr><tr><td><table width='100%' border='0' cellpadding='0' cellspacing='0'>"
					+ "<tbody><tr><td style='height:25px'></td></tr><tr>"
					+ "<td align='left' style='padding-left:20px;font-family:\"Open Sans\",sans-serif,arial;font-size:15px;font-weight:600;line-height:23px;color:#222'>"
					+ "BuyFy takes your account security very seriously. BuyFy will never email you and ask you to disclose or verify your account BuyFy password, credit card, or banking"
					+ "account number. If you reciecve a suspicious email with a link to update your account information, do not click on the link instead, report the email to Amazon for investigation."
					+ "<br><br>Thanks for visiting BuyFy<br>BuyFy.com</td></tr></tbody></table></td></tr></body></html>",
					"US-ASCII", "html");
			emailContent.addBodyPart(text);

			// Attach body parts
			msg.setContent(emailContent);

			Transport.send(msg);
			System.out.println("----- Email Sent ----");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return OTP;
	}

	// Creating PDF For Customer Order Bill Invoice
	public static String createInvoicePDF(Order order, String PDF_File_PATH) {
		// Customer Details
		System.out.println("ORDER" + order);
		final String CUSTOMER_NAME = order.getFirstName() + " " + order.getLastName();
		Set<ProductQuantity> prodQtySet = order.getProducts();
		Iterator<ProductQuantity> pQtyItr = prodQtySet.iterator();
		final int TOTAL_PRODUCTS = prodQtySet.size();
		final String EMAIL = order.getUser().getEmail();
		final long ORDER_ID = order.getId();
		final long CUSTOMER_ID = order.getUser().getId();
		final String CUSTOMER_ADDRESS = order.getAddress().getAddressLine1() + " "
				+ order.getAddress().getAddressLine2();
		/*
		 * Creating PDF File name with customer email and order Id in between with an
		 * underscore for a precaution for duplicate files names.
		 */
		final String PDF_FILE_NAME = EMAIL + "_" + ORDER_ID + ".pdf";
		// creating output file path for saving Customer PDF Invoice
		String outputFilePath = PDF_File_PATH + PDF_FILE_NAME; // New file
		// PDF Template for our BuyFy WebSite Billing invoices
		String inputFilePath = PDF_File_PATH + "default.pdf"; // Existing
																// file
		try {
			PdfReader pdfReader = new PdfReader(inputFilePath);
			Document doc = new Document(PageSize.A4); // set page size as A4
			PdfWriter writer = PdfWriter.getInstance(doc, new FileOutputStream(outputFilePath));
			doc.open();
			PdfContentByte pdfContentByte = writer.getDirectContent();
			PdfImportedPage page;
			OutputStream fos = new FileOutputStream(new File(outputFilePath));
			PdfStamper pdfStamper = new PdfStamper(pdfReader, fos);

			// Max No of order rows can a page have (18)
			int maxOrderNo = 18;
			int totalpage = (int) Math.ceil((double) TOTAL_PRODUCTS / maxOrderNo);

			// This inserts new line in the page
			pdfStamper.insertPage(pdfReader.getNumberOfPages() + totalpage, pdfReader.getPageSizeWithRotation(1));

			int j = 0;
			// loop on all the PDF pages
			// i is the pdfPageNumber
			int incrementpage = totalpage % 2 == 0 ? 1 : 0;

			for (int i = 0; i <= pdfReader.getNumberOfPages() + incrementpage; i++) {
				page = writer.getImportedPage(pdfReader, 1);
				pdfContentByte.addTemplate(page, 1f, 0, 0, 1, 0, 0);

				// Add text in existing PDF
				pdfContentByte.beginText();

				pdfContentByte.setFontAndSize(
						BaseFont.createFont(BaseFont.TIMES_BOLD, BaseFont.CP1257, BaseFont.EMBEDDED), 12);

				pdfContentByte.setTextMatrix(60, 650);// set x and y co-ordinates
														// 0, 800 will write text on TOP LEFT of pdf page
														// 0, 0 will write text on BOTTOM LEFT of pdf page

				pdfContentByte.showText("Name");// set the customer of name in pdf file
				pdfContentByte.setTextMatrix(160, 650);
				pdfContentByte.showText(" : " + CUSTOMER_NAME);

				pdfContentByte.setTextMatrix(60, 630);// set the position of customer ID in pdf file
				pdfContentByte.showText("Customer ID");

				pdfContentByte.setTextMatrix(160, 630);// set the position of customer ID in pdf file
				pdfContentByte.showText(" : " + CUSTOMER_ID);

				pdfContentByte.setTextMatrix(60, 610);// set the position of Order ID in pdf file
				pdfContentByte.showText("Order ID");

				pdfContentByte.setTextMatrix(160, 610);// set the position of Order ID in pdf file
				pdfContentByte.showText(" : " + ORDER_ID);

				pdfContentByte.setTextMatrix(60, 590);// set the position of customer Address in pdf file
				pdfContentByte.showText("Address");

				pdfContentByte.setTextMatrix(160, 590);
				if (CUSTOMER_ADDRESS.length() > 30) {
					int tmpChange = 590;
					int size = 60;
					/*
					 * we check if the address length is greater then 60 then we split it in parts
					 * so that not overlap with other position
					 */
					String[] arr = CUSTOMER_ADDRESS.split("(?<=\\G.{" + size + "})");
					for (String s : arr) {
						pdfContentByte.setTextMatrix(160, tmpChange);
						pdfContentByte.showText(" : " + s);
						tmpChange -= 10;
					}
				} else {
					pdfContentByte.setTextMatrix(160, 590);
					pdfContentByte.showText(" : " + CUSTOMER_ADDRESS);// set the position of customer Address in pdf
																		// file
				}

				pdfContentByte.setFontAndSize(BaseFont.createFont(BaseFont.TIMES_BOLD, // Font name
						BaseFont.CP1257, // Font encoding
						BaseFont.EMBEDDED // Font embedded
				), 17); // set font and size

				pdfContentByte.setTextMatrix(100, 550);
				pdfContentByte.showText("SNo");// set the position of SNo in pdf file
				pdfContentByte.setTextMatrix(150, 550);
				pdfContentByte.showText("Product");// set the position of Product in pdf file
				pdfContentByte.setTextMatrix(400, 550);
				pdfContentByte.showText("Qty");// set the position of Price in pdf file
				pdfContentByte.setTextMatrix(450, 550);
				pdfContentByte.showText("Price");

				int change = 540;
				int temp = j;
				while (j < temp + maxOrderNo && pQtyItr.hasNext() && change > 170) {
					int tchange = 0, flag = 0;
					change -= 20;
					ProductQuantity pQty = pQtyItr.next();
					pdfContentByte.setTextMatrix(100, change);
					pdfContentByte.showText("" + (j + 1));
					/*
					 * we check if the product name length is greater then 16 then we split it in
					 * parts so that not overlap with other position
					 */
					if (pQty.getProduct().getName().length() > 16) {
						int sizes = 25;
						String[] arr = pQty.getProduct().getName().split("(?<=\\G.{" + sizes + "})");// here we split
																										// the string in
																										// fixed sizes
						tchange = change;
						flag = 1;// if product name greater then 16 we set flag to 1
						for (String s : arr) {
							pdfContentByte.setTextMatrix(150, change);// set the position of product name
							pdfContentByte.showText(s);
							change -= 20;
						}
					} else {
						pdfContentByte.setTextMatrix(150, change);// set the position of product name
						pdfContentByte.showText(pQty.getProduct().getName());
					}
					// here we check flag is 1 then we make changes in position so that nothing is
					// overlap
					if (flag == 1) {
						pdfContentByte.setTextMatrix(400, tchange);
						pdfContentByte.showText("" + pQty.getQuantity());// set the position of product qty
						double price = pQty.getProduct().getDiscountedPrice() > 0
								? pQty.getProduct().getDiscountedPrice() // calculate the product price according to
																			// their qty
								: pQty.getProduct().getPrice();
						pdfContentByte.setTextMatrix(450, tchange);// set the position of product price
						pdfContentByte.showText("" + price);
					} else// else we not make changes
					{
						pdfContentByte.setTextMatrix(400, change);
						pdfContentByte.showText("" + pQty.getQuantity());// set the position of product qty
						double price = pQty.getProduct().getDiscountedPrice() > 0
								? pQty.getProduct().getDiscountedPrice() // calculate the product price according to
																			// their qty
								: pQty.getProduct().getPrice();
						pdfContentByte.setTextMatrix(450, change);// set the position of product price
						pdfContentByte.showText("" + price);
					}
					j++;
				}

				if (j == TOTAL_PRODUCTS || (!pQtyItr.hasNext())) {
					change -= 30;
					pdfContentByte.setTextMatrix(100, change);// set the position of product total price
					pdfContentByte.showText("Total Amount");

					pdfContentByte.setTextMatrix(400, change);
					pdfContentByte.showText("" + order.getAmount());
					pdfContentByte.endText();
					break;
				}

				pdfContentByte.endText();
				doc.newPage();// insert new page
			}

			doc.close();
		} catch (Exception ex) {
			System.out.println(ex);
			return "";
		}
		return PDF_FILE_NAME;
	}

	// For Sending Customer Order Bill Invoice in PDF Format 
	public static void sendPdfInvoice(String name, final String TO_EMAIL, long orderID, final String PDF_PATH_NAME,
			String filename) {
		// authentication info
		final String USERNAME = "bufy.cart@gmail.com"; // the mail address of our company
		final String PASSWORD = "BuyFy@123"; // the password of our mail
		final String FROM_EMAIL = "bufy.cart@gmail.com";

		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com"); // this "smtp.gmail.com" should be change according to mail
															// system
		properties.put("mail.smtp.port", "587");

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(USERNAME, PASSWORD);// here we verify the password and username
			}
		});
		// Start our mail message
		MimeMessage msg = new MimeMessage(session);
		try {
			msg.setFrom(new InternetAddress(FROM_EMAIL));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(TO_EMAIL));// here we set the email address
																						// of user
			msg.setSubject("E-Invoice");// set the subject of mail

			Multipart emailContent = new MimeMultipart();

			// Text body part
			MimeBodyPart text = new MimeBodyPart();
			text.setText("<html><head></head><body><tbody><tr><td align='center'></td>"
					+ "</tr><tr><td><table align='center' cellpadding='0' cellspacing='0'>"
					+ "<tbody><tr><td align='center'><table border='0' cellspacing='0' cellpadding='0'>"
					+ "<tbody><tr><td align='center' style='padding-left:60px'><img src='https://i.ibb.co/PDH4g1L/logo.png' alt='BuyFy' title='BuyFy' height='50' width='100' class='CToWUd'>"
					+ "</td><td align='right' valign='top'></td></tbody></table></td></tr><tr><td align='center'></td></tr><tr>"
					+ "<td align='left' style='padding-left:20px;font-family:\"Open Sans\",sans-serif,arial;font-size:20px;font-weight:600;line-height:26.5px;color:#222'><br>Dear "
					+ name
					+ "</td></tr><tr><td style='height:10px'></td></tr><tr><td><table width='100%' border='0' cellpadding='0' cellspacing='0'>"
					+ "<tbody><tr><td style='height:25px'></td></tr><tr>"
					+ "<td align='left' style='padding-left:20px;font-family:\"Open Sans\",sans-serif,arial;font-size:15px;font-weight:600;line-height:23px;color:#222'>"
					+ "<p style='font-family:verdana'>Thank you for shopping with us.</p>"
					+ "<p style='font-family:verdana'>Your Order has been placed having Order ID " + orderID + "</p>"
					+ "<p style='font-family:verdana'>Your Orders details are in pdf.</p></td></tr></tbody></table></td></tr></body></html>",
					"US-ASCII", "html");
			emailContent.addBodyPart(text);

			MimeBodyPart messageBodyPart2 = new MimeBodyPart();

			DataSource source = new FileDataSource(PDF_PATH_NAME + filename);
			messageBodyPart2.setDataHandler(new DataHandler(source));// here we attached the product invoice pdf file
			messageBodyPart2.setFileName(filename);
			emailContent.addBodyPart(messageBodyPart2);// add content to mail body
			// Attach body parts
			msg.setContent(emailContent);

			Transport.send(msg);// send the mail
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
