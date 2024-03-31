
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="icon" type="image/x-icon" href="images/icon/favicon.ico">
</head>
<body>

	<div style="background-color: #69B44D;">
		<h1>배너</h1>
	</div>

	<div style="background-color: #98D7A5;">
		<a href="/miniProj1/jsp/member/MemberInsertForm.jsp">회원가입</a> <a
			href="/miniProj1/jsp/member/MemberList.jsp">회원관리</a> <a
			href="/miniProj1/jsp/member/MemberView.jsp">마이페이지</a> <a
			href="/miniProj1/jsp/member/LoginForm.jsp">로그인</a> <a
			href="/miniProj1/index.html">로그아웃</a>
	</div>

	<div style="background-color: #8DC77B;">
		<a href="/miniProj1/index.html">로고</a> <a
			href="/miniProj1/jsp/introduce.jsp">모임 소개</a> <a
			href="/miniProj1/jsp/news.jsp">예술 News</a> <a
			href="/miniProj1/jsp/board/BoardList.jsp">커뮤니티</a>
	</div>

	<div>
		<h1>게시글 목록</h1>

		<div>
			<form id="searchFrom" action=board.do method="get">
				<input type="hidden" id="cmd" name="cmd" value="list"> <label>제목</label>
				<input type="text" id="searchKey" name="searchKey" value="${param.searchKey}"> <input type="submit" value="검색">
			</form>
		</div>


		<form id="ListForm" name="ListForm" action=board.do method="get">
			<input type="hidden" id="cmd" name="cmd" value="list">
		</form>
		<div>
			<form>
				<table border="1">
					<tr>
						<th>게시물 번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성 날짜</th>	
					</tr>

					<c:forEach var="board" items="${list}">
						<tr onClick="location.href='board.do?cmd=view&bno=${board.bno}'">
							<td>${board.bno}</td>
							<td>${board.btitle}</td>
							<td>${board.bcontent}</td>
							<td>${board.mname}</td>
							<td>${board.bdate}</td>
							
						</tr>
					</c:forEach>

				</table>
			</form>
		</div>
	</div>



	<script>
		function jsView(bno) {
			bno.vlaue = bno;
			ListForm.submit();
		}
	</script>
</body>
</html>