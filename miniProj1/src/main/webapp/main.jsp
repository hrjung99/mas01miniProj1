	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예술</title>
<link rel="icon" type="image/x-icon" href="images/icon/favicon.ico">
</head>
<body>

	<div style = "background-color:#69B44D;">
		<h1>배너</h1>
	</div>
	
	<div style = "background-color:#98D7A5;">
		<a href="member.do?action=insertForm">회원가입</a>
		
		<a href="member.do?action=list">회원관리</a> 
		
		<a href="/member.do?acrion=view">마이페이지</a> 
		<a href="/miniProj1/WEB-INF/jsp/member/LoginForm.jsp">로그인</a>
		<a href="/miniProj1/main.jsp">로그아웃</a>
	</div>
	
	<div style = "background-color:#8DC77B;">
		<a href="/miniProj1/index.html">로고</a>
		<a href="/miniProj1/WEB-INF/jsp/introduce.jsp">모임 소개</a>
		<a href="/miniProj1/WEB-INF/jsp/news.jsp">예술 News</a>
		<a href="/miniProj1/WEB-INF/jsp/board/BoardList.jsp">커뮤니티</a>
	</div>
	
	<div>
		<h1>메인 화면</h1>
	</div>
	
	


</body>
</html>