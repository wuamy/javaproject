<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javabean.UserBean"%>

<%
	String username=request.getParameter("username");
	String password1=request.getParameter("password1");
	String email=request.getParameter("email");
	
	//register user
	UserBean userBean = new UserBean();
	boolean isExist = userBean.isExist(username);
	
	if(!isExist){
		userBean.add(username, password1, email);
		response.sendRedirect("../login.jsp");
	}else{
		response.sendRedirect("../register.jsp");
	}

%>
