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
	</div>
	
	<div style = "background-color:#8DC77B;">
		<a href="/miniProj1/index.html">로고</a>
		<a href="/miniProj1/jsp/introduce.jsp">모임 소개</a>
		<a href="/miniProj1/jsp/news.jsp">예술 News</a>
		<a href="/miniProj1/jsp/board/BoardList.jsp">커뮤니티</a>
	</div>
	
	<div>
		<h1>로그인</h1>
		
		<div>
		<lable> 아이디 	</lable> <input type="text" id="mid" name="mid" required="required"> <br/>
		<lable> 비밀번호 	</lable> <input type="password" id="mpass" name="mpass" required="required"> <br/>
		</div>
		
		<a href="jsp/member/MemberInsertForm.jsp">회원가입</a>
		<a href="/miniProj1/index.html">로그인</a>
	</div>
	
	


</body>
</html>