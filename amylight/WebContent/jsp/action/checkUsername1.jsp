<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="../inc/db.jsp" %>
<%
	response.setContentType("text/xml");
	response.setHeader("Cache-Control","no-cache");
	String username = request.getParameter("username");
	
	boolean isValid=false;
	String sql="select * from user where username='"+username+"'";
	
	try {
		Class.forName(drv).newInstance();
		Connection conn = DriverManager.getConnection(url,usr,pwd);
		Statement stm=conn.createStatement();
		ResultSet rs = stm.executeQuery(sql);
		if(rs.next())isValid=true;
		rs.close();
		stm.close();
		conn.close();
	} catch(Exception e){
		e.printStackTrace();
		out.println(e);
	}finally {}
	
	if(isValid){
		out.println("<content>this user is existing!</content>");
	}else{
		out.println("<content>OK</content>");
	}
	
%>