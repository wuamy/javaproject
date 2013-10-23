<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javabean.UserBean" %>
<%
	response.setContentType("text/xml");
	response.setHeader("Cache-Control","no-cache");
	String username = request.getParameter("username");
	
	UserBean userBean2 = new UserBean();
	boolean isExist2=userBean2.isExist(username);
	
	
	if(isExist2){
		out.println("<content>this user is existing!</content>");
	}else{
		out.println("<content>OK</content>");
	}
	
%>