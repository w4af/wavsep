package com.sectooladdict.filters;

import java.io.IOException;
import java.io.InputStream;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class FakeHiddenFileDefaultResponseFilter
 */
public class FakeHiddenFileDefaultResponseFilter implements Filter {

    /**
     * Default constructor. 
     */
    public FakeHiddenFileDefaultResponseFilter() {
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
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		InputStream is = null;
		String filePath = httpRequest.getPathInfo();

		if(filePath == null) {
			filePath = "";
		}
		
		if(getFilterConfig() != null) {
			is = getFilterConfig().getServletContext().getResourceAsStream(
					httpRequest.getServletPath().toString() + filePath);		
		} 
		
		if (is == null) {
			getFilterConfig().getServletContext()
				.getRequestDispatcher("/index.jsp").forward(request, response);
			
		} else {
			// pass the request along the filter chain
			chain.doFilter(request, response);
		} // end of inner if/else block
	}

} //end of filter
