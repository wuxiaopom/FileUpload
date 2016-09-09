package com.yc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * 数据库连接与关闭工具类。
 * 
 */
public class BaseDao {
	private static String driver = "oracle.jdbc.driver.OracleDriver";// 数据库驱动字符串
	private static String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";// 连接URL
	private static String user = "scott"; // 数据库用户名
	private static String password = "tiger"; // 用户密码

	/**
	 * 获取数据库连接对象。
	 */
	public static Connection getConnection() {
		Connection conn = null;// 数据连接对象
		// 获取连接并捕获异常
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();// 异常处理
		}
		return conn;// 返回连接对象
	}

	/**
	 * 关闭数据库连接。
	 * 
	 * @param conn 数据库连接
	 * @param stmt Statement 对象
	 * @param rs 结果集
	 */
	public static void closeAll(Connection conn, Statement stmt, ResultSet rs) {
		// 若结果集对象不为空,则关闭
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 若Statement 对象不为空,则关闭
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 若数据库连接对象不为空,则关闭
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}