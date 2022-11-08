package com.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberModifyFormController
 */
@WebServlet("/modifyform.me")
public class MemberModifyFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public MemberModifyFormController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("views/member/memberModifyForm.jsp").forward(request, response);
	}
}





















