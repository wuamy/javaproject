package javabean;
import java.sql.*;

public class DBAccess {
	//get drive
	public static String drv="com.mysql.jdbc.Driver";
	//connect URL
	public static String url="jdbc:mysql://localhost:3306/demo";
	//user
	public static String usr="root";
	// password
	public static String pwd="mysqladmin";
	// database connection
	private Connection conn = null;
	//database statement
	private Statement stm = null;
	//database result
	private ResultSet rs = null;
	
	public String getDrv() {
		return drv;
	}
	public void setDrv(String drv) {
		this.drv = drv;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUsr() {
		return usr;
	}
	public void setUsr(String usr) {
		this.usr = usr;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Connection getConn() {
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}
	public Statement getStm() {
		return stm;
	}
	public void setStm(Statement stm) {
		this.stm = stm;
	}
	public ResultSet getRs() {
		return rs;
	}
	public void setRs(ResultSet rs) {
		this.rs = rs;
	}
	
	// create database connection
	public boolean createConn(){
		boolean b = false;
		try {
			Class.forName(drv).newInstance();
			conn = DriverManager.getConnection(url,usr,pwd);
			b = true;
		} catch (SQLException e){
			
		} catch (ClassNotFoundException e){
			
		} catch (InstantiationException e){
			
		} catch (IllegalAccessException e){
			
		}
		return b;
	}
	
	// update database
	public boolean update(String sql){
		boolean b = false;
		try {
			stm = conn.createStatement();
			stm.execute(sql);
			b = true;
		} catch (Exception e){
			
		}
		return b;
	}
	
	// searching in databases
	public void query(String sql){
		try {
			stm = conn.createStatement();
			rs = stm.executeQuery(sql);
		} catch (Exception e){
			
		}
		
	}
	
	// search for the result
	public boolean next() {
		boolean b = false;
		try {
			if(rs.next())b=true;
		} catch (Exception e){
			
		}
		return b;
	}
	
	// get value
	public String getValue(String field){
		String value=null;
		try {
			if(rs!=null)value=rs.getString(field);
			
		} catch (Exception e){
			
		}
		return value;
	}
	
	// close rs
	public void closeRs(){
		try {
			if(rs != null){
				rs.close();
			}
		} catch (SQLException e){
			
		}
	}
	
	// close stm
	public void closeStm(){
		try {
			if(stm != null)stm.close();
		} catch (SQLException e){
			
		}
	}
	
	// close database connection
	public void closeConn(){
		try {
			if(conn != null)conn.close();
		} catch (SQLException e){
			
		}
	}
	

}

	
	
