<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>

<%

	String username = request.getParameter("user");
	List<String> users = (List<String>)session.getAttribute("users"); 
	
	if(null == users){
		users = new ArrayList<String>();
	}
	users.add(username);
	session.setAttribute("users", users);
	response.sendRedirect("index.jsp");

%>