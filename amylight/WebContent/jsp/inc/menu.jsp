<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table width="100%" bgcolor="#EEEEEE">
			<tr>
				<td>
				<ul>
					<li><a href="welcome.jsp">Home</a></li>
				</ul>
				</td>
			</tr>
			<tr>
				<td>
				<ul>
					<li><a href="#">Communication Tool</a></li>
				</ul>
				<ul class="ulnotab">
					<li><a href="action/address.jsp?method=list">Address Book Management</a></li>
					<li><a href="sms.jsp">Short Message Management</a></li>
				</ul>
				</td>
			</tr>
			<tr>
				<td>
				<ul>
					<li><a href="#">User Management</a></li>
				</ul>
				<ul class="ulnotab">
					<li><a href="schedule.jsp">My Calendar</a></li>
					<li><a href="worklog.jsp">Work Log</a></li>
				</ul>
				</td>
			</tr>
			<tr>
				<td>
				<ul>
					<li><a href="#">Company Management</a></li>
				</ul>
				<ul class="ulnotab">
					<li><a href="notice.jsp">Company Notice</a></li>
					<li><a href="meeting.jsp">Company Meeting</a></li>
				</ul>
				</td>
			</tr>
			<tr>
				<td>
				<ul>
					<li><a href="action/logout.jsp">Log Off</a></li>
				</ul>
				</td>
			</tr>
		</table>
</body>
</html>