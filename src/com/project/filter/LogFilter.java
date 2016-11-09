package com.project.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

	// Implements Filter class
	public class LogFilter implements Filter  {
	   public void  init(FilterConfig config) 
	                         throws ServletException{
	      // Get init parameter 
	      String testParam = config.getInitParameter("test-param"); 

	      //Print the init parameter 
	      System.out.println("Test Param: " + testParam); 
	   }
	   public void  doFilter(HttpServletRequest request, 
	                 HttpServletResponse response,
	                 FilterChain chain) 
	                 throws java.io.IOException, ServletException {
		   String password = (String)request.getSession().getAttribute("userPassword");
		   String currentRequest = request.getRequestURI();
		   System.out.println("Current Request : "+currentRequest);
		   /*if(currentRequest.indexOf("/FirstProject/admin/login")!=-1 || currentRequest.indexOf("/FirstProject/admin/index")!=-1)
		   {
			   
			   if(password==null)
			   {
				   response.sendRedirect("/FirstProject/admin/show");
			   }
		   }
		   */
			   // Pass request back down the filter chain
	           chain.doFilter(request,response);
	       
	   }
	   public void destroy( ){
	      /* Called before the Filter instance is removed 
	      from service by the web container*/
	   }
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		// TODO Auto-generated method stub
		doFilter((HttpServletRequest)arg0, (HttpServletResponse)arg1, arg2);
	}
	}
