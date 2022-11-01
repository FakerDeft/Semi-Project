package com.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberEnrollForm
 */
@WebServlet("/enrollForm1.me")
public class MemberEnrollForm1Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberEnrollForm1Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//정적인 페이지 이동요청 forward 방식으로 위임하기
//		RequestDispatcher view = request.getRequestDispatcher("views/member/memberEnrollForm.jsp");
//		view.forward(request, response);
		
		//한줄로 쓰기
		request.getRequestDispatcher("views/member/memberEnrollForm1.jsp").forward(request, response);
		
	}

}
