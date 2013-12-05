<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.vo.*,com.dao.factory.*" %>
<%@ page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Learn JavaDAO-Action</title>
</head>
<body>
<%
	Emp emp = new Emp();
	emp.setEmpno(Integer.parseInt(request.getParameter("empno")));
	emp.setEname(request.getParameter("ename"));
	emp.setJob(request.getParameter("job"));
	emp.setHiredate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("hiredate")));
	emp.setSal(Float.parseFloat(request.getParameter("sal")));
	try {
		if(DAOFactory.getIEmpDAOInstance().doCreate(emp)){
%>
	<h3>Employee Add Successfully!</h3>
<% 
	} else {
%>
	<h3>Employee Add Unsuccessfully!</h3>
<%		
	}
} catch(Exception e){
	e.printStackTrace();
}
%>

</body>
</html>