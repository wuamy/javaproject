<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.ResultSetMetaData" %>
<%
	String drv="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/demo";
	String usr="root";
	String pwd="mysqladmin";

%>