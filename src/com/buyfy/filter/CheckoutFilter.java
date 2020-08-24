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

/**
 * Servlet Filter implementation class CheckoutFilter
 */
@WebFilter(urlPatterns = {"/checkout.jsp"},filterName = "/CheckoutFilter")		//pages on which filter applied
public class CheckoutFilter implements Filter 
{
	/**
     * Default constructor. 
     */
    public CheckoutFilter() {  }
    
    /**
	 * @see Filter#destroy()
	 */
	public void destroy() {	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		HttpSession session = ((HttpServletRequest) request).getSession();
		if(session.getAttribute("cart").equals("{}"))		//here we check that the user cart have some product or not to proceed to checkout page
        {
			((HttpServletResponse) response).sendRedirect("index.jsp"); 
        }
        else
        {
        	chain.doFilter(request, response);  //if cart is empty user will redirect it to index.jsp page
        } 
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException 
	{	}
}