package com.faq.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class faqDAO {
	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private DataSource ds = null;
	private String sql = null;
	
	public faqDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle1");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getMemListCount() {
		
		int count = 0;
				
		try {
			sql = "select count(*) from mem_faq";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	public List<faqVO> getMemberFaqList(int page, int rowsize) {
		List<faqVO> faqList = new ArrayList<faqVO>();
		int startRow = (page-1)*rowsize + 1;
		int endRow = page*rowsize;
		
		try {
			sql = "select * from "
					+ "(select rownum as rnum, mem_faq.* from mem_faq)"
					+ " where rnum>=? and rnum<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				faqVO list = new faqVO();
				
				list.setNumbers(rs.getInt("numbers"));
				list.setQuestion(rs.getString("question"));
				list.setAnswer(rs.getString("answer"));
	
				faqList.add(list);
			}
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return faqList;
	}
	public int getUseListCount() {
		
		int count = 0;
				
		try {
			sql = "select count(*) from use_faq";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
			
	public List<faqVO> getUseFaqList(int page, int rowsize) {
		List<faqVO> faqList = new ArrayList<faqVO>();
		int startRow = (page-1)*rowsize + 1;
		int endRow = page*rowsize;
		
		try {
			sql = "select * from "
					+ "(select rownum as rnum, use_faq.* from use_faq)"
					+ " where rnum>=? and rnum<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				faqVO list = new faqVO();
				list.setNumbers(rs.getInt("numbers"));
				list.setQuestion(rs.getString("question"));
				list.setAnswer(rs.getString("answer"));
				
				faqList.add(list);
			}
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return faqList;
	}
	public int getBookListCount() {
		
		int count = 0;
				
		try {
			sql = "select count(*) from Book_faq";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public List<faqVO> getBookFaqList(int page, int rowsize) {
		List<faqVO> faqList = new ArrayList<faqVO>();
		int startRow = (page-1)*rowsize + 1;
		int endRow = page*rowsize;
		
		try {
			sql = "select * from "
					+ "(select rownum as rnum, book_faq.* from book_faq)"
					+ " where rnum>=? and rnum<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				faqVO list = new faqVO();
				list.setNumbers(rs.getInt("numbers"));
				list.setQuestion(rs.getString("question"));
				list.setAnswer(rs.getString("answer"));
				
				faqList.add(list);
			}
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return faqList;
	}
	public int getAnoListCount() {
		
		int count = 0;
				
		try {
			sql = "select count(*) from another_faq";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public List<faqVO> getAnoFaqList(int page, int rowsize) {
		List<faqVO> faqList = new ArrayList<faqVO>();
		int startRow = (page-1)*rowsize + 1;
		int endRow = page*rowsize;
		
		try {
			sql = "select * from "
					+ "(select rownum as rnum, another_faq.* from another_faq)"
					+ " where rnum>=? and rnum<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				faqVO list = new faqVO();
				list.setNumbers(rs.getInt("numbers"));
				list.setQuestion(rs.getString("question"));
				list.setAnswer(rs.getString("answer"));
				
				faqList.add(list);
			}
			rs.close(); pstmt.close(); con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return faqList;
	}

	
	
}
