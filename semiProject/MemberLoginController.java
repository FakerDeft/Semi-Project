package com.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberLoginController
 */
@WebServlet("/login.me")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberLoginController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");

		Member loginMem = new MemberService().loginMember(memId, memPw);
		
		if(loginMem != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginMem", loginMem);
			session.setAttribute("alertMsg", "로그인 성공!");
			response.sendRedirect(request.getContextPath());
		}
		else {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "로그인 실패!");
			response.sendRedirect(request.getContextPath());
		}
	}
	
}





