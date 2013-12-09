<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Upload Demo </title>
</head>
<body>
<%
	DiskFileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setFileSizeMax(3145728);
	List<FileItem> items = upload.parseRequest(request);
	Iterator<FileItem> iter = items.iterator();
	while(iter.hasNext()){
		FileItem item = iter.next();
		String fieldName = item.getFieldName();
%>

	<ul><h4>form control name: <%=fieldName %> --> <%=item.isFormField()%></h4>
<%
	if(!item.isFormField()){
		String fileName = item.getName();
		String contentType = item.getContentType();
		long sizeInBytes = item.getSize();
%>
	<li>Upload File Name:<%=fileName%></li>
	<li>Upload File Type:<%=contentType%></li>
	<li>Upload File Size:<%=sizeInBytes%> </li>
<%	
	}else{
		String value = item.getString();
%>
	<li>Regular Param: <%=value%></li>
<%
	}
%>
	</ul>
<%
	}

%>

</body>
</html>