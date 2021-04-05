<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/login/loginStyle.css">
<title>회원가입 페이지</title>
</head>

<body>
	<c:choose>
		<c:when test="${!empty principal}">
			<script>
	location.href="/";
</script>
		</c:when>
	</c:choose>
	<div id="container" class="join"  style=" top: 310px !important;">
		<a href="#"><img src="/images/login/login.logo.png"></a>
		<form action="/join" method="post">
			<p class="input">
				<input type ="text" placeholder="아이디를 입력해주세요" name = "username" class="text"/>
			</p>
			<p class="input">
				<input type = "password" placeholder="패스워드를 입력해주세요" name ="password" class="text"/> 
			</p>
				<p class="input">
				<input type ="text" placeholder="별명을 입력해주세요" name = "nickname" class="text"/>
			</p>
				<p class="input">
				<input type = "email" placeholder="Email을 입력해주세요" name ="email" class="text"/>
			</p>
				<p class="input">
				<input type ="text" placeholder="대학교을 입력해주세요" name = "university" class="text"/> 
			</p>
				<p class="input">
				<input type ="text" placeholder="학번을 입력해주세요" name = "entranceYear" class="text"/>
			</p>
			<input type="hidden" name="redirect" value="/">
			<p class="submit">
				<input type="submit" value="회원가입" class="text">
			</p>
			<p class="register">
				<span>이미 회원가입 하셨나요?</span> 
				<a href="/loginForm">로그인</a>
			</p>
		</form>
	</div>
	

	<address>
		<ul class="links">
			<li><a href="/page/serviceagreement">이용약관</a></li>
			<li><a href="/page/privacy">개인정보처리방침</a></li>
			<li><a href="/page/faq">문의하기</a></li>
			<li class="copyright"><a href="/">© 에브리타임</a></li>
		</ul>
	</address>


</body>
</html>