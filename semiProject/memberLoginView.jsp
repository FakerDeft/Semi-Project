<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.member.model.vo.Member"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
    div#head{
        font-size: 40px;
        padding: 50px;
        margin-right:100px;
        margin-left:100px;
        margin-bottom: 50px;
        border-top: 1px solid lightgrey;
        border-bottom: 1px solid gray;
    }

    div#body{
        margin-right:100px;
        margin-left:100px;
        margin-bottom: 50px;
    }
    #body>div{
        float: left;
    }
    #body1{
        width: 50%;
        padding-bottom:8px;
    }
    #bb{
    	margin-top:50px;
    	width: 1px;
    	height:250px;
    	border: 1px solid lightgray;
    }
    #body2{
        width: 48%;
    }
    
    #login1{
    	margin-top:50px;
        margin-right: 50px;
        height: 200px;
        float: right;
    }
    #login2{
    	margin-top:50px;
        margin-left:50px;
        height: 200px;
        float: left;
    }

    #bottom{
        background-color:whitesmoke;
        padding-top: 350px;
        margin-top: 10px;
        margin-left: 400px;
        margin-right: 400px;
        padding-bottom: 30px;
    }

    #id{
        border: 1px solid lightgray;
        border-radius: 3px;
        width: 250px;
        height: 40px;
    }
    #pw{
        border: 1px solid lightgray;
        border-radius: 3px;
        width: 250px;
        height: 40px;
    }

    #login-btn{
        width: 250px;
        height: 40px;
        border: 0px;
        border-radius: 3px;
        background-color: rgb(69, 69, 73);
        color: white;
    }
    #nomem-btn{
        width: 250px;
        height: 40px;
        border: 0px;
        border-radius: 3px;
        background-color: lightgray;
        color: black;
    }
    #enroll-btn{
        width: 300px;
        height: 40px;
        border: 0px;
        border-radius: 3px;
        background-color: dodgerblue;
        color: white;
    }
   

</style>



</head>

<body>
<%@ include file = "/views/common/menubar.jsp" %>

        <div id="head" align="center">로그인</div>

        <div id="body" align="center">

            <div id="body1">
                <form action="<%=contextPath %>/login.me" method="post" id="login-form">
                    <table align="center" id="login1">
                        <tr align="left">
                            <td style="font-size: 20px; color:rgb(69, 69, 73);">| 회원 로그인</td>
                        </tr>
                        <tr align="left">
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="memId" id="id" placeholder="아이디" required></td>
                        </tr>
                        <tr align="left">
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="password" name="memPw" id="pw" placeholder="비밀번호" required></td>
                        </tr>
                        <tr align="left">
                            <td style="font-size: 12px;">
                                <input type="checkbox" name="remem" id="remem"> 아이디 저장
                            </td>
                        </tr>
                        <tr align="left">
                            <th>
                                <button type="submit" id="login-btn">로그인</button>
                            </th>
                        </tr>
                        <tr align="right">
                            <td>
                                <a href="">아이디 찾기</a> |
                                <a href="">비밀번호 찾기</a>
                                <br>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 17px;">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            
            <div id="bb">
            	
            </div>
            
            <div id="body2">
                <form action="/smp/noLogin.me" method="post" id="login-form">
                    <table align="center" id="login2">
                        <tr align="left">
                            <td style="font-size: 20px; color:rgb(69, 69, 73)">| 비회원 구매조회</td>
                        </tr>
                        <tr align="left">
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="memId" id="id" placeholder="주문자명" required></td>
                        </tr>
                        <tr align="left">
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="password" name="memPw" id="pw" placeholder="주문번호" required></td>
                        </tr>
                        <tr align="left">
                            <td style="padding-top: 5px;">
                                <p></p>
                            </td>
                        </tr>
                        <tr align="left">
                            <th>
                                <button type="submit" id="nomem-btn">주문 배송 조회</button>
                            </th>
                        </tr>
                        <tr>    
                            <td style="color:gray;">
                               	※주문번호와 비밀번호를 잊으신 경우, <br>
                               	고객센터로 문의해주세요.
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

        </div>

        <div id="bottom" align="center">
            <p>아직 장인의 회원이 아니신가요?</p>
            <p>
                <button onclick="enrollPage();" id="enroll-btn">회원가입</button>
            </p>
        </div>
            
  
	<script>
        	function enrollPage(){
        		//location.href = "<%=contextPath%>/views/member/memberEnrollForm.jsp";
        		//웹 애플리케이션의 디렉토리 구조가 url에 노출되면 보안에 취약하다.
        		
        		//단순한 정적 페이지 이동이여도 해당 페이지로 바로 이동하지 않고
        		//servlet을 거쳐서 서블릿 매핑값으로 보여지게 할 것
        		location.href = "<%=contextPath%>/enrollForm.me";
        	}
        </script>
		

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>