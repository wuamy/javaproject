<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	session.invalidate();
%>
<h2>Session Destroyed successfully..</h2>
<a href="javascript:history.back()">Click here to go Back</a>