package com.inquire.model;

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

import com.inquire.model.inquireVO;

public class inquireDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private DataSource ds = null;
	private String sql = null;
	
	public inquireDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle1");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<inquireVO> getInquireList(String user_id) {
		List<inquireVO> inquireList = new ArrayList<inquireVO>();
		
		try {
			sql = "select * from inquire_board where inquire_id=? order by inquire_no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				inquireVO list = new inquireVO();
				
				list.setInquire_no(rs.getInt("inquire_no"));
				list.setInquire_title(rs.getString("inquire_title"));
				list.setInquire_id(rs.getString("inquire_id"));
				list.setInquire_question(rs.getString("inquire_question"));
				list.setInquire_content(rs.getString("inquire_content"));
				list.setInquire_hit(rs.getInt("inquire_hit"));
				list.setInquire_regdate(rs.getString("inquire_date"));
				
				inquireList.add(list);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return inquireList;
	}
	
	public void inquireHit(int no) {
		try {
			sql = "update inquire_board set inquire_hit=inquire_hit+1 where inquire_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public inquireVO getCont(int no) {
		inquireVO list = new inquireVO();
		
		try {
			sql = "select * from inquire_board where inquire_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list.setInquire_no(rs.getInt("inquire_no"));
				list.setInquire_title(rs.getString("inquire_title"));
				list.setInquire_id(rs.getString("inquire_id"));
				list.setInquire_question(rs.getString("inquire_question"));
				list.setInquire_content(rs.getString("inquire_content"));
				list.setInquire_hit(rs.getInt("inquire_hit"));
				list.setInquire_regdate(rs.getString("inquire_date"));
			}
			// open 객체 닫기
			rs.close(); pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	public int inquireWrite(String inquire_title, String id, String inquire_question, String inquire_content) {
		int check = -1;
		try {
			sql = "insert into inquire_board values(inquire_seq.nextval, ?, ?, ?, ?, 0, sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inquire_title);
			pstmt.setString(2, id);
			pstmt.setString(3, inquire_question);
			pstmt.setString(4, inquire_content);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check = 1;
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return check;
	}
	
	
	
	
	
	
	
	
}
