<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,java.io.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="com.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Java File Uploading</title>
</head>
<body>
<%
	DiskFileItemFactory factory = new DiskFileItemFactory();
	factory.setRepository(new File(this.getServletContext().getRealPath("/")+"uploadtemp"));
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setFileSizeMax(3145728);
	List<FileItem> items = upload.parseRequest(request);
	Iterator<FileItem> iter = items.iterator();
	IPTimeStamp its = new IPTimeStamp(request.getRemoteAddr());
	while(iter.hasNext()) {
		FileItem item = iter.next();
		String fieldName = item.getFieldName();
		if(!item.isFormField()){
			File saveFile = null;
			InputStream input = null;
			OutputStream output = null;
			input = item.getInputStream();
			output = new FileOutputStream (new 
					File(this.getServletContext().getRealPath("/")
							+"upload"+File.separator+its.getIPTimeRand()
							+"."+item.getName().split("\\.")[1]));
			byte data[] = new byte[512];
			int temp = 0;
			while ((temp = input.read(data,0,512))!=-1){
				output.write(data);
			}
			input.close();
			output.close();
		}else{
			String value=item.getString();
%>
	Regular Param: <%=value%>
<%
		}
	}
	
%>

</body>
</html>