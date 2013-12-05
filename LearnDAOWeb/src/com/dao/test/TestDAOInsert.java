package com.dao.test;
import com.dao.factory.DAOFactory;
import com.dao.vo.Emp;

public class TestDAOInsert {

	public static void main(String[] args) throws Exception{
		Emp emp = null;
		for (int x = 0; x<5;x++){
			emp = new Emp();
			emp.setEmpno(2000 + x);
			emp.setEname("james-" + x);
			emp.setJob("tester-" + x);
			emp.setHiredate(new java.util.Date());
			emp.setSal(210*x);
			DAOFactory.getIEmpDAOInstance().doCreate(emp);
			
			
		}

	}

}
