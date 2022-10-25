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

}
