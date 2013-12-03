package com.utils;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CounterListener
 */
@WebServlet("/CounterListener")
public class CounterListener implements HttpSessionListener {
	private static final long serialVersionUID = 1L;
	
	public static int count;
	       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CounterListener() {
        count = 0;
    	       
    }

	/**
	 * create a session
	 */
	
    public void sessionCreated(HttpSessionEvent se){
    	count++;
    }
    
    // trigger when session is gone
    public void sessionDestroyed(HttpSessionEvent se){
    	if(count>0)count--;
    }
}
