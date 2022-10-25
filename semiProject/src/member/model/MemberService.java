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
	
}

