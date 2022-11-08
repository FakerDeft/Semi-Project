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
 * Servlet implementation class MemberModifyController
 */
@WebServlet("/modify.me")
public class MemberModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberModifyController() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginMem = (Member) session.getAttribute("loginMem");
		
		request.getRequestDispatcher("views/member/memberModifyEnd.jsp").forward(request, response);
	}
	
}




















