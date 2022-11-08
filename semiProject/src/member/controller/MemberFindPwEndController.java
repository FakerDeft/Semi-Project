package com.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.MemberId;
import com.semi.member.model.vo.MemberPw;

/**
 * Servlet implementation class MemberFindPwEndController
 */
@WebServlet("/findPwEnd.me")
public class MemberFindPwEndController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberFindPwEndController() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memId = request.getParameter("memId");
		String memName = request.getParameter("memName");
		String memPhone = request.getParameter("memPhone");
		MemberPw mpw = new MemberService().findPw(memId,memName, memPhone);
		
		if (mpw.equals(null)) {
			System.out.println("비번 조회 실패");
		} else {
			System.out.println("비번 조회 성공");
			request.setAttribute("mpw", mpw);
			request.getRequestDispatcher("/views/member/memberFindPwEnd.jsp").forward(request, response);
		}
	}

}
