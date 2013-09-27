<%@ page language="java" pageEncoding="ISO-8859-1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>FHL Information Management - Register</title>
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="keywords" content="FHL,information,management,register" />
<meta http-equiv="description" content="FHL Information System" />

<!-- link css script -->
<link rel="stylesheet" type="text/css" href="../css/style.css">

<!-- adding javascript for registration validation -->
<script type="text/javascript">

//create a varible
var XMLHttpReq=false;

function validRegister(theform){
	var username=theform.username.value;
	var password1=theform.password1.value;
	var password2=theform.password2.value;
	var email=theform.email.value;
	if(username==""){
		alert("username cannot be empty!");
		return false;
	}
	if(password1==""){
		alert("password cannot be empty!");
		return false;
	}
	if(password1!=password2){
		alert("two password are not the same!");
		return false;
	}	
	return true;
	
}

//1. create a XMLHttpRequest object
function createXMLHttpRequest(){
	if(window.XMLHttpRequest){	//Mozilla
		XMLHttpReq=new XMLHttpRequest();
	}
	else if(window.ActiveXObject){
		try{
			XMLHttpReq=new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				XMLHttpReq=new ActiveXObject("Microsoft.XMLHTTP");
			}catch(e){}
		}
		
	}
}

//2. send request
function send(url){
	createXMLHttpRequest();
	XMLHttpReq.open("GET",url,true);
	XMLHttpReq.onreadystatechange=parse;
	XMLHttpReq.send(null);
}

//3. parse func
function parse(){
	if(XMLHttpReq.readyState==4){
		if(XMLHttpReq.status==200){//return info successfully, begin exe info
			var res=XMLHttpReq.responseXML.getElementsByTagName("content")[0].firstChild.data;
			if(res == "ok"){
				document.getElementById("status").innerHTML="You can user this ID!";
			}else{
				document.getElementById("status").innerHTML=res;
				window.alert(res);
			}
		}else{
			window.alert("there is an exception for your request!");
		}
	}
}

//4. check user ID
function checkUsername(){
	var username=document.getElementById("username").value;
	if(username==""){
		alert("Please enter username!");
		return false;
	}else{
		send('action/checkUsername.jsp?username='+username);
	}
}

</script>
</head>

<body bgcolor="#52BDFE" onload="document.form1.username.focus();">
<table height="100%" width="100%">
	<tr>
		<td align="center">
		
		<table width="572" height="307" background="">
			<tr>
				<td width="60%"></td>
				<td>
				<form name="form1" action="action/register.jsp" method="post" onsubmit="return validRegister(this);">
				<table width="200" border="0">
					<tr>
						<td colspan="2">
						<div id="status">Register New User</div>
						</td>
					</tr>
					<tr>
						<td>*User Name</td>
						<td><input type="text" name="username" size="10" onblur="checkUsername();"></td>
					</tr>
					<tr>
						<td>*Password:</td>
						<td><input type="password" name="password1" size="10"></td>
					</tr>
					<tr>
						<td>*Confirm Password:</td>
						<td><input type="password" name="password2" size="10"></td>
					</tr>
					<tr>
						<td>E-mail:</td>
						<td><input type="text" name="email" size="10"></td>
					</tr>
					<tr>
						<td colspan="2"><a href="login.jsp">Return to login</a><input type="submit" name="submit" value="submit"></td>
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