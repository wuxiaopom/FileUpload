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
		Connection connection = getConnection(); // 获取数据库连接
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from("
				+ "select t.*,ROWNUM RN from (select * from emp) t "
				+ "where ROWNUM <= " + end + ")where RN >= " + start;
		List<Emp> empList = new ArrayList<Emp>(); // 专题列表
		try {
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery(); // 执行此sql语句
			while (rs.next()) { // 遍历数据，存入profileList中
				Emp emp = new Emp();
				emp.setEmpNo(rs.getInt("empno"));
				emp.seteName(rs.getString("ename"));
				empList.add(emp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(connection, pstmt, rs); // 关闭此连接
		}
		return empList;
	}

	/**
	 * 获得总条数
	 * 
	 * @return
	 */
	public int totalCount() {
		Connection connection = getConnection(); // 获取数据库连接
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) as total from emp";
		int count = 0;
		try {
			pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery(); // 执行此sql语句
			while (rs.next()) { // 遍历数据，存入profileList中
				count = rs.getInt("total");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(connection, pstmt, rs); // 关闭此连接
		}
		return count;
	}
}
