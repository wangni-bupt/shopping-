package com.py.tool;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	private static final String DBDRIVER = "com.mysql.jdbc.Driver";//������
	private static final String DBURL = "jdbc:mysql://localhost:3306/bookstore";
	private static final String DBUSER = "root";
	private static final String DBPASSWORD = "root";
	private Connection conn;

	public DatabaseConnection() throws Exception {// �ڹ��췽���н������ݿ�����
		try {
			Class.forName(DBDRIVER); // �������ݿ�����
			this.conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);// �������ݿ�
		} catch (Exception e) {
			throw e;
		}
	}
	public Connection getConnection() {//ȡ�����ݿ�����
		return this.conn;
	}
	public void close() throws Exception {//���ݿ�رղ���
		if (this.conn != null) {		//�����ָ��
			try {					
				this.conn.close();		//���ݿ�ر�
			} catch (Exception e) {
				throw e;
			}
		}
	}
}
