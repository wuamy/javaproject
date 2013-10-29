<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javabean.AddressBean" %>
<%@ page import="java.util.*"%>
<%
	String method=request.getParameter("method");
	String topage="../address.jsp";
	//if the user is not login, direct to login
	if(session.getAttribute("username")==null){
		topage="../login.jsp";
	}else{
		String username=(String)session.getAttribute("username");
		
		//obtain page #
		String pageSize=request.getParameter("pageSize");
		String pageNo=request.getParameter("pageNo");
		if(pageSize==null){
			pageSize="25";
		}
		if(pageNo==null){
			pageNo="1";
		}
		//save the parameter
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNo", pageNo);
		
		//method option
		AddressBean addressBean = new AddressBean();
		if(method.equals("list")){
			//search for data
			addressBean.list(request, username, pageSize, pageNo);
			topage = "../address.jsp";
		
		} else if(method.equals("delete")){
			//exe delete
			addressBean.delete(request, username);
			//search for the result
			addressBean.list(request, username, pageSize, pageNo);
			topage = "../address.jsp";
		} else if(method.equals("add")){
			topage="../address_add.jsp";
		} else if(method.equals("insert")){
			addressBean.insert(request,username);
			// search for the result
			addressBean.list(request, username, pageSize, pageNo);
			topage = "../address.jsp";
		} else if(method.equals("edit")){
			//exe searching
			addressBean.select(request, username);
			topage = "../address_edit.jsp";
		} else if(method.equals("update")){
			//update data
			addressBean.update(request, username);
			// search data
			addressBean.list(request, username, pageSize, pageNo);
			topage = "../address.jsp";
		}
	}
%>
<jsp:forward page="<%=topage %>" />











