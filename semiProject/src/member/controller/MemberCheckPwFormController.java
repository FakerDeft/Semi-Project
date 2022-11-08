package com.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberPw
 */
@WebServlet("/pwcheck.me")
public class MemberCheckPwFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MemberCheckPwFormController() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memPw = request.getParameter("memPw");
		HttpSession session = request.getSession();
		Member loginMem = (Member) session.getAttribute("loginMem");
		
		if(loginMem.getMemPw() != memPw){
			session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			response.sendRedirect(request.getHeader("referer"));
		} else {
			response.sendRedirect(request.getContextPath()+"/modifyform.me");
		}
		
	}
	
}
















