<%@ page language="java" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Amy's Information System - Welcome</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="amy,information,management,register">
<meta http-equiv="description" content="Amy's Information System">

<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<%
	String pageSize=(String)request.getAttribute("pageSize");
	String pageNo=(String)request.getAttribute("pageNo");
%>

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
				<td>current page >> Address Book</td>
				<td align="right"><a href="../address_add.jsp?method=add&pageSize=<%=pageSize%>&pageNo=<%=pageNo%>">New Contact</a></td>
				<td width="20"></td>
			</tr>
		</table>
		<b></b>
		<table border="0" width="100%">
			<tr class="tableheader">
				<td>Name</td>
				<td>Gender</td>
				<td>Mobile</td>
				<td>E-Mail</td>
				<td>Company</td>
				<td>Address</td>
				<td>Zipcode</td>
				<td>Operation</td>
			</tr>
			<%
				List<Hashtable<String,String>>list=(List<Hashtable<String,String>>)request.getAttribute("list");
				Iterator<Hashtable<String,String>>it=list.iterator();
				while(it.hasNext()){
					Hashtable<String,String>hash=it.next();
					String id=hash.get("Id");
			%>
			<tr>
				<td><%=hash.get("name")%></td>
				<td><%=hash.get("sex") %></td>
				<td><%=hash.get("mobile") %></td>
				<td><%=hash.get("email") %></td>
				<td><%=hash.get("company") %></td>
				<td><%=hash.get("address") %></td>
				<td><%=hash.get("zipcode") %></td>
				<td><a href="../action/address.jsp?method=edit&id=<%=id%>&pageSize=<%=pageSize%>&pageNo=<%=pageNo %>">Modify</a>&nbsp;&nbsp;
				<a href="../action/address.jsp?method=delete&id=<%=id%>&pageSize=<%=pageSize%>&pageNo=<%=pageNo %>">Cancel</a></td>
			</tr>
		<%
			}
		%>	 
		</table>
		<form name="form1" action="action/address.jsp?method=list" method="post">
		<table border="0" width="100%" class="pager">
			<tr>
				<td align="left">Page Data Counts: <select name="pageSize"
				 onchange="document.all.pageNo.value='1';document.all.form1.submit();">
					 <option value="10"<%if(pageSize.equals("10")){ %>selected="selected"<%} %>>10</option>
					 <option value="25"<%if(pageSize.equals("25")){ %>selected="selected"<%} %>>25</option>
					 <option value="50"<%if(pageSize.equals("50")){ %>selected="selected"<%} %>>50</option>
								 
				 </select></td>
				 <td align="center">Total Records:<%=request.getAttribute("rowCount") %></td>
				 <td align="right">
		<a href="javascript:document.all.pageNo.value='<%=request.getAttribute("pageFirstNo") %>';document.all.form1.submit();">First</a>
		<a href="javascript:document.all.pageNo.value='<%=request.getAttribute("pagePreNo") %>';document.all.form1.submit();">Previous</a>
		<a href="javascript:document.all.pageNo.value='<%=request.getAttribute("pageNextNo") %>';document.all.form1.submit();">Next</a>
		<a href="javascript:document.all.pageNo.value='<%=request.getAttribute("pageLastNo") %>';document.all.form1.submit();">Last</a>
		<select name="pageNo" onchange="document.all.form1.submit();">
			<%
				int pageCount=(Integer)request.getAttribute("pageCount");
				
			%>
			<%
				for(int i=1;i<=pageCount;i++){
			%>
					
			<option value="<%=i%>"<%if(pageNo.equals(i+"")){%> selected="selected"<%} %>><%=i %></option>
			<%
				}
			%>
		</select></td>
		<td width="20"></td>
			
	</tr>
	</table>
	</form>
	</td>
	
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