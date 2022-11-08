package com.semi.member.model.service;

import java.sql.Connection;

import com.semi.common.JDBCTemplate;
import com.semi.member.model.dao.MemberDao;
import com.semi.member.model.vo.Member;
import com.semi.member.model.vo.MemberId;
import com.semi.member.model.vo.MemberPw;
import com.semi.member.model.vo.Order;

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
	
	public int idDuplicationCheck(String memId) {
		
		Connection conn = JDBCTemplate.getConnection();
	
		int result = new MemberDao().idDuplicationCheck(conn,memId);
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public MemberId findId(String memName, String memPhone) {
		Connection conn = JDBCTemplate.getConnection();
		
		MemberId m = new MemberDao().findId(conn,memName,memPhone);
		
		JDBCTemplate.close(conn);
		
		return m;
	}

	public MemberPw findPw(String memId, String memName, String memPhone) {
		Connection conn = JDBCTemplate.getConnection();
		
		MemberPw mpw = new MemberDao().findPw(conn,memId,memName,memPhone);
		
		JDBCTemplate.close(conn);
		
		return mpw;
	}

	public Order loginNoMember(String reciverName, String orderNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		Order o = new MemberDao().loginNoMember(conn,reciverName,orderNo);
		
		JDBCTemplate.close(conn);
		
		return o;
	}
	
}
