<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="icon" type="image/x-icon" href="/miniProj1/images/icon/favicon.ico">
</head>
<body>

	<div style="background-color: #69B44D;">
		<h1>배너</h1>
	</div>

	<div style="background-color: #98D7A5;">
		<a href="MemberInsertForm.jsp">회원가입</a> <a href="MemberList.jsp">회원관리</a>
		<a href="MemberView.jsp">마이페이지</a> <a href="LoginForm.jsp">로그인</a> <a
			href="/miniProj1/index.html">로그아웃</a> 
	</div>

	<div style="background-color: #8DC77B;">
		<a href="/miniProj1/index.html">로고</a> <a
			href="/miniProj1/jsp/introduce.jsp">모임 소개</a> <a
			href="/miniProj1/jsp/news.jsp">예술 News</a> <a
			href="/miniProj1/jsp/board/BoardList.jsp">커뮤니티</a>
	</div>

	<div>
		<h1>회원 목록</h1>
		<div>
			<label>제목</label> <input type="text" id="searchKey" name="searchKey">
			<button>검색</button>
		</div>

		<div>
			<button>글쓰기</button>
			<table border="1">
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
					<th>취미</th>
				</tr>
				
				<tr onclick="location.href='MemberView.jsp'">
					<td>csk</td>
					<td>최삼규</td>
					<td>20</td>
					<td>남성</td>
					<td>운동</td>
				</tr>
			</table>

		</div>
	</div>
</body> 
</html>