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
	
	<!-- 한글폰트 26개 -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&family=Black+Han+Sans&family=Cute+Font&family=Do+Hyeon&family=Dokdo&family=East+Sea+Dokdo&family=Gaegu&family=Gamja+Flower&family=Gothic+A1&family=Gugi&family=Hi+Melody&family=Jua&family=Kirang+Haerang&family=Nanum+Brush+Script&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&family=Yeon+Sung&display=swap" rel="stylesheet">
	<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
	
	#headbar{
		width: 1600px;
	}
	.headbtn{
		display: table-cell;
		height: 50px;
		padding-top:20px;
        width: 100px;
	}
    .nav-area{
    	width: 1600px;
    	padding-top:10px;
    	padding-bottom:10px;
    	border-top: 2px solid lightgrey;
		border-bottom: 2px solid lightgrey;
    }
    .nav-area2{
    	width: 1600px;
    	height: 400px;
    	background-color:blanchedalmond;
    	opacity:0.8;
    	
        padding: 0px;
       	/*평소에는 보이지 않다가 마우스를 올리면 보여지게 하기 1단계*/
        display: none;
        
    }
    .menu{
        display: table-cell;
        height: 50px;
        width: 310px;
    }
    .menu a{
        text-decoration: none;
        color: black;
        font-size: 30px;
        font-weight: 500;
        font-family: 'Noto Sans KR';
        padding-top:10px;
        padding-right:30px;
        display: block;
        width: 250px;
        height: 100px;
    }
    .menu_category{
    	list-style-type: none;
    	margin-right:25px;
    }
	.category a{
		font-family: 'Noto Sans KR';
		font-size: 25px;
		font-weight:500;
	}
	.category:hover{
		text-decoration: underline;
	}
    #header1{
    	position: relative;
	}
	#logo{
	    width: 200px;
	    margin:auto;
	    /*방법 1*/
	    top:0px;
	    bottom: 0px;
	    
	    /*방법 2*/
	    /* left: 50%;
	    top:50%;
	    transform: translate(-50%,-50%); */
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
		<div align="right" id="headbar">
			<div class="headbtn" id="mainlog-btn">
				<a href="<%=contextPath%>/loginview.me">로그인</a>
			</div>
			<div class="headbtn">
				<a href="<%=contextPath%>/enrollForm1.me">회원가입</a>
			</div>
			<div class="headbtn">
				<a href="">주문조회</a>
			</div>
			<div class="headbtn">
				<a href="">장바구니</a>
			</div>
		</div>
		<%} %>
		<div align="center" style="width:1900px">
		    <div align="center" class="nav-area">
		        <div class="menu">
		        	<a href="">공예상품</a>
		        </div>
		        <div class="menu">
		        	<a href="">체험상품</a>
		        </div>
		        <div class="menu" id="header1">
		        	<a href="/smp">
	                <img src="resources/img/icon/logo.JPG" id="logo">
		        	</a>
	       		</div>
		        <div class="menu">
		        	<a href="">게시판</a>
		        </div>
		        <div class="menu">
		        	<a href="">고객센터</a>
		        </div>
		    </div>
		</div>
		<div align="center" style="width:1900px; z-index: 999; position:absolute;">
		    <div align="center" class="nav-area2">
		        <div class="menu">
		        	<ul class="menu_category">
	                   <li class="category"><a href="">식기/생활용품</a></li>
	                   <li class="category"><a href="">문구/악세사리</a></li>
	                   <li class="category"><a href="">의류/잡화</a></li>
	                   <li class="category"><a href="">인테리어 소품</a></li>
		        	</ul>
		        </div>
		        <div class="menu">
		        	<ul class="menu_category">
	                   <li class="category"><a href="">지역별</a></li>
	                   <li class="category"><a href="">카테고리별</a></li>
		        	</ul>
		        </div>
		        <div class="menu">
	       		</div>
		        <div class="menu">
		        	<ul class="menu_category">
	                   <li class="category"><a href="">사이트안내</a></li>
	                   <li class="category"><a href="">공지사항</a></li>
		        	</ul>
		        </div>
		        <div class="menu">
		        	<ul class="menu_category">
	                   <li class="category"><a href="">자주묻는질문</a></li>
	                   <li class="category"><a href="">1:1 문의</a></li>
		        	</ul>
		        </div>
		    </div>
		</div>
    
	</div>
	<script>
		$('.nav-area').mouseenter(function(){
	        let menu_i = $(this).index();
	        
	        if(menu_i < 4) {
	
	            $('.nav-area2').css({ //모두 display:none 시킨 후 
	                display:'none'
	            }).eq($(this).index()).css({ // 해당 인덱스 넘버만 보여질 수 있도록 한다.
	                display:'block'
	            })
	        }
	    });
	    $('.nav-area ').mouseleave(function(){
	        let menu_i = $(this).index();
	
	        if(menu_i < 4) {
	            $('.nav-area2').eq($(this).index()).css({
	                display:'none'
	            })
	        }
	    })
	
	    $('.nav-area2').mouseenter(function(){
	        $('.nav-area2').eq($(this).index()).css({
	            display:'block'
	        })
	    })
	    $('.nav-area2').mouseleave(function(){
	        $('.nav-area2').eq($(this).index()).css({
	            display:'none'
	        })
	    })
	</script>
</body>

</html>


















