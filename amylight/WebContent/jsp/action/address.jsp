<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="../inc/db.jsp"%>
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
		if(method.equals("list")){
			//search for db
			list(request,drv,url,usr,pwd,username,pageSize,pageNo);
			topage="../address.jsp";
		} else if(method.equals("delete")){
			//delete row
			delete(request,drv,url,usr,pwd,username);
			list(request,drv,url,usr,pwd,username,pageSize,pageNo);
			topage="../address.jsp";
		} else if(method.equals("add")){
			topage="../address_add.jsp";//go to new page
		} else if(method.equals("insert")){
			//execute insert
			insert(request,drv,url,usr,pwd,username);
			//search for data
			list(request,drv,url,usr,pwd,username,pageSize,pageNo);
			topage="../address.jsp";
		}
	}
%>
<jsp:forward page="<%=topage %>" />

<%!
	public boolean list(HttpServletRequest request, String drv, String url, String usr, String pwd, String username, String strPageSize, String strPageNo){
		try{
			//create new db connection
			Class.forName(drv).newInstance();
			Connection conn=DriverManager.getConnection(url,usr,pwd);
			Statement stm=conn.createStatement();
			
			//search for the total record
			int pageSize=Integer.parseInt(strPageSize);
			int pageNo=Integer.parseInt(strPageNo);
			int start=pageSize*(pageNo-1);
			//check total record
			String sql1="select count(*)as countall from address where username='"+username+"'";
			ResultSet rs1=stm.executeQuery(sql1);
			if(rs1.next()){
				//cal total row and save them
				String countall=rs1.getString("countall");
				int rowCount=Integer.parseInt(countall);
				request.setAttribute("rowCount", rowCount);
				
				//cal the total # of pages
				int pageCount=rowCount%pageSize==0?rowCount/pageSize:rowCount/pageSize+1;
				request.setAttribute("pageCount", pageCount);
				
				//cal page param and save
				int pageFirstNo=1;		//first page
				int pageLastNo=pageCount;	//last page
				int pagePreNo=pageNo>1?pageNo-1:1;		//front page
				int pageNextNo=pageNo<pageCount?pageNo+1:pageCount;		//next page
				
				request.setAttribute("pageFirstNo", pageFirstNo);
				request.setAttribute("pageLastNo", pageLastNo);
				request.setAttribute("pagePreNo", pagePreNo);
				request.setAttribute("pageNextNo", pageNextNo);
				
			}
			rs1.close();
			
			//retrieve data for current page
			String sql2="select * from address where username='"+username+"'order by name limit "+start+","+pageSize;
			List<Hashtable<String,String>>list=new ArrayList<Hashtable<String,String>>();
			ResultSet rs2=stm.executeQuery(sql2);
			ResultSetMetaData rsmd=rs2.getMetaData();
			int cols=rsmd.getColumnCount();
			while(rs2.next()){
				//search for each row
				Hashtable<String,String>hash=new Hashtable<String,String>();
				for(int i=1;i<=cols;i++){
					String field=(String)(rsmd.getColumnName(i));	//row name
					String value=(String)(rs2.getString(i));	//row value
					if(value==null)
						value="";
					hash.put(field,value);
				}
				//save current row
				list.add(hash);
			}
			//save all the row info and pass to next page
			request.setAttribute("list", list);
			rs2.close();
			stm.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			
		}
		return true;
	}	
	
%>

<%--delete a record --%>
<%!public boolean delete(HttpServletRequest request, String drv, String url, 
		String usr, String pwd, String username){
	try{
		//create db connection
		Class.forName(drv).newInstance();
		Connection conn = DriverManager.getConnection(url,usr,pwd);
		Statement stm = conn.createStatement();
		//according to ID and delete SQL, 
		String id = request.getParameter("id");
		String sql = "delete from address where id="+id;
		stm.executeUpdate(sql);
		stm.close();
		conn.close();
	} catch(Exception e){
		e.printStackTrace();
		return false;
	}finally {}
	return true;
}

%>

<%--insert a record --%>
<%!public boolean insert(HttpServletRequest request, String drv, String url,
		String usr, String pwd, String username){
	try {
		//create db connection
		Class.forName(drv).newInstance();
		Connection conn=DriverManager.getConnection(url,usr,pwd);
		Statement stm = conn.createStatement();
		
		//retrieve new data param
		String name = request.getParameter("name");
		String sex = request.getParameter("gender");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		String company = request.getParameter("company");
		String address = request.getParameter("address");
		String zipcode = request.getParameter("zipcode");
		
		// make SQL
		String sql = "insert into address(username, name, sex, mobile, email, company, address, zipcode)";
		sql+="value('"+ username + "','" + name + "','" + sex +"','" + mobile + "','" + email + "','"
				+company+"','" + address + "','" + zipcode +"')";
		
		//execute sql query
		stm.executeUpdate(sql);
		stm.close();
		conn.close();
	
	} catch(Exception e){
		e.printStackTrace();
		return false;
	
	} finally {
		
	}
	return true;
}%>

<%--This is edit() func --%>
<%!public boolean select(HttpServletRequest request, String drv, String url, 
		String usr, String pwd, String username) {
	try {
		//create db connection 
		Class.forName(drv).newInstance();
		Connection conn = DriverManager.getConnection(url, usr, pwd);
		Statement stm = conn.createStatement();
		
		//search current record based on ID
		String id=request.getParameter("id");
		String sql = "select * from address where id=" + id;
		ResultSet rs = stm.executeQuery(sql);
		if(rs.next()){
			//get data and save
			request.setAttribute("id",(String)(rs.getString("id")));
			request.setAttribute("username",(String)(rs.getString("username")));
			request.setAttribute("name",(String)(rs.getString("name")));
			request.setAttribute("gender",(String)(rs.getString("gender")));
			request.setAttribute("mobile",(String)(rs.getString("mobile")));
			request.setAttribute("email",(String)(rs.getString("email")));
			request.setAttribute("company",(String)(rs.getString("company")));
			request.setAttribute("address",(String)(rs.getString("address")));
			request.setAttribute("zipcode",(String)(rs.getString("zipcode")));
		}
		rs.close();
		stm.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
		return false;
	} finally {}
	return true;
	
}
%>












