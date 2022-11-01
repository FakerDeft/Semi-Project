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
    
    <!-- 섹션 크기 -->
	.bg-light{
		height: 1053px;
		padding-top:55px;
		padding-bottom:75px;
	}
	
	.flex-fill.mx-xl-5.mb-2{
		margin: 0 auto;
		width : 700px;
		padding-right: 7rem;
		padding-left: 7rem;
	}
	
    <!-- 입력창 -->
	.container.py-4{
		margin: 0 auto;
		width : 503px;
	}
	
    <!-- 가입하기 -->
	.d-grid.gap-2{
		padding-top: 30px;
	}
	
    <!-- 생년월일 -->
	.bir_yy,.bir_mm,.bir_dd{
		width:160px;
		display:table-cell;
	}
	.bir_mm+.bir_dd, .bir_yy+.bir_mm{
		padding-left:10px;
	}
	
	#id,#pw,#pwc,#name,#email{
		width: 500px;
	}
    
</style>
</head>
<body>
	<%@include file = "../common/menubar.jsp" %>
	<div align="center" style="width:1900px; position:relative;">
		<div class="outer">
			<div id="head" align="center">회원가입</div>
			
			<section class="bg-light">
        <div class="container py-4">
            <div class="row align-items-center justify-content-between">
                <a class="navbar-brand h1 text-center" href="index.do">
                    <span class="text-dark h4"></span> <span class="text-primary h4"></span>                 
                </a>
            </div>
            <form>
                <div class="form-group">
               		<label for="exampleInputEmail1" class="form-label mt-4">아이디</label>
                    <input type="text" class="form-control is-valid" id="id" placeholder="4~15자의 영문/숫자를 조합하여 입력">
                	<div class="valid-feedback"></div>
                </div>
				<div class="form-group has-success">
					<label class="form-label mt-4" for="inputValid">비밀번호</label>
					<input type="password" class="form-control" id="pw" placeholder="8~16자의 영문/숫자/특수문자를 조합하여 입력">
				</div>

				<div class="form-group has-danger">
					<label class="form-label mt-4" for="inputInvalid">비밀번호 재확인</label> 
					<input type="password" class="form-control is-invalid" id="pwc" placeholder="비밀번호 다시 입력">
					<div class="invalid-feedback" id="cp">비밀번호를 입력하세요</div>
				</div>
                <div class="form-group">
               		<label for="exampleInputEmail1" class="form-label mt-4">이름</label>
                    <input type="text" class="form-control" id="name" placeholder="이름 입력">
                </div>
                <div class="form-group">
               		<label for="exampleInputEmail1" class="form-label mt-4">본인 확인 이메일</label>
                    <input type="email" class="form-control" id="email" placeholder="이메일 입력">
                </div>
                <div class ="bir_wrap">
                	<label class="form-label mt-4">생년월일</label>
                	<div class="bir_yy">
                		<span class="ps_box">
                			<input type="text" class="form-control" id="yy" placeholder="년(4자)" maxlength="4">
                		</span>
                	</div>
                	<div class="bir_mm">
                		<span class="ps_box focus">
			                <select class="form-select" id="mm" id="exampleSelect1">
						        <option>월</option>
						        <option>1</option>
						        <option>2</option>
						        <option>3</option>
						        <option>4</option>
						        <option>5</option>
						        <option>6</option>
						        <option>7</option>
						        <option>8</option>
						        <option>9</option>
						        <option>10</option>
						        <option>11</option>
						        <option>12</option>
						     </select>
                		</span>
                	</div>
                	<div class="bir_dd">
                		<span class="ps_box">
                			<input type ="text" class="form-control" id ="dd" placeholder="일" maxlength="2">
                		</span>
                	</div>
                </div>
			    <div class="form-group">
			      <label for="exampleSelect1" class="form-label mt-4">성별</label>
			      <select class="form-select" id="exampleSelect1">
			        <option>남자</option>
			        <option>여자</option>
			      </select>
			    </div>                
                
				<div class="d-grid gap-2">
                    <button class="btn btn-primary btn-lg" type="button">가입하기</button>
                </div>

            </form>
        </div>
    </section>
			
		</div>
	</div>
	
    <script> 
        function register(){
            var id = document.getElementById("id").value;
            var id_rule = /^[a-zA-Z]\w{3,14}$/;
            var pw = document.getElementById("pw").value;
            var pw_rule = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
            var pwc = document.getElementById("pwc").value;
            var name = document.getElementById("name").value;
            var name_rule = /^[가-힣]{2,}$/;
            var email = document.getElementById("email").value;
            var email_rule =  /^[0-9a-zA-Z]{1,}@[0-9a-zA-Z]{1,}.[a-zA-Z]{2,3}$/;

            
            if(id==""){
                alert("아이디를 입력해주세요.")
                return false;
            }
            else if(pw==""){
                alert("비밀번호를 입력해주세요.")
                return false;
            }
            else if(!pw_rule.test(pw)){
                alert("영문자, 숫자, 특수문자(!@#$%^&*)를 포함해 8~16자만 가능합니다.")
                return false;
            }
            else if(name==""){
                alert("이름을 입력해주세요.")
                return false;
            }
            else if(!name_rule.test(name)){
                alert("2글자 이상 한글만 가능합니다.")
                return false;
            }
            else if(email==""){
                alert("이메일을 입력해주세요.")
                return false;
            }
            else if(!email_rule.test(email)){
                alert("이메일 형식에 맞춰서 입력하세요.")
                return false;
            }
        }
        
        $('#id').focusout(function(){
    		let memId = $('#id').val(); // id에 입력되는 값
    		let id_rule = /^[a-zA-Z]\w{3,14}$/;
    		
    		$.ajax({
    			url : "IdCheck.me",
    			type : "post",
    			data : {memId: memId},
    			dataType : 'json',
    			success : function(result){
    				if(result == 0){
    					$("#checkId").html('사용할 수 없는 아이디입니다.');
    					$("#checkId").attr('color','red');
    				} else if(!id_rule.test(memId)){
    					$("#checkId").html('사용할 수 없는 아이디입니다.');
    					$("#checkId").attr('color','red');
    	            } else{
    					$("#checkId").html('사용 가능한 아이디입니다.');
    					$("#checkId").attr('color','green');
    				} 
    			},
    			error : function(){
    				alert("서버요청실패");
    			}
    		})
    		 
    	})
        
        $("#pw").focusout(function(){
        	let pw = $('#pw').val();
        	let pwc = $('#pwc').val();
        	
        	if(pw == ""){
        		$("#cp").html('비밀번호를 입력하세요');
        	}
        	else if(pw != pwc){
        		$("#cp").html('비밀번호가 일치하지 않습니다');
        	}else{        		
        		$("#cp").html('');
        		$("#cp").attr('',);
        	}
        	
        })
        
        $("#pwc").focusout(function(){
        	let pw = $('#pw').val();
        	let pwc = $('#pwc').val();
        	
        	if(pw == ""){
        		$("#cp").html('비밀번호를 입력하세요');
        	}
        	else if(pwc == "" || pw != pwc){
        		$("#cp").html('비밀번호가 일치하지 않습니다');
        	}else{        		
        		$("#cp").html('');
        	}
        	
        })
        
        
        function goHome(){
        	location.href = "<%=contextPath%>";
        }
          
    </script>
      
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>














