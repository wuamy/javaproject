<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="../inc/db.jsp" %>    

<%
	//get param
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	
	//verify login
	boolean isValid=false;
	String sql="select * from user where username='"+username+"'and password='"+password+"'";
	try {
		Class.forName(drv).newInstance();
		Connection conn=DriverManager.getConnection(url,usr,pwd);
		Statement stm=conn.createStatement();
		ResultSet rs=stm.executeQuery(sql);
		if(rs.next())isValid=true;
		rs.close();
		stm.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
		out.println(e);
	}finally{
		
	}
	if(isValid){
		session.setAttribute("username",username);
		response.sendRedirect("../welcome.jsp");
				
	}else {
		response.sendRedirect("../login.jsp");
	}
	

%>