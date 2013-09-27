<%@ page language="java" pageEncoding="ISO-8859-1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>FHL Information System - Welcome</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="amy,information,management,register">
<meta http-equiv="description" content="Amy's Information System">
<link rel="stylesheet" type="text/css" href="../css/style.css">

<!-- adding javascript for validation -->
<script type="text/javascript" language="javascript">
function validAddressAdd(theform){
	var name = theform.name.value;
	var mobile = theform.mobile.value;
	var email = theform.email.value;
	if(name==""){
		alert("name cannot be empty! Please enter name!");
		return false;
	}
	if(mobile==""){
		alert("mobile cannot be empty! Please enter mobile!");
		return false;
	}
	if(email==""){
		alert("email cannot be empty! Please enter email information!");
		return false;
	}
	return true;
}
</script>
</head>
<body>
<div align="center">

<table height="100%" width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td colspan="2" height="108">
		<%@ include file="inc/top.jsp" %>
		</td>
	</tr>
	<tr>
		<td width="160" bgcolor="#EEEEEE" valign="top" height="100%">
		<%@ include file="inc/menu.jsp" %>
		
		</td>
		<td align="left" valign="top">
		<table width="100%" class="position">
			<tr>
				<td>current page >> Address Book&gt;&gt; Add New Address</td>
				<td align="right"><a href="address.jsp">Return AddressBook Home</a></td>
				<td width="20"></td>
			</tr>
		</table>
		
		<form name="form1" action="address_add.jsp" method="post" onsubmit="return validAddressAdd(this);"><b></b>
		<table border="0" width="100%">
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" maxlength="50" value="">
				</td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td><input type="text" name="gender" maxlength="10" value="">
				</td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input type="text" name="mobile" maxlength="20" value="">
				</td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input type="text" name="email" maxlength="50" value="">
				</td>
			</tr>
			<tr>
				<td>Company</td>
				<td><input type="text" name="company" maxlength="100" value="">
				</td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="address" maxlength="100" value="">
				</td>
			</tr>
			<tr>
				<td>Zipcode</td>
				<td><input type="text" name="zipcode" maxlength="10" value="">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Submit"></td>
			</tr>
		</table>
		</form>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
		<%@ include file="inc/foot.jsp" %>
		
		</td>
	</tr>

</table>

</div>
</body>
</html>