package com.dao.test;
import java.util.Iterator;
import java.util.List;
import com.dao.factory.DAOFactory;
import com.dao.vo.Emp;

public class TestDAOSelect {

	public static void main(String[] args) throws Exception{
		List<Emp> all = DAOFactory.getIEmpDAOInstance().findAll("");
		Iterator<Emp> iter = all.iterator();
		while(iter.hasNext()){
			Emp emp = iter.next();
			System.out.println(emp.getEmpno()+", " + emp.getEname() + "==>"
					+ emp.getEname());
		}
		

	}

}
