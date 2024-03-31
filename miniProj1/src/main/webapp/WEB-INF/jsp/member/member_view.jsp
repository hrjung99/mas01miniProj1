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

	<div style = "background-color:#69B44D;">
		<h1>배너</h1>
	</div>
	
	<div style = "background-color:#98D7A5;">
		<a href="MemberInsertForm.jsp">회원가입</a>
		<a href="member.do?action=list">회원관리</a> 
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
		<h1>마이페이지</h1>
		
		<label>아이디 : ${member.mid}</label><br/>
		<label>비밀번호 : ${member.mpass}</label><br/>
		<label>이름 : ${member.mname}</label><br/>
		<label>나이 : ${member.mage}</label><br/>
		<label>주소 : ${member.madd}</label><br/>
		<label>전화번호 : ${member.mpno}</label><br/>
		<label>성별 : ${member.mgender}</label><br/>
		<!-- 
		여기서 member는 컨트롤러에서
		request.setAttribute("member", memberService.view(member));
		했을때의 "member"
		-->

		
	</div>
	
	<form id="viewForm" name="viewForm" action="member.do" method="get">
		<input type="hidden" id="action" name = "action" value="">
		<input type = "hidden" id="mid" value = "${member.mid}">
		<input type="button" value="수정" onclick="jsUpdate()" >	
		<input type ="button" value="탈퇴" onclick="jsDelete()" >
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
	
	const memberId = "${member.mid}";
	console.log("ddd ", memberId)

	function jsDelete(){
	    if(confirm("정말로 탈퇴하시겠습니까?")){
	        const param = {
	            action: "delete",
	            mid: memberId
	        };
	        fetch("member.do", {
	            method: "POST",
	            body: JSON.stringify(param),
	            headers: {"Content-type": "application/json; charset=utf-8"}
	        })
	        .then(res => res.json())
	        .then(json => {
	            if(json.status == 0) {
	                alert("탈퇴 되었습니다.");
	                location = "member.do?action=list";
	            } else {
	                alert(json.statusMessage);
	            }
	        });
	    }
	}

	
	
	
	
	function jsUpdate(){
		
		
	}
	
	</script>
		
	</body>
</html>