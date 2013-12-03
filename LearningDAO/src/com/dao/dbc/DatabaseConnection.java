package com.dao.dbc;
import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	private static final String DBDRIVER1 = "com.mysql.jdbc.Driver";
	private static final String DBURL1 = "jdbc:mysql://localhost:3306/mldn";
	private static final String DBUSER1 = "root";
	private static final String DBPASSWORD1 = "mysqladmin";
	private Connection conn = null;
	public DatabaseConnection()throws Exception {
		try{
			Class.forName(DBDRIVER1);		// add driver
			this.conn = DriverManager
					.getConnection(DBURL1, DBUSER1, DBPASSWORD1);
					
		} catch (Exception e){
			throw e;
		}
	}
	public Connection getConnection(){
		return this.conn;
				
	}
	public void close()throws Exception{
		if(this.conn!=null){
			try{
				this.conn.close();
			} catch(Exception e){
				throw e;
			}
			
		}
	}

}
