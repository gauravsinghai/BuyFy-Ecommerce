
package com.buyfy.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.buyfy.model.User;

/**
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter(filterName = "/AdminFilter",
				urlPatterns = {"/DisplayAllUsersServ", "/DisplayAllProductsServ","/DisplayAllFeedback","/admin-dashboard.jsp",})
public class AdminFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AdminFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    	HttpSession session = ((HttpServletRequest) request).getSession();
    	User user= (User)session.getAttribute("user");
    	// Checking that the user is admin or not
        if(user.getAccountType().equals("admin")){
        	chain.doFilter(request, response);
        }
        else{
        	((HttpServletResponse) response).sendRedirect("index.jsp");
        } 
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
