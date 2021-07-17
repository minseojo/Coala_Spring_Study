<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Home</title>
		<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
</head>

<script type="text/javascript">
	$(document).ready(function(){
		$("#registerBtn").on("click",function(){
			location.href="member/register";
		})
		
		$("#logoutBtn").on("click", function(){
			location.href="member/logout";
		})
		$("#memberUpdateBtn").on("click",function(){
			location.href="member/memberUpdateView";
		})
		$("#memberDeleteBtn").on("click",function(){
			location.href="member/memberDeleteView";
		})
	})
</script>

<body>
	<div class="container">
		<section id="container">
			<form name='homeForm' method="post" action="/member/login">
				<c:if test="${member == null}">
					<div class="form-group">
						<label class="control-label" for="userId">아이디</label>
						<input class="form-control" type="text" id="userId" name="userId">
					</div>
					<div class="form-group">
						<label class="control-label" for="userPass">패스워드</label>
						<input class="form-control" type="password" id="userPass" name="userPass">
					</div>
					<div class="form-group">
						<button class="btn btn-success" type="submit">로그인</button>
						<button class="btn btn-primary" type="button" id="registerBtn" >회원가입</button>
					</div>
				</c:if>
				<c:if test="${member != null }">
					<div class="form-group">
						<p>${member.userId}님 환영 합니다.</p>
						<button class="btn btn-warning" id="memberUpdateBtn" type="button">회원정보수정</button>
						<button class="btn btn-danger" id="logoutBtn" type="button">로그아웃</button>
						<button class="btn btn-warning" type="button" id="memberDeleteBtn" style="float: right;">회원탈퇴</button>
					</div>
				</c:if>
				<c:if test="${msg == false}">
					<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
				</c:if>
				<p><a href="/board/list">게시판</a></p>
			</form>
		</section>
	</div>
</body>
</html>