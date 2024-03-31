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
		
		<form id="iForm" name="iForm" action="member.do" method="get">
			<label>아이디<input type="text" id="mid" name="mid" required="required"></label><br/>
			<label>비밀번호<input type="password" id="mpass" name="mpass" required="required"></label><br/>
			<label>비밀번호 확인<input type="password" id="mpass2" name="mpass2" required="required"></label><br/>
			<label>이름<input type="text" id="mname" name="mname" required="required"></label><br/>
			<label>나이<input type="text" id="mage" name="mage" required="required"></label><br/>
			<label>주소<input type="text" id="madd" name="madd"></label><br/>
			<label>전화번호<input type="text" id="mpno" name="mpno"></label><br/>
			

			<label>성별</label>
			<label><input  type="radio" name="mgender" value="남성"> 남성</label>
      		<label><input  type="radio" name="mgender" value="여성"> 여성</label><br/>

      		<input type ="button" value="가입" onclick="jsInsert()" >
      		
	</form>	

	<button onclick = "location.href='/miniProj1/main.jsp'">취소</button>
		
	</div>
	
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<script type="text/javascript">

	function getSelectedGender() {
    	var gender = document.querySelector('input[name="mgender"]:checked').value;
    	return gender;
	}

    
	function jsInsert(){
		
		const memberId = document.getElementById("mid").value;
		const memberPass = document.getElementById("mpass").value;
		const memberName = document.getElementById("mname").value;
		const memberAge = document.getElementById("mage").value;
		const memberAdd = document.getElementById("madd").value;		
		const memberPno = document.getElementById("mpno").value;
		
    	console.log("iForm")
			if (confirm("가입 하시겠습니까?")){
				const param = {
						action:"insert",
						mid: memberId,
						mpass: memberPass,
						mname: memberName,
						mage: memberAge,
						madd: memberAdd,
						mpno: memberPno,
						mgender: getSelectedGender()
				};
				
				fetch("member.do",{
					method: "POST",
					body: JSON.stringify(param),
					headers : {"Content-type": "application/json; charset=utf-8"}
				})
				.then(res => res.json())
				.then(json => {
					if(json.status == 0) {
						alert("가입이 완료되었습니다.");
						location.href ="/miniProj/main.jsp";
					} else {
						alert(json.statusMessage);	
					}	
				});
			}
		}
	
	

</script>

	
	</body>
</html>