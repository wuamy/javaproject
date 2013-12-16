<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Servlet Session Listener Example </title>
</head>
<body>
	<h2>Add User Screen</h2>
	<span stype="float: right">
	<a href="DestroySession.jsp">Destroy this session</a>
	</span>
	<form action="AddUser.jsp" method="post">
	<h3>Enter Username to add in Listen</h3>
	<input type="text" name="user" />
	<input type="submit" value="Add User" />
	</form>
	
	<%
		List<String> users = (List<String>)session.getAttribute("users"); 
		for(int i=0; null!=users && i < users.size(); i++){
			out.println("<br/>" + users.get(i));
		}
	%>

</body>
</html>