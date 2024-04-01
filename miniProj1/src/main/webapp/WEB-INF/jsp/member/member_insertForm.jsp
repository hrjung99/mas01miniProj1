<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="icon" type="image/x-icon" href="/miniProj1/images/icon/favicon.ico">
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


<!-- Footer 추가 -->
<div class="footer">
    <p>&copy; 2024 예술. 모든 권리 보유.</p>
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