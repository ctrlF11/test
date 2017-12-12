package com.search.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class searchDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public searchDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/myoracle1");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<searchVO> searchBook(String search_option, String search_value,
			int select_year1, int select_year2) {
		List<searchVO> list = new ArrayList<searchVO>();
		if(search_option.equals("book_name")) {
			System.out.println("이름");
			try {
				sql = "select * from book_info where book_name like ? and book_year between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+search_value+"%");
				pstmt.setInt(2, select_year1);
				pstmt.setInt(3, select_year2);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					searchVO vo = new searchVO();

					vo.setBook_group(rs.getInt("book_group"));
					vo.setBook_name(rs.getString("book_name"));
					vo.setBook_writer(rs.getString("book_writer"));
					vo.setBook_category(rs.getString("book_category"));
					vo.setBook_number(rs.getString("book_number"));
					vo.setBook_year(rs.getInt("book_year"));
					vo.setBook_image(rs.getInt("book_image"));
					vo.setBook_state(rs.getInt("book_state"));
					
					list.add(vo);
				}
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if(search_option.equals("book_writer")) {
			System.out.println("작가");
			try {
				sql = "select * from book_info where book_writer like ? and book_year between ? and ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+search_value+"%");
				pstmt.setInt(2, select_year1);
				pstmt.setInt(3, select_year2);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					searchVO vo = new searchVO();

					vo.setBook_group(rs.getInt("book_group"));
					vo.setBook_name(rs.getString("book_name"));
					vo.setBook_writer(rs.getString("book_writer"));
					vo.setBook_category(rs.getString("book_category"));
					vo.setBook_number(rs.getString("book_number"));
					vo.setBook_year(rs.getInt("book_year"));
					vo.setBook_image(rs.getInt("book_image"));
					vo.setBook_state(rs.getInt("book_state"));
					
					list.add(vo);
				}
				rs.close();
				pstmt.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public List<searchVO> getBookInfo(String book_name) {
		List<searchVO> list = new ArrayList<searchVO>();

		try {
			sql = "select * from book_info where book_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, book_name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				searchVO vo = new searchVO();
				vo.setBook_group(rs.getInt("book_group"));
				vo.setBook_name(rs.getString("book_name"));
				vo.setBook_writer(rs.getString("book_writer"));
				vo.setBook_category(rs.getString("book_category"));
				vo.setBook_number(rs.getString("book_number"));
				vo.setBook_year(rs.getInt("book_year"));
				vo.setBook_image(rs.getInt("book_image"));
				vo.setBook_state(rs.getInt("book_state"));
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
	
}
