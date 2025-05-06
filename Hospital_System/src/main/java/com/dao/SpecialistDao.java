package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import com.entity.Specialist;

public class SpecialistDao {
	
	Connection conn;

	public SpecialistDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addSpecialist(String spec) {
		boolean f = false;
		
		try {
			String sql="insert into specialist(spec_name) values(?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, spec);
			int rs=ps.executeUpdate();
			if(rs==1) {
				f=true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return f;
	}

	public List<Specialist> getAllSpecialist(){
		List<Specialist> list = new ArrayList<>();
		Specialist s;
		
		try {
			String sql= "select * from specialist";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs= ps.executeQuery();
			
			while(rs.next()) {
				s= new Specialist();
				s.setId(rs.getInt("id"));
				s.setSpecialistName(rs.getString("spec_name"));
				list.add(s);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	
}
