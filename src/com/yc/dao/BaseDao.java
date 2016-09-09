package com.yc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * ���ݿ�������رչ����ࡣ
 * 
 */
public class BaseDao {
	private static String driver = "oracle.jdbc.driver.OracleDriver";// ���ݿ������ַ���
	private static String url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";// ����URL
	private static String user = "scott"; // ���ݿ��û���
	private static String password = "tiger"; // �û�����

	/**
	 * ��ȡ���ݿ����Ӷ���
	 */
	public static Connection getConnection() {
		Connection conn = null;// �������Ӷ���
		// ��ȡ���Ӳ������쳣
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();// �쳣����
		}
		return conn;// �������Ӷ���
	}

	/**
	 * �ر����ݿ����ӡ�
	 * 
	 * @param conn ���ݿ�����
	 * @param stmt Statement ����
	 * @param rs �����
	 */
	public static void closeAll(Connection conn, Statement stmt, ResultSet rs) {
		// �����������Ϊ��,��ر�
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// ��Statement ����Ϊ��,��ر�
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// �����ݿ����Ӷ���Ϊ��,��ر�
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}