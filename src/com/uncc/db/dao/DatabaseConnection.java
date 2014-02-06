package com.uncc.db.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public  class DatabaseConnection {

	private static Connection con;
	public Connection createConnection() {
			try {
				System.out.println("Establishing connection");
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver") ;
				con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;"
						+ "databaseName=UnccLibrary;integratedSecurity=true;");
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			return con;
	}

}
