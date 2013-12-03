package com.dao.factory;
import com.dao.dao1.IEmpDAO;
import com.dao.dao1.proxy.*;

public class DAOFactory {
	public static IEmpDAO getIEmpDAOInstance() throws Exception {
		return new IEmpDAOProxy();
	}

}
