package com.demo.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javabean.UserBean;

public class LoginServlet extends HttpServlet {
	public final static long serialVerionUID = 0;
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		// get parameter
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//check login 
		UserBean userBean = new UserBean();
		boolean isValid = userBean.valid(username, password);
		if(isValid){
			session.setAttribute("username", username);
			response.sendRedirect("welcome.jsp");
		} else {
			response.sendRedirect("login.jsp");
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		doPost(request, response);
	}

}
