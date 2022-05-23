package com.sectooladdict.filters;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

/**
 * Servlet Filter implementation class FakeHiddenFileDynamicResponseFilter
 */
public class FakeHiddenFileDynamicResponseFilter implements Filter {

	/**
	 * Default constructor. 
	 */
	public FakeHiddenFileDynamicResponseFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * The local filter config object, used to access the local servlet context. 
	 */
	FilterConfig config;

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		setFilterConfig(fConfig);
	}

	public void setFilterConfig(FilterConfig newConfig) {
		this.config = newConfig;
	}

	public FilterConfig getFilterConfig() {
		return this.config;
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
		long timestamp = System.currentTimeMillis();
		//Present a dynamic response (timestamp) to any URL access
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<title>Status Page</title>");
		out.println("<body>");
		out.println("<h1>The System Status is ON</h1>");
		out.println("The current system timestamp is " + timestamp + "<br>");
		out.println("Activating the location services requires manual configuration<br>");
		out.println("</body>");
		out.println("</html>");
	}

} //end of filter
