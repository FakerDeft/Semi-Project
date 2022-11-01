<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.semi.member.model.vo.Member"%>
<%
	String referer = request.getHeader("referer");
%>
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
        padding-top: 330px;
        margin-top: 10px;
        margin-left: 400px;
        margin-right: 400px;
        padding-bottom: 30px;
    }

    #id{
        border: 1px solid lightgray;
        border-radius: 3px;
        width: 300px;
        height: 40px;
    }
    #pw{
        border: 1px solid lightgray;
        border-radius: 3px;
        width: 300px;
        height: 40px;
    }

    #login-btn{
        width: 300px;
        height: 40px;
        border: 0px;
        border-radius: 3px;
        background-color: rgb(69, 69, 73);
        color: white;
    }
    #nomem-btn{
        width: 300px;
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
        margin-top:10px;
        border-radius: 3px;
        background-color: dodgerblue;
        color: white;
    }
   

</style>



</head>

<body>
<%@ include file = "/views/common/menubar.jsp" %>
	<div align="center" style="width:1900px; position:relative;">
        <div id="head" align="center">로그인</div>

        <div id="body" align="center">

            <div id="body1">
                <form action="<%=contextPath %>/login.me" method="post" id="login-form">
                    <input type="hidden" name="referer" value="<%=referer%>">
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
                            <td style="font-size: 15px; padding:5px;">
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
                            <td style="font-size: 15px; padding:5px;">
                                <input type="checkbox" name="remem" id="remem"> 주문자명 저장
                            </td>
                        </tr>
                        <tr align="left">
                            <th>
                                <button type="submit" id="nomem-btn">주문 배송 조회</button>
                            </th>
                        </tr>
                        <tr>    
                            <td style="color:gray;">
                               	⚠주문번호를 잊으신 경우, <br> 
                               	고객센터로 문의해주세요.
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

        </div>

        <div id="bottom" align="center">
        	<table>
        		<tr align="center" >
        			<td>
        				아직 장인의 회원이 아니신가요?
        			</td>
        		</tr>
        		<tr align="center">
        			<td>
        			 <button onclick="enrollPage();" id="enroll-btn">회원가입</button>
        			</td>
        		</tr>
        	</table>
        </div>
	</div>
            
  
	<script>
        	function enrollPage(){
        		location.href = "<%=contextPath%>/enrollForm1.me";
        	}
    </script>
		

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>