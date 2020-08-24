// paytm package 
package com.buyfy.paytm;

//Import Files Used In this Program
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Enumeration;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyfy.controllers.OrderController;
import com.buyfy.mail.Mail;
import com.buyfy.model.Order;
import com.paytm.pg.merchant.CheckSumServiceHelper;

/**
 * Servlet implementation class PaytmResponseServ
 * In this servlet we get detail from paytm and send the essential details
 * of transc. to user in form of pdf
 */
@WebServlet("/PaytmResponseServ")
public class PaytmResponseServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	// No Argument PaytmResponseServ Constructor
    public PaytmResponseServ() 
    {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Enumeration<String> paramNames = request.getParameterNames();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Map<String, String[]> mapData = request.getParameterMap();
		TreeMap<String,String> parameters = new TreeMap<String,String>();
		String paytmChecksum =  "";
		while(paramNames.hasMoreElements()) {
			String paramName = (String)paramNames.nextElement();
			if(paramName.equals("CHECKSUMHASH")){
				paytmChecksum = mapData.get(paramName)[0];
			}else{
				parameters.put(paramName,mapData.get(paramName)[0]);
			}
		}
		boolean isValideChecksum = false;
		String outputHTML="";
		try{
			//verify the credentials of merchant
			isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY,parameters,paytmChecksum);
			if(isValideChecksum && parameters.containsKey("RESPCODE"))
			{
				//response code 01 means trans. was successful
				if(parameters.get("RESPCODE").equals("01"))
				{
					for(Entry<String, String> s: parameters.entrySet()) 
					{
						System.out.println(s.getKey()+" : "+s.getValue());
					}
					
					//get the orderID from paytm
					long orderId = Long.parseLong(parameters.get("ORDERID"));
					
					//get the transc.ID from paytm
					String paytmPaymentID = parameters.get("TXNID");
					
					//get the order ID related to this transc.
					Order order = OrderController.getOrderById(orderId);
					
					//get the shipping details of user
					order.setTransacStatus(true);
					//set the payment date
					order.setPaymentDate(new Date());
					//set the payment ID
					order.setPaytmPaymentID(paytmPaymentID);
					OrderController.updateOrder(order);
					
					// Creating PDF for Order Invoice
					final String PDF_REL_PATH = "/details/users/user_invoice/";
					final String PDF_ABS_PATH = getServletContext().getRealPath(PDF_REL_PATH);

					String pdfFileName = Mail.createInvoicePDF(order, PDF_ABS_PATH);
					
					// sending mail with PDF Order Invoice attachment to Customer email
					Mail.sendPdfInvoice(order.getFirstName()+order.getLastName(), order.getUser().getEmail(), 
							order.getId(), PDF_ABS_PATH, pdfFileName);
					response.sendRedirect("DisplayAllOrdersServ");
				}
				else//if response code 00 means transaction was unsuccessful
				{
					outputHTML="<b>Payment Failed.</b>";
					response.sendRedirect("DisplayAllOrdersServ");
				}
			}
			else//if merchant credentials mismatched
			{
				outputHTML="<b>Checksum mismatched.</b>";
			}
			out.print(outputHTML);
		}
		catch(Exception e)//handle the exceptions
		{
			outputHTML=e.toString();
			e.printStackTrace();
		}
	}

}