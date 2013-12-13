<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
	function validate(f){
		if(!(/^\w{5,15}$/.test(f.userid.value))){
			alert("User ID must be 5~15 digits! ");
			f.userpass.focus();
			return false;
			
		}
		if(!(/^\w{5,15}$/.test(f.userpass.value))){
			alert("password must be 5~15 digits! ");
			f.userpass.foucs();
			return false;
		}
		return true;
	}
</script>
<title>Learn MVC Web</title>
</head>
<body>
<h2>Please login Your Account</h2>
<%
	List<String> info = (List<String>) request.getAttribute("info");
	if(info!=null){
		Iterator<String> iter = info.iterator();
		while(iter.hasNext()){
%>
		<h4><%=iter.next() %></h4>
<%
		}
	}
%>
<form action="LoginServlet" method="post" onSubmit="return validate(this)">
	User ID : <input type="text" name="userid"><br><br>
	User Password: <input type="password" name="userpass"><br><br>
	<input type="submit" value="submit"><input type="reset" value="Reset">
	

</form>


</body>
</html>