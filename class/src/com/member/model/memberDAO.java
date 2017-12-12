package com.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public memberDAO() { // 생성자
		// 커넥션 풀 방식으로 DB 연결하는 객체
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/myoracle1");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int userCheck(String id, String pass) {
		int result = 0;		
		try {
			sql = "select * from lib_user where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pass.equals(rs.getString("password"))) {
					result = 1; // id/pwd 모두 일치
				} else {
					result = 0; // pwd가 틀리면
				}
			}
			// open 객체 닫기.
			rs.close(); pstmt.close();
			// con은 이거가지고 또 써야 할 일이 있으므로 냅둠.
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public memberVO getMember(String id) {
		memberVO vo = null;
		
		try {
			sql = "select * from lib_user where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				vo = new memberVO();
				vo.setName(rs.getString("name"));
				vo.setId(rs.getString("id"));
				vo.setPassword(rs.getString("password"));
				vo.setEmail(rs.getString("email"));
				vo.setBirth1(rs.getString("birth1"));
				vo.setBirth2(rs.getString("birth2"));
				vo.setBirth3(rs.getString("birth3"));
				vo.setZip1(rs.getString("zip1"));
				vo.setZip2(rs.getString("zip2"));
				vo.setAddr1(rs.getString("addr1"));
				vo.setAddr2(rs.getString("addr2"));
				vo.setId_state(rs.getInt("id_state"));
			}
			// open 객체 닫기.
			rs.close(); pstmt.close(); con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}




























}
