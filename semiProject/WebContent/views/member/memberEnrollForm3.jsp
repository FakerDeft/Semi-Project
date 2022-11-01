<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div#head{
        font-size: 40px;
        width: 1600px;
        padding: 50px;
        margin-bottom: 50px;
        border-bottom: 2px solid lightgray;
    }
</style>
</head>
<body>
	<%@include file = "../common/menubar.jsp" %>
	<div align="center" style="width:1900px; position:relative;">
		<div class="outer">
			<div id="head" align="center">가입완료</div>
			
			<button onclick="goLogin();">로그인 하러 가기</button>
		    <button onclick="goHome();">메인으로</button>
		</div>
    </div>
    <script>
	    function goLogin(){
	    	location.href = "<%=contextPath%>/loginview.me";
	    }
    
	    function goHome(){
	    	location.href = "<%=contextPath%>";
	    }
    </script>

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>   
</body>
</html>


















