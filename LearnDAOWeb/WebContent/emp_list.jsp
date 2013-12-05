<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.dao.vo.*, com.dao.factory.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Java DAO -- List All</title>
</head>
<body>
<%
	try{
		String keyWord = request.getParameter("kw");
		if(keyWord==null){
			keyWord="";
		}
		List<Emp> all = DAOFactory.getIEmpDAOInstance().findAll(keyWord);
		Iterator<Emp> iter=all.iterator();
%>
<center>
<form action="emp_list.jsp" method="post">
	Enter searching Words: <input type="text" name="kw">
	<input type="submit" value="You got Luck!"><br><br>
</form>
<table border="1" width="80%">
	<tr>
		<td>Employee ID</td>
		<td>Employee Name</td>
		<td>Employee Job</td>
		<td>Employee Salary</td>
		<td>Employee Hiring Date</td>
	</tr>
<%
	while(iter.hasNext()){
		Emp emp = iter.next();
	
%>
	<tr>
		<td><%=emp.getEmpno()%></td>
		<td><%=emp.getEname()%></td>
		<td><%=emp.getJob()%></td>
		<td><%=emp.getSal()%></td>
		<td><%=emp.getHiredate()%></td>
	</tr>
<%
	}
%>		
</table>	
</center>
<%
} catch(Exception e){
	e.printStackTrace();
}
%>

</body>
</html>