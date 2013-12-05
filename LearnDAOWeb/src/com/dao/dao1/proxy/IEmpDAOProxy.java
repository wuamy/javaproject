package com.dao.dao1.proxy;
import java.util.List;
import com.dao.dao1.impl.EmpDAOImpl;
import com.dao.dbc.DatabaseConnection;
import com.dao.dao1.IEmpDAO;
import com.dao.vo.Emp;

public class IEmpDAOProxy implements IEmpDAO{
	private DatabaseConnection dbc = null;
	private IEmpDAO dao = null;
	public IEmpDAOProxy() throws Exception {
		this.dbc = new DatabaseConnection();
		this.dao = new EmpDAOImpl(this.dbc.getConnection());
	}
	
	public boolean doCreate(Emp emp) throws Exception {
		boolean flag = false;
		try {
			if(this.dao.findById(emp.getEmpno())==null){
				flag = this.dao.doCreate(emp);
			}
		} catch(Exception e){
			throw e;
		} finally {
			this.dbc.close();
		}
		return flag;
	}
	
	public List<Emp> findAll(String keyWord)throws Exception {
		List<Emp> all = null;
		try {
			all = this.dao.findAll(keyWord);
		} catch (Exception e){
			throw e;
			
		} finally {
			this.dbc.close();
		}
		return all;
	}
	
	public Emp findById(int empno) throws Exception {
		Emp emp = null;
		try {
			emp = this.dao.findById(empno);
		} catch (Exception e){
			throw e;
		} finally {
			this.dbc.close();
		}
		return emp;
	}
}
