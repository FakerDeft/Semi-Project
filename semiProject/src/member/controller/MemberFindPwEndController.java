package com.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
		try {
			if(!mpw.equals(null)) {				
				System.out.println("비밀번호 조회 성공");
				request.setAttribute("mpw", mpw);
				request.getRequestDispatcher("views/member/memberFindPwEnd.jsp").forward(request, response);
			}
		} catch(NullPointerException e){
			e.printStackTrace();
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "없는 회원입니다.");
			response.sendRedirect(request.getContextPath());
		}
	}

}
