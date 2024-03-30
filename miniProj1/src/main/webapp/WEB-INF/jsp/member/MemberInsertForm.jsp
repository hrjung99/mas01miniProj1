<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="icon" type="image/x-icon" href="/miniProj1/images/icon/favicon.ico">
</head>
<body>

	<div style = "background-color:#69B44D;">
		<h1>배너</h1>
	</div>
	
	<div style = "background-color:#98D7A5;">
		<a href="MemberInsertForm.jsp">회원가입</a>
		<a href="MemberList.jsp">회원관리</a> 
		<a href="MemberView.jsp">마이페이지</a> 
		<a href="LoginForm.jsp">로그인</a>
		<a href="/miniProj1/index.html">로그아웃</a>
	</div>
	
	<div style = "background-color:#8DC77B;">
		<a href="/miniProj1/index.html">로고</a> 
		<a href="/miniProj1/jsp/introduce.jsp">모임 소개</a>
		<a href="/miniProj1/jsp/news.jsp">예술 News</a>
		<a href="/miniProj1/jsp/board/BoardList.jsp">커뮤니티</a>
	</div>
	
	<div>
		<h1>회원 가입</h1>
		
		<label>아이디<input type="text" id="mid" name="mid" required="required"></label><br/>
		<label>비밀번호<input type="password" id="mpass" name="mpass" required="required"></label><br/>
		<label>비밀번호 확인<input type="text" id="mpass2" name="mpass2" required="required"></label><br/>
		<label>이름<input type="text" id="mname" name="mname" required="required"></label><br/>
		<label>나이<input type="text" id="mage" name="mage" required="required"></label><br/>
		<label>주소<input type="text" id="madd" name="madd"></label><br/>
		<label>전화번호<input type="text" id="madd" name="madd"></label><br/>
		<label>성별 </label>
		<input type="radio" id="male" name="male" value="male">
		<label for="male">남성</label>
		<input type="radio" id="female" name="female" value="female">
		<label for="female">여성</label><br/>
		<label>취미</label>	
		<input type="checkbox" id="hobby1" name="hobby1" value="book">
		<label for ="book">독서</label>
		<input type="checkbox" id="hobby2" name="hobby2" value="game">
		<label for = "game">게임</label>
		<input type="checkbox" id="hobby3" name="hobby3" value="excercise">
		<label for ="excercise">운동</label><br/>
	</div>
	
	<div>
	<a href="/miniProj1/jsp/member/MemberList.jsp">가입</a>
	<a href="/miniProj1/jsp/member/MemberView.jsp">취소</a>
	</div>
	
	</body>
</html>