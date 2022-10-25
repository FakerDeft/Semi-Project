<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.member.model.vo.Member"%>
<%
	//context root(path): 고정값이 아닌 메소드를 통해 얻어오기
	String contextPath = request.getContextPath();
	
	//로그인 성공시 session에 담아놓은 loginUser 꺼내기
	Member loginMem = (Member)session.getAttribute("loginMem");	
	//로그인 전 loginUser == null
	//로그인 후 loginUser == 로그인한 회원 정보를 담은 Member 객체
	
	//로그인 성공시 session에 담아놓은 알림 메세지도 꺼내주기
	String alertMsg = (String)session.getAttribute("alertMsg");
	
	//서비스 요청 전 : null
	//서비스 요청 후 : 해당 서비스에서 넣어놓은 알림 메세지
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>

    .nav-area{
        background-color: bisque;
    }
    .menu{
        display: table-cell;
        height: 50px;
        width: 150px;
    }
    .menu a{
        text-decoration: none;
        color: black;
        font-size: 20px;
        font-weight: bold;
        display: block;
        width: 100%;
        height: 100%;
        line-height: 50px;
    }
    .menu a:hover{
        background-color: lightyellow;

    }
</style>
</head>
<body>
	<div class="outer">
		<script>
			var msg = "<%=alertMsg%>";
			
			if(msg != "null"){
				alert(msg);
				//알림창을 띄워준 후에 session에 담긴 alertMsg를 지워야한다
				//하지않으면 새로고침(페이지 리로딩)될 때마다 alert창이 띄워지게 된다
				<%session.removeAttribute("alertMsg");%>
			}
		</script>
		
		<%if(loginMem != null) {%>
	     <div id="user-info">
			    <br><br>
			    	<div align="center">
			    	<a href="<%=contextPath%>/logout.me">로그아웃</a>
			    </div>
		</div>
		<%}else{ %>
			<div align="center" id="mainlog-btn"><a href="<%=contextPath%>/loginview.me">로그인</a></div>
		<%} %>
	    <div class="nav-area" align="center">
	        <div class="menu"><a href="/smp">HOME</a></div>
	        <div class="menu"><a href="">aa</a></div>
	        <div class="menu"><a href="">ee</a></div>
	        <div class="menu"><a href="">dd</a></div>
	    </div>
    
    
	</div>	
</body>

</html>