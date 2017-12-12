package com.join.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class joinDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public joinDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/myoracle1");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	public int checkMemberId(String id) {
		int result = -1;
		
		try {
			sql = "select id from lib_user where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			}
			rs.close(); pstmt.close(); con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	
	public List searchZipcode(String askDong) {
		List zipcodeList = new ArrayList();
		try {
			sql = "select * from zipcode where dong like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+askDong+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) { // 검색된 동이 있으면 검색된 DB의 레코드를 필드 단위로 가져옴.
				String zipcode = rs.getString("zipcode");
				String sido = rs.getString("sido");
				String gugun = rs.getString("gugun");
				String dong = rs.getString("dong");
				String bunji = rs.getString("bunji");
				String addr1 = sido+gugun+dong;
				String addr2 = sido+gugun+dong+bunji;
				
				zipcodeList.add(zipcode + ", " + addr1 + ", " + addr2);
			}
			rs.close(); pstmt.close(); con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return zipcodeList;
	}
		
	public void insertMember(memberVO vo) {
		try {
			sql = "insert into lib_user(name, id, password, email,"
					+ " birth1, birth2, birth3, zip1, zip2, addr1,"
					+ " addr2, password_question, password_answer,"
					+ " id_state) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getPassword());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getBirth1());
			pstmt.setString(6, vo.getBirth2());
			pstmt.setString(7, vo.getBirth3());
			pstmt.setString(8, vo.getZip1());
			pstmt.setString(9, vo.getZip2());
			pstmt.setString(10, vo.getAddr1());
			pstmt.setString(11, vo.getAddr2());
			pstmt.setString(12, vo.getPassword_question());
			pstmt.setString(13, vo.getPassword_answer());
			pstmt.executeUpdate();
			con.close(); pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
