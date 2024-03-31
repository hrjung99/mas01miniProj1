<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="icon" type="image/x-icon" href="/miniProj1/images/icon/favicon.ico">
</head>
<body>

	<div style = "background-color:#69B44D;">
		<h1>배너</h1>
	</div>
		
	<div style = "background-color:#98D7A5;">
		<a href="/miniProj1/jsp/member/LoginForm.jsp">로그인</a>
		<a href="member.do?action=insertForm">회원가입</a>
		
	</div>
	
	<div style = "background-color:#8DC77B;">
		<a href="/miniProj1/index.html">로고</a>
		<a href="/miniProj1/jsp/introduce.jsp">모임 소개</a>
		<a href="/miniProj1/jsp/news.jsp">예술 News</a>
		<a href="/miniProj1/jsp/board/BoardList.jsp">커뮤니티</a>
	</div>
	
	
		<h1>로그인</h1>
		
		
		<form id="rForm" action="member.do" method="post">
		
		<label> 아이디 </label> <input type="text" id="mid" name="mid" required="required"> <br/>
		<label> 비밀번호 </label> <input type="password" id="mpass" name="mpass" required="required"> <br/>
		<div>
		<input type="button" value="로그인" onclick="jsLogin()">
		</div>
		</form>
		
	
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>

<script type="text/javascript">
    
    const rForm = document.getElementById("rForm");
    
/*     rForm.addEventListener("submit", e => {
    	//서버에 form data를 전송하지 않는다 
    	e.preventDefault();
    	
		rimyFetch("member.do", "rForm", json => {
			if(json.status == 0) {
				//성공
				alert("로그인 되었습니다");
				location = "member.do?action=list";
			} else {
				alert(json.statusMessage);
			}
		});
    }); */
    
    
    function jsLogin() {
    	if(confirm("로그인 할래?")){
    	const memberId = document.getElementById("mid").value;
    	const memberPass = document.getElementById("mpass").value;

    	
    	const param = {
    		action:"login",
    		mid: memberId,
    		mpass: memberPass
    		
    	};
    	
    	fetch("member.do", {
    		method: "POST",
            body: JSON.stringify(param),
            headers: {"Content-type": "application/json; charset=utf-8"}
        })
    	.then(res => res.json())
    	.then(json => {
    		if(json. status == 0) {
    			alert("로그인 성공");
    			location.href ="board.do?cmd=list";

    		} else {
    			alert(json.statusMessage);	
    		}
    		
    		
    	});
    		
    		
    	}
    	
    	
    }
    
    </script>
	


</body>
</html>