<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	response.setContentType("text/xml");
	response.setHeader("Cache-Control","no-cache");
	String username=request.getParameter("username");
	
	boolean isValid=false;
	if(username.equals("admin")){
		isValid=true;
	}
	
	if(isValid){
		out.println("<content>this user exists already!</content>");
	}else{
		out.println("<content>OK!</content>");
	}




%>