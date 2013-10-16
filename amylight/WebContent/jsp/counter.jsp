<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>counter</title>
</head>
<body>
<h1>JBuilder Generated JSP</h1>
<!-- init counter Bean, bean()-->
<jsp:useBean id="bean0" scope="application" class="count.counter" />
<%out.println("The Counter is : " + bean0.getCount()+"<BR>"); %>

</body>
</html>