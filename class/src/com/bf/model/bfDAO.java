package com.bf.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class bfDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public bfDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds =(DataSource)init.lookup("java:comp/env/jdbc/myoracle1");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int getFacilCount() {
		int count = 0;
		try {
			sql = "select count(*) from facil";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
	
	public void delFacil(int facil_no) {
		sql = "";
	}
	
	public List<bfVO> getFacil(int facil_no) {
		List<bfVO> list = new ArrayList<bfVO>();
		try {
			sql = "select * from facil where facil_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, facil_no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bfVO vo = new bfVO();
				vo.setFacil_no(rs.getString("facil_no"));
				vo.setFacil_state(rs.getInt("facil_state"));
				vo.setFacil_date(rs.getString("facil_date"));
				vo.setFacil_hour(rs.getDouble("facil_hour"));
				vo.setFacil_time(rs.getDouble("facil_time"));
				
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<bfVO> getFacilA(int facil_no, int seldate) {
		List<bfVO> list = new ArrayList<bfVO>();
		try {
			sql = "select * from facil where facil_no=? and facil_state=1 and facil_date=to_date(?,'dd')";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, facil_no);
			pstmt.setInt(2, seldate);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bfVO vo = new bfVO();
				vo.setFacil_no(rs.getString("facil_no"));
				vo.setFacil_state(rs.getInt("facil_state"));
				vo.setFacil_date(rs.getString("facil_date"));
				vo.setFacil_hour(rs.getDouble("facil_hour"));
				vo.setFacil_time(rs.getDouble("facil_time"));
				vo.setUser_id(rs.getString("user_id"));
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertFacilTime(double f_hour, double times, int f_number, int f_dayup, String user_id) {
		int returns = 0;	
		try {
				sql = "insert into facil(facil_id, facil_no, facil_state, facil_date, facil_hour, facil_time, user_id)"
						+ "values(facil_id_seq.nextval, ?, 1, to_date(sysdate, 'YY-MM-DD')+?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, f_number);
				pstmt.setInt(2, f_dayup);
				pstmt.setDouble(3, f_hour);
				pstmt.setDouble(4, times);
				pstmt.setString(5, user_id);
				returns = pstmt.executeUpdate();
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return returns;
	}
	
	public int getBwListCount() {
		int count = 0;
		try {
			sql = "select count(*) from book_reserve";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
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
		
	public List<bfVO> getBw(int page, int allPage, int rowsize, int totalRecord) {
		List<bfVO> list = new ArrayList<bfVO>();
		
		int endRow = totalRecord+((page-allPage)*15);
		int startRow = endRow-15;
		
		try {
			sql	= "select * from "
				+ "(select rownum as rnum, book_reserve.* from book_reserve)"
				+ " where rnum>=? and rnum<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bfVO vo = new bfVO();
				vo.setBr_no(rs.getInt("br_no"));
				vo.setBr_title(rs.getString("br_title"));
				vo.setBr_name(rs.getString("br_name"));
				vo.setBr_content(rs.getString("br_content"));
				vo.setBr_pwd(rs.getString("br_pwd"));
				vo.setBr_hit(rs.getInt("br_hit"));
				vo.setBr_date(rs.getString("br_date"));
				vo.setBr_writer(rs.getString("br_writer"));
				
				list.add(vo);
			}
				rs.close();
				pstmt.close();
				con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public void bookHit(int no) {
		try {
			sql = "update book_reserve set br_hit=br_hit+1 where br_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public bfVO getCont(int no) {
		bfVO vo = new bfVO();
		
		try {
			sql = "select * from book_reserve where br_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setBr_no(rs.getInt("br_no"));
				vo.setBr_writer(rs.getString("br_writer"));
				vo.setBr_title(rs.getString("br_title"));
				vo.setBr_name(rs.getString("br_name"));
				vo.setBr_content(rs.getString("br_content"));
				vo.setBr_date(rs.getString("br_date"));
				vo.setBr_hit(rs.getInt("br_hit"));
				vo.setBr_pwd(rs.getString("br_pwd"));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo; 
	}

	public int insertBw(String bw_title, String bw_name, String bw_cont, String id, String bw_pass) {
		int check = -1;
		try {
			sql = "insert into book_reserve values(book_reserve_seq.nextval,"
					+ "?, ?, ?, ?, 0, sysdate, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bw_title);
			pstmt.setString(2, bw_name);
			pstmt.setString(3, bw_cont);
			pstmt.setString(4, bw_pass);
			pstmt.setString(5, id);
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
