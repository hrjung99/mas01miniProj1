
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="icon" type="image/x-icon" href="images/icon/favicon.ico">
<style>
    /* 메인 네비게이션 스타일 */
    .main-nav a {
        display: inline-block;
        padding: 8px 16px;
        margin: 4px 0;
        border: 2px solid #69B44D;
        background-color: #98D7A5;
        color: white;
        text-decoration: none;
        font-size: 16px;
        border-radius: 20px;
        transition: background-color 0.3s, color 0.3s;
    }

    .main-nav a:hover {
        background-color: #69B44D;
        color: white;
    }

    .main-nav {
        padding: 10px 0;
        background-color: #8DC77B;
        text-align: left;
    }

    .user-nav {
        background-color: #8DC77B;
        padding: 10px;
        text-align: right;
    }

    .user-nav a {
        margin: 0 5px;
        color: white;
        text-decoration: none;
    }

    .content {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        align-items: flex-start;
    }

    .content img {
        margin: 10px;
        flex-grow: 1;
        object-fit: cover;
    }

    /* 새로운 이미지 크기 조합 */
    .img1 { width: 200px; height: 300px; }
    .img2 { width: 310px; height: 220px; }
    .img3 { width: 270px; height: 270px; }
    .img4 { width: 220px; height: 210px; }

    /* 푸터 스타일 */
    .footer {
        padding: 20px;
        background-color: #69B44D;
        color: white;
        text-align: left; /* 수정됨 */
        font-size: 16px;
        border-top: 3px solid #98D7A5;
    }
</style>
</head>
<body>

<div class="banner">
    <h1>배너</h1>
</div>

<div class="user-nav">
    <a href="member.do?action=insertForm">회원가입</a>
    <a href="member.do?action=list">회원관리</a>
    <a href="member.do?action=view">마이페이지</a>
    <a href="member.do?action=loginForm">로그인</a>
    <a href="/miniProj1/main.jsp">로그아웃</a>
</div>

<div class="container">
    <nav class="main-nav">
        <a href="/miniProj1/main.jsp">로고</a>
        <a href="board.do?cmd=introduce">모임 소개</a>
        <a href="board.do?cmd=news">예술 News</a>
        <a href="board.do?cmd=list">커뮤니티</a>
    </nav>
</div>

	<div>
		<h1>게시글 목록</h1>

		<div>

			<form id="searchFrom" action=board.do method="get">
				<input type="hidden" id="cmd" name="cmd" value="list"> 
				<label>제목</label> <input type="text" id="searchKey" name="searchKey" value="${param.searchKey}"> 
				<input type="submit" value="검색">
			</form>
			
		<form action="board.do" method="get">
			<input type="hidden" id="cmd" name="cmd" value="insertForm">
			<input type="submit" value="글쓰기" >
		</form>		
		</div>

		
		<form id="ListForm" name="ListForm" action=board.do method="get">
			<input type="hidden" id="cmd" name="cmd" value="list">
		</form>
		<div>
			<form>
				<table border="1", style = "background-color:#D3EDCA;">
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


<!-- Footer 추가 -->
<div class="footer">
    <p>&copy; 2024 예술. 모든 권리 보유.</p>
</div>
	<script>
		function jsView(bno) {
			bno.vlaue = bno;
			ListForm.submit();
		}
	</script>
</body>
</html>