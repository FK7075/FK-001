package com.fk.javaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCDao {
	public static String url="jdbc:mysql://localhost:3306/onlinebook";
	public static String user="root";
	public static String password="1234";
	public static String driverName="com.mysql.jdbc.Driver";
	static Connection conn=null;
	static {
		try {
			Class.forName(driverName);
			System.out.println("�ҵ�����");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("�Ҳ�������");
		}
	}
	/**
	 * ��ȡ�����ݿ������
	 * @return
	 * @throws SQLException
	 */
	public static Connection getConn() {
		try {
			conn=DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("����ʧ��");
		}
		return conn;
	}
	/**
	 * �ر����ݿ���Դ
	 * @param rs
	 * @param pst
	 * @param conn
	 */
	public static void shutDown(ResultSet rs,PreparedStatement pst,Connection conn) {
		if(rs!=null)
			try {
				rs.close();
				if(pst!=null)
					pst.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

}
