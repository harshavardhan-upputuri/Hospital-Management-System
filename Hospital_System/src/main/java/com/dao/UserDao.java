package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDao {

	Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean UserRegister(User u) {
		boolean f = false;

		try {
			String sql = "insert into user_dtls(full_name,email,password) values(?,?,?);";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, u.getFullName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public User login(String email, String password) {

		User u = null;

		try {
			String sql = "select * from user_dtls where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				u = new User();
				u.setId(rs.getInt("id")); // assuming column name is 'id'
				u.setFullName(rs.getString("full_name"));
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		return u;

	}
	
	public boolean checkOldPassword(int userId, String oldPassword) {
	    boolean isValid = false;

	    try {
	        String sql = "SELECT * FROM user_dtls WHERE id = ? AND password = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, userId);
	        ps.setString(2, oldPassword);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            isValid = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // Always log the exception
	    }

	    return isValid;
	}

	public boolean changePassword(int userId, String newPassword) {
	    boolean isUpdated = false;

	    try {
	        String sql = "UPDATE user_dtls SET password = ? WHERE id = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, newPassword);
	        ps.setInt(2, userId);

	        int rowsAffected = ps.executeUpdate();
	        if (rowsAffected == 1) {
	            isUpdated = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // Always log the exception
	    }

	    return isUpdated;
	}


}
