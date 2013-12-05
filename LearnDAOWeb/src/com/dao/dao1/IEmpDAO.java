package com.dao.dao1;
import java.util.List;
import com.dao.vo.Emp;
public interface IEmpDAO {				//define data opt standard
	/**
	 * add data into DB
	 */
	public boolean doCreate(Emp emp)throws Exception;
	
	/**
	 * search for data and user find
	 */
	public List<Emp>findAll(String keyWord)throws Exception;
	
	/**
	 * search by employee ID
	 *
	 */
	public Emp findById(int empno) throws Exception;
	

}

