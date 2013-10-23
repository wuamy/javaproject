package javabean;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

public class AddressBean {
	public boolean list(HttpServletRequest request, String username, String strPageSize,
			String strPageNo){
		
		// create DB Connection
		DBAccess db1 = new DBAccess();
		if(db1.createConn()){
			
			// check total record, cal page param
			int pageSize = Integer.parseInt(strPageSize);
			int pageNo = Integer.parseInt(strPageNo);
			int start = pageSize * (pageNo - 1);
			
			//checking total #
			String sql1 = "select count(*) as countall from address where username='"
					+ username + "'";
			db1.query(sql1);
			if(db1.next()){
				//cal total rows and save them
				String countall=db1.getValue("countall");
				int rowCount = Integer.parseInt(countall);
				request.setAttribute("rowCount", rowCount);
				
				//cal pages
				int pageCount = rowCount % pageSize == 0 ? rowCount/pageSize:rowCount/pageSize + 1;
				request.setAttribute("pageCount", pageCount);
				
				//page param and save them
				int pageFirstNo = 1; // first page
				int pageLastNo = pageCount; // last page
				int pagePreNo = pageNo > 1 ? pageNo -1 : 1; // preverious one
				int pageNextNo = pageNo < pageCount ? pageNo + 1: pageCount; // next one 
				request.setAttribute("pageFirstNo", pageFirstNo);
				request.setAttribute("pageLastNo", pageLastNo);
				request.setAttribute("pagePreNo", pagePreNo);
				request.setAttribute("pageNextNo", pageNextNo);
				
			}
			db1.closeRs();
			
			// retrieve data for current page from SQL
			String sql2 = "select * from address where username='" + username
					+ "' order by name limit " + start + "," + pageSize;
			List<Hashtable<String, String>> list = new ArrayList<Hashtable<String, String>>();
			db1.query(sql2);
			while(db1.next()){
				// search for data
				Hashtable<String, String> hash = new Hashtable<String, String>();
				hash.put("id", db1.getValue("id"));
				hash.put("username", db1.getValue("username"));
				hash.put("name", db1.getValue("name"));
				hash.put("sex", db1.getValue("sex"));
				hash.put("mobile", db1.getValue("mobile"));
				hash.put("email", db1.getValue("email"));
				hash.put("company", db1.getValue("company"));
				hash.put("address", db1.getValue("address"));
				hash.put("zipcode", db1.getValue("zipcode"));
				
				//save current row
				list.add(hash);
											
			}
			//save all the data and pass to next page
			request.setAttribute("list", list);
			db1.closeRs();
			db1.closeStm();
			db1.createConn();
			
		
		}
				return false;
	}
	
	public boolean delete(HttpServletRequest request, String username){
		// create database connection
		DBAccess db2 = new DBAccess();
		if(db2.createConn()){
			
			//regarding id and delete record
			String id = request.getParameter("id");
		}
		
	}

}
