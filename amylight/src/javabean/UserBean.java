package javabean;

public class UserBean {
	
	// login validation
	public boolean valid(String username, String password){
		boolean isValid=false;
		DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql = "select * from user where username='"+username+"'and password='"+password+"'";
			db.query(sql);
			if(db.next()){
				isValid=true;
			}
			db.closeRs();
			db.closeStm();
			db.closeConn();
		}
		return isValid;
	}
	
	// user validation
	public boolean isExist(String username){
		boolean isExist = false;
		DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql = "select * from user where username='"+username+"'";
			db.query(sql);
			if(db.next()){
				isExist = true;
			}
			db.closeRs();
			db.closeStm();
			db.closeConn();
		}
		return isExist;
		
	}
	
	public void add(String username, String password, String email){
		DBAccess db = new DBAccess();
		if(db.createConn()){
			String sql="insert into user(username, password, email)value('"+username+')"
		}
	}

}
