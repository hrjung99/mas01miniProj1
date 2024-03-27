<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="icon" type="image/x-icon" href="/miniProj1/images/icon/favicon.ico">
</head>
<body>

 <%@ include file="" %>
	
	<div>
		<h1>마이페이지</h1>
		
		<label>아이디<input hidden="hidden" type="text" id="mid" name="mid" disabled></label><br/>
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
	<a href ="/miniProj1/jsp/member/MemberView.jsp">수정</a>
	<a href="/miniProj1/jsp/member/MemberView.jsp">취소</a>
	</div>
		
		  
	</div>
	</body>
</html>