<%@ page language="java" pageEncoding="ISO-8859-1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>FHL Information Management - Login</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="amy,information,management,register">
<meta http-equiv="description" content="FHL Information System">

<!-- adding css file here -->
<link rel="stylesheet" type="text/css" href="../css/style.css">

<!-- adding javascript here -->
<script type="text/javascript">
function validLogin(theform){
	var username = theform.username.value;
	var password = theform.password.value;
	
	if(username==""){
		alert("username cannot be empty! please enter user name!");
		return false;
	}
	if(password==""){
		alert("password cannot be empty! please enter user password!");
		return false;
	}
	return true;
}
</script>
</head>
<body bgcolor="#52BDFE">
<table height="100%" width="100%">
	<tr>
		<td align="center">
		<table width="572" height="307" background="">
			<tr>
				<td width="60%"></td>
				<td>
				<form name="form1" action="login.do" method="post" onsubmit="return validLogin(this);">
					<table>
						<tr>
							<td>User Name:</td>
							<td><input type="text" name="username" size="10"></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input type="password" name="password" size="10"></td>
						</tr>
						<tr>
							<td colspan="2"><a href="register.jsp">Register</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="subment" value="Login"></td>
						</tr>
					</table>
				</form>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

</body>
</html>