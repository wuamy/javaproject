package com.mvcdemo.dao.copy;
import com.mvcdemo.vo.*;;

public interface IUserDAO {
	/**
	 * user login validation
	 * @param user get vo object
	 * @return: validation result 
	 * @throws Exception
	 */
	public boolean findLogin(User user) throws Exception;

}
