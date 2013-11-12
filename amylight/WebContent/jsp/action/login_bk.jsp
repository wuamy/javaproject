<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javabean.UserBean" %>    

<%
	//get param
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	
	//verify login
	UserBean userBean2= new UserBean();
	boolean isValid = userBean2.valid(username, password);
	
	if(isValid){
		session.setAttribute("username",username);
		response.sendRedirect("../welcome.jsp");
				
	}else {
		response.sendRedirect("../login.jsp");
	}
	

%>