package com.admin.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.inquire.model.inquireVO;

public class adminDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public adminDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/myoracle1");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int getAllListCount() {
		int count = 0;
		try {
			sql = "select count(*) from book_info";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			rs.close(); pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public int getListCount(String line) {
		int count = 0;
		try {
			sql = "select count(*) from book_info where book_category=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, line);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			rs.close(); pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public int getSearchListCount(String search_value) {
		int count = 0;
		try {
			sql = "select count(*) from book_info where book_name like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search_value+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			rs.close(); pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public List<adminVO> getSearchData(String search_value, int page, int rowsize) {
		List<adminVO> list = new ArrayList<adminVO>();
		
		int startRow = (page-1)*8+1;
		int endRow = page*rowsize;
		
		try {
			sql = "select * from"
					+ "(select rownum as rnum, book_info.* from book_info where book_name like ?)"
					+ "where rnum>=? and rnum<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+search_value+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				adminVO vo = new adminVO();
				
				vo.setBook_group(rs.getInt("book_group"));
				vo.setBook_name(rs.getString("book_name"));
				vo.setBook_writer(rs.getString("book_writer"));
				if(rs.getString("book_category").equals("b")) {
					vo.setBook_category("도서");
				} else if(rs.getString("book_category").equals("p")) {
					vo.setBook_category("간행물");
				} else if(rs.getString("book_category").equals("e")) {
					vo.setBook_category("전자도서");
				}
				vo.setBook_number(rs.getString("book_number"));
				vo.setBook_year(rs.getInt("book_year"));
				vo.setBook_image(rs.getString("book_image"));
				vo.setBook_state(rs.getInt("book_state"));
				
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		return list;
	}
	
	public List<adminVO> getAllData(int page, int rowsize) {
		List<adminVO> list = new ArrayList<adminVO>();
		
		int startRow = (page-1)*8+1;
		int endRow = page*rowsize;
		
		try {
			sql = "select * from"
					+ "(select rownum as rnum, book_info.* from book_info)"
					+ "where rnum>=? and rnum<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				adminVO vo = new adminVO();
				
				vo.setBook_group(rs.getInt("book_group"));
				vo.setBook_name(rs.getString("book_name"));
				vo.setBook_writer(rs.getString("book_writer"));
				if(rs.getString("book_category").equals("b")) {
					vo.setBook_category("도서");
				} else if(rs.getString("book_category").equals("p")) {
					vo.setBook_category("간행물");
				} else if(rs.getString("book_category").equals("e")) {
					vo.setBook_category("전자도서");
				}
				vo.setBook_number(rs.getString("book_number"));
				vo.setBook_year(rs.getInt("book_year"));
				vo.setBook_image(rs.getString("book_image"));
				vo.setBook_state(rs.getInt("book_state"));
				
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		return list;
	}
	public List<adminVO> getBookData(int page, int rowsize) {
		List<adminVO> list = new ArrayList<adminVO>();
		
		int startRow = (page-1)*5+1;
		int endRow = page*rowsize;
		
		try {
			sql = "select * from"
					+ "(select rownum as rnum, book_info.* from book_info"
					+ " where book_info.BOOK_CATEGORY='b')"
					+ " where rnum>=? and rnum<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				adminVO vo = new adminVO();
				
				vo.setBook_group(rs.getInt("book_group"));
				vo.setBook_name(rs.getString("book_name"));
				vo.setBook_writer(rs.getString("book_writer"));
				vo.setBook_category("도서");
				vo.setBook_number(rs.getString("book_number"));
				vo.setBook_year(rs.getInt("book_year"));
				vo.setBook_image(rs.getString("book_image"));
				vo.setBook_state(rs.getInt("book_state"));
				
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		return list;
	}
	public List<adminVO> getPublicData(int page, int rowsize) {
		List<adminVO> list = new ArrayList<adminVO>();
		
		int startRow = (page-1)*5+1;
		int endRow = page*rowsize;
		
		try {
			sql = "select * from"
					+ "(select rownum as rnum, book_info.* from book_info"
					+ " where book_info.BOOK_CATEGORY='p')"
					+ " where rnum>=? and rnum<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				adminVO vo = new adminVO();
				
				vo.setBook_group(rs.getInt("book_group"));
				vo.setBook_name(rs.getString("book_name"));
				vo.setBook_writer(rs.getString("book_writer"));
				vo.setBook_category("간행물");
				vo.setBook_number(rs.getString("book_number"));
				vo.setBook_year(rs.getInt("book_year"));
				vo.setBook_image(rs.getString("book_image"));
				vo.setBook_state(rs.getInt("book_state"));
				
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		return list;
	}
	public List<adminVO> getEbookData(int page, int rowsize) {
		List<adminVO> list = new ArrayList<adminVO>();
		
		int startRow = (page-1)*5+1;
		int endRow = page*rowsize;
		
		try {
			sql = "select * from"
					+ "(select rownum as rnum, book_info.* from book_info"
					+ " where book_info.BOOK_CATEGORY='e')"
					+ " where rnum>=? and rnum<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()){
				adminVO vo = new adminVO();
				
				vo.setBook_group(rs.getInt("book_group"));
				vo.setBook_name(rs.getString("book_name"));
				vo.setBook_writer(rs.getString("book_writer"));
				vo.setBook_category("전자도서");
				vo.setBook_number(rs.getString("book_number"));
				vo.setBook_year(rs.getInt("book_year"));
				vo.setBook_image(rs.getString("book_image"));
				vo.setBook_state(rs.getInt("book_state"));
				
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		return list;
	}
	
	public adminVO getCont(String no){ 
		adminVO vo = new adminVO();
		
		try {
			sql = "select * from book_info where book_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setBook_group(rs.getInt("book_group"));
				vo.setBook_name(rs.getString("book_name"));
				vo.setBook_writer(rs.getString("book_writer"));
				if(rs.getString("book_category").equals("b")) {
					vo.setBook_category("도서");
				} else if(rs.getString("book_category").equals("p")) {
					vo.setBook_category("간행물");
				} else if(rs.getString("book_category").equals("e")) {
					vo.setBook_category("전자도서");
				}
				
				vo.setBook_number(rs.getString("book_number"));
				vo.setBook_year(rs.getInt("book_year"));
				vo.setBook_image(rs.getString("book_image"));
				vo.setBook_state(rs.getInt("book_state"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
	}
	
	public int dataEdit(adminVO vo, String origin_Bnum) {
		int check = 0;
		
		try {
			sql = "update book_info set book_group=?, book_name=?, book_writer=?, "
					+ "book_category=?, book_number=?, book_year=?, book_image=?"
					+ " where book_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getBook_group());
			pstmt.setString(2, vo.getBook_name());
			pstmt.setString(3, vo.getBook_writer());
			pstmt.setString(4, vo.getBook_category());
			pstmt.setString(5, vo.getBook_number());
			pstmt.setInt(6, vo.getBook_year());
			pstmt.setString(7, vo.getBook_image());
			pstmt.setString(8, origin_Bnum);
			check = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return check;
	}
	
	public int deleteBook(String book_no) {
		int check = -1;
		try {
			sql="delete from book_info where book_number=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, book_no);
			check = pstmt.executeUpdate(); // delete문 실행
			pstmt.close(); con.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		return check;
	}
	
	public String getIntro(String intro) {
		String ret = null;
		try {
			sql = "select * from intro";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ret = rs.getString(intro);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ret;
	}
	
	public int updateIntro(String intro_value, String intro) {
		int check = -1;
		try{
 			sql = "update intro set " + intro_value + "='" + intro + "'";
			pstmt = con.prepareStatement(sql);
			check = pstmt.executeUpdate();
			pstmt.close(); con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return check; // 실행결과 리턴
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

	public List<adminVO> getBwList(int page, int allPage, int rowsize, int totalRecord) {
		List<adminVO> list = new ArrayList<adminVO>();
		
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
				adminVO vo = new adminVO();
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

	public int delBw(String[] checkboxs) {
		int check = -1;
		for(int i=0;i<checkboxs.length;i++) {
			try {
				sql = "delete book_reserve where br_no="+checkboxs[i];
				pstmt = con.prepareStatement(sql);
				check = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			con.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return check;
	}

	public void bwHit(int no) {
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

	public adminVO getCont(int no) {
		adminVO vo = new adminVO();
		
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

	public int delGongji(String[] checkboxs) {
		int check = -1;
		for(int i=0;i<checkboxs.length;i++) {
			try {
				sql = "delete gongji where gongji_no="+checkboxs[i];
				pstmt = con.prepareStatement(sql);
				check = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			con.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return check;
	}

	public int insertGongji(String gongji_title, String gongji_cont) {
		int check = -1;
		try {
			sql = "insert into gongji values(gongji_seq.nextval,"
					+ "'운영자', ?, ?, sysdate, 0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, gongji_title);
			pstmt.setString(2, gongji_cont);
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

	public int updateGongji(String gongji_title, String gongji_cont, int gongji_no) {
		int check = -1;
		try {
			sql = "update gongji set gongji_title=?, gongji_content=?"
					+ "where gongji_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, gongji_title);
			pstmt.setString(2, gongji_cont);
			pstmt.setInt(3, gongji_no);
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

	public List<inquireVO> getInquireList() {
		List<inquireVO> inquireList = new ArrayList<inquireVO>();
		
		try {
			sql = "select * from inquire_board order by inquire_no desc";
			pstmt = con.prepareStatement(sql);
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

	public int updateInquire(String inquire_title, String inquire_cont, int inquire_no) {
		int check = -1;
		try {
			sql = "update inquire_board set inquire_title=?, inquire_content=?"
					+ "where inquire_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, inquire_title);
			pstmt.setString(2, inquire_cont);
			pstmt.setInt(3, inquire_no);
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
