package com.gongji.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class gongjiDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public gongjiDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/myoracle1");
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	public int getListCount() {
		int count = 0;
		try {
			sql = "select count(*) from gongji";
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
	
	public List<gongjiVO> getList(int page, int allPage, int rowsize, int totalRecord)
	{
		List<gongjiVO> list = new ArrayList<gongjiVO>();
		
		int endRow = totalRecord+((page-allPage)*15);
		int startRow = endRow-15;
		
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		try {
		sql = "select * from "
				+ "(select rownum as rnum, gongji.* from gongji)"
				+ " where rnum>=? and rnum<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				gongjiVO vo = new gongjiVO();
				
				vo.setGongji_no(rs.getInt("gongji_no"));
				vo.setGongji_writer(rs.getString("gongji_writer"));
				vo.setGongji_title(rs.getString("gongji_title"));
				vo.setGongji_content(rs.getString("gongji_content"));
				Date date = form.parse(rs.getString("gongji_date"));				
				vo.setGongji_date(form.format(date));
				vo.setGongji_hit(rs.getInt("gongji_hit"));
			
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<gongjiVO> getMainList(int page, int rowsize)
	{
		List<gongjiVO> list = new ArrayList<gongjiVO>();
		
		int startRow = (page-1)*15+1;
		int endRow = page*rowsize;
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		try {
		sql = "select * from "
				+ "(select rownum as rnum, gongji.* from gongji)"
				+ " where rnum>=? and rnum<=? order by rnum desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				gongjiVO vo = new gongjiVO();
				
				vo.setGongji_no(rs.getInt("gongji_no"));
				vo.setGongji_writer(rs.getString("gongji_writer"));
				vo.setGongji_title(rs.getString("gongji_title"));
				vo.setGongji_content(rs.getString("gongji_content"));
				Date date = form.parse(rs.getString("gongji_date"));				
				vo.setGongji_date(form.format(date));
				vo.setGongji_hit(rs.getInt("gongji_hit"));
			
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public void gongjiHit(int no) {
		try {
			sql = "update gongji set gongji_hit=gongji_hit+1 where gongji_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public gongjiVO getCont(int no) {
		gongjiVO vo = new gongjiVO();
		
		try {
			sql = "select * from gongji where gongji_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setGongji_no(rs.getInt("gongji_no"));
				vo.setGongji_writer(rs.getString("gongji_writer"));
				vo.setGongji_title(rs.getString("gongji_title"));
				vo.setGongji_content(rs.getString("gongji_content"));
				vo.setGongji_date(rs.getString("gongji_date"));
				vo.setGongji_hit(rs.getInt("gongji_hit"));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo; // vo에 저장된 객체 리턴
	}
	
	
	
	
	
	
	
	
}
