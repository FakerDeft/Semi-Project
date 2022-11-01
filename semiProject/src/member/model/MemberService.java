package com.semi.member.model.service;

import java.sql.Connection;

import com.semi.common.JDBCTemplate;
import com.semi.member.model.dao.MemberDao;
import com.semi.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String memId, String memPw) {
		Connection conn = JDBCTemplate.getConnection();
	
		Member m = new MemberDao().loginMember(conn,memId,memPw);
		
		JDBCTemplate.close(conn);
		
		return m;
	}

	public int insertMember(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMember(conn,m);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}
		else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public int checkId(String memId) {
		
		Connection conn = JDBCTemplate.getConnection();
	
		int result = new MemberDao().checkId(conn,memId);
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
}
