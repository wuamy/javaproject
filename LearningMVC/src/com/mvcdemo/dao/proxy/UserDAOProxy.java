package com.mvcdemo.dao.proxy;
import com.mvcdemo.dao.IUserDAO;
import com.mvcdemo.dao.impl.UserDAOImpl;
import com.mvcdemo.DatabaseConnection.DatabaseConnection;
import com.mvcdemo.vo.User;

public class UserDAOProxy implements IUserDAO {
	private DatabaseConnection dbc = null;
	private IUserDAO dao = null;
	
	public UserDAOProxy(){
		try {
			this.dbc = new DatabaseConnection();
		} catch (Exception e){
			e.printStackTrace();
		}
		this.dao = new UserDAOImpl(this.dbc.getConnection());
	}
	public boolean findLogin(User user) throws Exception {
		boolean flag = false;
		try{
			flag = this.dao.findLogin(user);
		} catch (Exception e){
			throw e;
		}finally{
			this.dbc.close();
		}
		return flag;
	}


}
