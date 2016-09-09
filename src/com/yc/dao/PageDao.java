package com.yc.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yc.bean.Emp;


public class PageDao extends BaseDao {

	public List<Emp> list(int start, int end) {
		Connection connection = getConnection(); // ��ȡ���ݿ�����
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from("
				+ "select t.*,ROWNUM RN from (select * from emp) t "
				+ "where ROWNUM <= " + end + ")where RN >= " + start;
		List<Emp> empList = new ArrayList<Emp>(); // ר���б�
		try {
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery(); // ִ�д�sql���
			while (rs.next()) { // �������ݣ�����profileList��
				Emp emp = new Emp();
				emp.setEmpNo(rs.getInt("empno"));
				emp.seteName(rs.getString("ename"));
				empList.add(emp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(connection, pstmt, rs); // �رմ�����
		}
		return empList;
	}

	/**
	 * ���������
	 * 
	 * @return
	 */
	public int totalCount() {
		Connection connection = getConnection(); // ��ȡ���ݿ�����
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as total from emp";
		int count = 0;
		try {
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery(); // ִ�д�sql���
			while (rs.next()) { // �������ݣ�����profileList��
				count = rs.getInt("total");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(connection, pstmt, rs); // �رմ�����
		}
		return count;
	}
}
