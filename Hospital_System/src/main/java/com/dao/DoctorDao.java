package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.entity.Doctor;

public class DoctorDao {

	private Connection conn;

	public DoctorDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean registerDoctor(Doctor d) {
		boolean f = false;

		try {
			String sql = "update doctor set full_name=?, dob=?, qualification=?, specialist=?, email=?, mobno=?, password =? WHERE id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			ps.setString(7, d.getPassword());
			ps.setInt(8, d.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {

		}

		return f;
	}

	public List<Doctor> getAllDoctors() {
		List<Doctor> list = new ArrayList<>();
		Doctor d;

		try {
			String sql = "select * from doctor";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt("id"));
				d.setFullName(rs.getString("full_name"));
				d.setDob(rs.getString("dob"));
				d.setQualification(rs.getString("qualification"));
				d.setSpecialist(rs.getString("specialist"));
				d.setEmail(rs.getString("email"));
				d.setMobNo(rs.getString("mobno"));
				d.setPassword(rs.getString("password"));

				list.add(d);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public Doctor getDoctorById(int id) {

		Doctor d = null;

		try {
			String sql = "select * from doctor where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt("id"));
				d.setFullName(rs.getString("full_name"));
				d.setDob(rs.getString("dob"));
				d.setQualification(rs.getString("qualification"));
				d.setSpecialist(rs.getString("specialist"));
				d.setEmail(rs.getString("email"));
				d.setMobNo(rs.getString("mobno"));
				d.setPassword(rs.getString("password"));

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return d;
	}

	public boolean updateDoctor(Doctor d) {
		boolean f = false;

		try {
			String sql = "UPDATE doctor SET full_name=?, dob=?, qualification=?, specialist=?, email=?, mobno=?, password=? WHERE id=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			ps.setString(7, d.getPassword());

			ps.setInt(8, d.getId());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {

		}

		return f;
	}
	
	public boolean deleteDoctor(int id) throws SQLException {
		boolean f = false;
		String sql="DELETE from doctor where id=?";
		
		PreparedStatement ps= conn.prepareStatement(sql);
		ps.setInt(1, id);
		int i = ps.executeUpdate();
		if(i==1) {
			f=true;
		}
		return f;
	}
	
	public Doctor docLogin(String email,String password) {
		Doctor d=null;
		try {
			String sql= "Select * from doctor where email=? and password=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				d = new Doctor();
				d.setId(rs.getInt("id"));
				d.setFullName(rs.getString("full_name"));
				d.setDob(rs.getString("dob"));
				d.setQualification(rs.getString("qualification"));
				d.setSpecialist(rs.getString("specialist"));
				d.setEmail(rs.getString("email"));
				d.setMobNo(rs.getString("mobno"));
				d.setPassword(rs.getString("password"));
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return d;
	}
	public int countDoctor() {
		int i=0;
		
		try {
			String sql="select * from Doctor";
			PreparedStatement ps= conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return i;
	}
	
	public int countAppointment() {
		int i=0;
		
		try {
			String sql="select * from appointment";
			PreparedStatement ps= conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return i;
	}
	
	public int countUsers() {
		int i=0;
		
		try {
			String sql="select * from user_dtls";
			PreparedStatement ps= conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return i;
	}
	
	public int countSpecialist() {
		int i=0;
		
		try {
			String sql="select * from specialist";
			PreparedStatement ps= conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return i;
	}
	
	public int countAppointmentByDoctorId(int did) {
		int i=0;
		
		try {
			String sql="select * from appointment where doctor_id=?";
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, did);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				i++;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return i;
	}
	
	public boolean checkOldPassword(int doctorId, String oldPassword) {
	    boolean isValid = false;

	    try {
	        String sql = "SELECT * FROM doctor WHERE id = ? AND password = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, doctorId);
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

	public boolean changePassword(int doctorId, String newPassword) {
	    boolean isUpdated = false;

	    try {
	        String sql = "UPDATE doctor SET password = ? WHERE id = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, newPassword);
	        ps.setInt(2, doctorId);

	        int rowsAffected = ps.executeUpdate();
	        if (rowsAffected == 1) {
	            isUpdated = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // Always log the exception
	    }

	    return isUpdated;
	}
	
	public boolean editDoctorProfile(Doctor d) {
		boolean f = false;

		try {
			String sql = "UPDATE doctor SET full_name=?, dob=?, qualification=?, specialist=?, email=?, mobno=?  WHERE id=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, d.getFullName());
			ps.setString(2, d.getDob());
			ps.setString(3, d.getQualification());
			ps.setString(4, d.getSpecialist());
			ps.setString(5, d.getEmail());
			ps.setString(6, d.getMobNo());
			ps.setInt(7, d.getId());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {

		}

		return f;
	}
	
	
}
