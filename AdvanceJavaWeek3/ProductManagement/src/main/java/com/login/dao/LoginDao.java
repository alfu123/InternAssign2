package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
	String sql = "select * from neon.login where uname=? and pass=?";

	public boolean check(String uname, String pass) {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/neon", "root", "root");

			PreparedStatement p = con.prepareStatement(sql);
			p.setString(1, uname);
			p.setString(2, pass);
			ResultSet s = p.executeQuery();
			if (s.next()) {
				return true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

}
