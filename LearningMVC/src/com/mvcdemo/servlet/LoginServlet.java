package com.mvcdemo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import com.mvcdemo.factory.DAOFactory;
import com.mvcdemo.vo.*;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "login.jsp";
		String userid = request.getParameter("userid");
		String userpass = request.getParameter("userpass");
		List<String> info = new ArrayList<String>();
		if(userid == null || "".equals(userid)){
			info.add("user ID cannot be empty");
		}
		if(userpass==null || "".equals(userpass)){
			info.add("user password cannot be empty");
		}
		if(info.size()==0){
			User user = new User();
			user.setUserid(userid);
			user.setPassword(userpass);
			try{
				if(DAOFactory.getIUserDAOInstance().findLogin(user)){
					info.add("User Login Successfully, welcome " + user.getName());
				} else {
					info.add("User login failed, please enter correct login ID and password!");
				} 
					
			} catch (Exception e){
				e.printStackTrace();
			}
		}
		request.setAttribute("info",info);
		request.getRequestDispatcher(path).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
