package com.buyfy.filter;

import java.io.IOException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet Filter implementation class ValidateFilter
 */
@WebFilter(filterName = "/ValidateFilter",
			urlPatterns = {"/my-order.jsp", "/my-cart.jsp",
							"/add-product.jsp","/checkout.jsp","/admin-dashboard.jsp",})//pages on which filter applied
public class ValidateFilter implements Filter 
{
	/**
     * Default constructor. 
     */
    public ValidateFilter() {  }
    
	/**
	 * @see Filter#init(FilterConfig)
	 */
	@Override
	public void init(FilterConfig filterConfig) throws ServletException { } 
	
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException 
    {
    	HttpSession session = ((HttpServletRequest) request).getSession();
    	    	
        if(session.getAttribute("email") != null)//here we check that the user is valid to manipulate order,cart and to add product 
        {
        	chain.doFilter(request, response);// pass the request along the filter chain
        }
        else
        {
        	((HttpServletResponse) response).sendRedirect("login.jsp");//if not valid then user will redirect to login page
        } 
    }

    /**
	 * @see Filter#destroy()
	 */
	@Override
	public void destroy() {	}

	 
}