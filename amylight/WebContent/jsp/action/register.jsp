<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="../inc/db.jsp"%>

<%
	String username=request.getParameter("username");
	String password1=request.getParameter("password1");
	String email=request.getParameter("email");
	
	//register user
	boolean isValid=false;
	String sql="select * from user where username='"+username+"'";
	
	try{
		Class.forName(drv).newInstance();
		Connection conn=DriverManager.getConnection(url,usr,pwd);
		Statement stm=conn.createStatement();
		ResultSet rs=stm.executeQuery(sql);
		if(!rs.next()){
			sql="insert into user(username,password,email)values('"+username+"','"+password1+"','"+email+"')";
			stm.execute(sql);
			isValid=true;
		}
		rs.close();
		stm.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
		out.println(e);
	}
	
	if(isValid){
		response.sendRedirect("../login.jsp");
	}else{
		response.sendRedirect("../register.jsp");
	}

%>
