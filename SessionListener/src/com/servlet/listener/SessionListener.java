package com.servlet.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class SessionListener
 *
 */
public class SessionListener implements HttpSessionListener {

    private int sessionCount = 0;
	/**
     * Default constructor. 
     */
    public SessionListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent event) {
        synchronized (this){
        	sessionCount++;
        }
        
        System.out.println("Session Created: " + event.getSession().getId());
        System.out.println("Total Session: " + sessionCount);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent event) {
    	synchronized (this){
    		sessionCount--;
    	}
    	System.out.println("Session Destroyed: " + event.getSession().getId());
    	System.out.println("Total Sessions: " + sessionCount);
    }
	
}
