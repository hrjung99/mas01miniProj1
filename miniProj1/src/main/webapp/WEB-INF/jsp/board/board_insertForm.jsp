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
		<h1>게시물 등록</h1>
		
		<form id="iForm" name="iForm" action="board.do" method="get">
			<label>제목<input type="text" id="btitle" name="btitle" required="required"></label><br/>
			<label>내용<textarea id="bcontent" name="bcontent" required="required"></textarea></label><br/>
			<label>아이디<input type="text" id="mid" name="mid" required="required"></label><br/>
      		<input type ="button" value="등록" onclick="jsInsert()" >
			<button onclick = "location.href='board.do?cmd=list'">취소</button>		
	</form>	

		
	</div>
	
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<script type="text/javascript">


    
	function jsInsert(){
		
		const boardTitle = document.getElementById("btitle").value;
		const boardContent = document.getElementById("bcontent").value;
		const memberId = document.getElementById("mid").value;

		
    	console.log("iForm")
			if (confirm("등록 하시겠습니까?")){
				const param = {
						cmd:"insert",
						btitle: boardTitle,
						bcontent: boardContent,
						mid: memberId

				};
				
				fetch("board.do",{
					method: "POST",
					body: JSON.stringify(param),
					headers : {"Content-type": "application/json; charset=utf-8"}
				})
				.then(res => res.json())
				.then(json => {
					if(json.status == 0) {
						alert("등록이 완료되었습니다.");
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