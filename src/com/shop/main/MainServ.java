package com.shop.main;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.buyfy.model.Order;
import com.buyfy.model.User;

/**
 * Servlet implementation class MainServ
 */
@WebServlet("/MainServ")
public class MainServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		user.setId(1);
		user.setEmail("akshat@gmail.com");
		System.out.println("MAIN SERV");
		Order o =new Order();
		o.setAmount(1);
		o.setId(27);
		o.setUser(user);
	
		request.setAttribute("order", o);
		RequestDispatcher rd  = request.getRequestDispatcher("TxnTest.jsp");
		rd.forward(request, response);
	}

}
