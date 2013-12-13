package com.mvcdemo.factory;
import com.mvcdemo.dao.IUserDAO;
import com.mvcdemo.dao.proxy.UserDAOProxy;
public class DAOFactory {
	public static IUserDAO getIUserDAOInstance(){
		return new UserDAOProxy();
	}
}
