<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세</title>
<link rel="icon" type="image/x-icon" href="/miniProj1/images/icon/favicon.ico">
</head>
<body>

	<div style = "background-color:#69B44D;">
		<h1>배너</h1>
	</div>
	
	<div style = "background-color:#98D7A5;">
		<a href="member.do?action=insert">회원가입</a>
		<a href="member.do?action=list">회원관리</a> 
		<a href="MemberView.jsp">마이페이지</a> 
		<a href="LoginForm.jsp">로그인</a>
		<a href="/miniProj1/index.html">로그아웃</a>
	</div>
	
	<div style = "background-color:#8DC77B;">
		<a href="/miniProj1/index.html">로고</a>
		<a href="/miniProj1/jsp/introduce.jsp">모임 소개</a>
		<a href="/miniProj1/jsp/news.jsp">예술 News</a>
		<a href="board.do?cmd=list">커뮤니티</a>
	</div>
	
	<div>
		<h1>게시물 상세 보기</h1>


		
	</div>

	
	<form id="viewForm" name="viewForm" action="board.do" method="get">
		<input type="hidden" id="cmd" name = "cmd" value="">
		<label>게시물 번호<input type = "text" id="bno" value ="${board.bno}" readonly="readonly" ></label><br/>
		<label>제목<input type="text" id="btitle" name="btitle" value="${board.btitle}"></label><br/>
		<label>내용<textarea id="bcontent" name="bcontent">${board.bcontent}</textarea></label><br/>
		<label>작성자<input type="text" id="bwriter" name="bwriter" value="${board.mname}"></label><br/>
		<input type="button" value="수정" onclick = "jsUpdate()">
		<input type ="button" value="삭제" onclick="jsDelete()" >
	</form>
	
	

<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
 <script>	
/* 	function jsDelete(){	
		//json(데이터 타임) 사용
		if(confirm("정말로 탈퇴하시겠습니까?"))
		action.value = "delete";
		rimyFetch("member.do", "delete", json =>{
			if(json.status==0) {//성공
				alert("탈퇴 되었습니다.");
				location = "member.do?action=list";
			} else {
				alert(json.statusMessage);
			}
		});
	} */
	
	const boardNumber = "${board.bno}";
	console.log("bno= ", boardNumber)

	function jsDelete(){
		const boardNumber = "${board.bno}";

	    if(confirm("정말로 삭제하시겠습니까?")){
	        const param = {
	            cmd: "delete",
	            bno: boardNumber
	        };
	        
	        fetch("board.do", {
	            method: "POST",
	            body: JSON.stringify(param),
	            headers: {"Content-type": "application/json; charset=utf-8"}
	        })
	        
	        .then(res => res.json())
	        .then(json => {
	            if(json.status == 0) {
	                alert("삭제 되었습니다.");
	                location = "board.do?cmd=list";
	            } else {
	                alert(json.statusMessage);
	            }
	        });
	    }
	}
	
	
	
/* 	function getSelectedGender() {
    	var gender = document.querySelector('input[name="mgender"]:checked').value;
    	return gender; 
	}*/
	
function jsUpdate(){
		
		const boardNumber = document.getElementById("bno").value;
		const boardTitle = document.getElementById("btitle").value;
		const boardContent = document.getElementById("bcontent").value;
		const boardWriter = document.getElementById("bwriter").value;
		
    	console.log("viewForm");
    	
			if (confirm("수정 하시겠습니까?")){
				const param = {
						cmd:"update",
						bno: boardNumber,
						btitle: boardTitle,
						bcontent: boardContent
				};
				
				fetch("board.do",{
					method: "POST",
					body: JSON.stringify(param),
					headers : {"Content-type": "application/json; charset=utf-8"}
				})
				.then(res => res.json())
				.then(json => {
					if(json.status == 0) {
						alert("수정이 완료되었습니다.");
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