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
				m = new Member(rset.getString("MEM_ID")
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
	
	public int checkId(Connection conn, String memId) {  // 유저가 입력한 값을 매개변수로 한다
		
		int idCheck = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkId");
		
	    try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			
			rset = pstmt.executeQuery();
					
			if(rset.next() || memId.equals("")) {
				idCheck = 0;  // 이미 존재하는 경우, 생성 불가능
			} else {
				idCheck = 1;  // 존재하지 않는 경우, 생성 가능
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DB 오류");
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return idCheck;
	}

}
