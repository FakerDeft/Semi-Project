package com.semi.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.semi.common.JDBCTemplate;
import com.semi.member.model.vo.Member;
import com.semi.member.model.vo.MemberId;
import com.semi.member.model.vo.MemberPw;
import com.semi.member.model.vo.Order;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	
	public MemberDao() {
			
			String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();
			
			try {
				prop.loadFromXML(new FileInputStream(filePath));
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("member-mapper경로 이상!");
			}
	}
		
	//로그인 메소드
	public Member loginMember(Connection conn, String memId, String memPw) {
		
		Member m = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("loginMember");
		
		try {

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memId);
			pstmt.setString(2, memPw);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("MEM_NO")
							  ,rset.getString("MEM_ID")
							  ,rset.getString("MEM_PW")
							  ,rset.getString("MEM_NAME")
							  ,rset.getString("MEM_PHONE")
							  ,rset.getString("MEM_EMAIL")
							  ,rset.getString("MEM_ADDRESS")
							  ,rset.getString("GRADE")
							  ,rset.getDate("ENROLLDATE")
							  ,rset.getString("ENROLLFLAG")
							  ,rset.getDate("DELETEDATE")
							  );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 이상!");
		}finally {
			if(rset != null) {
				JDBCTemplate.close(rset);
			}
			if(pstmt != null) {				
				JDBCTemplate.close(pstmt);
			}
		}
		return m;
	}
	
	//회원가입 메소드
	public int insertMember(Connection conn,Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemId());
			pstmt.setString(2, m.getMemPw());
			pstmt.setString(3, m.getMemName());
			pstmt.setString(4, m.getMemEmail());
			pstmt.setString(5, m.getMemPhone());
			pstmt.setString(6, m.getMemAddress());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 오류");
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	
	//아이디 중복 체크 메소드
	public int idDuplicationCheck(Connection conn, String memId) {
		
		int idDuplicationCheck = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("idDuplicationCheck");
		
	    try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			
			rset = pstmt.executeQuery();
					
			if(rset.next() || memId.equals("")) {
				idDuplicationCheck = 0;  // 이미 존재하는 경우, 생성 불가능
			} else {
				idDuplicationCheck = 1;  // 존재하지 않는 경우, 생성 가능
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 오류");
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return idDuplicationCheck;
	}

	//아이디 찾기 메소드
	public MemberId findId(Connection conn, String memName, String memPhone) {
		
		MemberId mid = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("findId");
		
		try {

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memName);
			pstmt.setString(2, memPhone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mid = new MemberId(rset.getString("MEM_ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 이상!");
		}finally {
			if(rset != null) {
				JDBCTemplate.close(rset);
			}
			if(pstmt != null) {				
				JDBCTemplate.close(pstmt);
			}
		}
		
		return mid;
	}

	public MemberPw findPw(Connection conn, String memId, String memName, String memPhone) {
		MemberPw mpw = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("findPw");
		
		try {

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memId);
			pstmt.setString(2, memName);
			pstmt.setString(3, memPhone);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				mpw = new MemberPw(rset.getString("MEM_PW"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 이상!");
		}finally {
			if(rset != null) {
				JDBCTemplate.close(rset);
			}
			if(pstmt != null) {				
				JDBCTemplate.close(pstmt);
			}
		}
		
		return mpw;
	}

	public Order loginNoMember(Connection conn, String reciverName, String orderNo) {
		Order o = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("loginNoMember");
		
		try {

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reciverName);
			pstmt.setString(2, orderNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				o = new Order(rset.getInt("ORDER_NO")
							 ,rset.getString("RECIVER_NAME")
							  );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 이상!");
		}finally {
			if(rset != null) {
				JDBCTemplate.close(rset);
			}
			if(pstmt != null) {				
				JDBCTemplate.close(pstmt);
			}
		}
		return o;
	}

}
