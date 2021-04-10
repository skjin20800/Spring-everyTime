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
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>로그인 페이지</title>
</head>

<body cz-shortcut-listen="true" style>
	<c:choose>
		<c:when test="${!empty principal}">
			<script>
	location.href="/";
</script>
		</c:when>
	</c:choose>

	<div id="container" class="login">
		<a href="#"><img src="/images/login/login.logo.png"></a>
		<form action="/login" method="post">
			<p class="input">
				<input type="text" name="username" maxlength="20" class="text"
					placeholder="아이디">
			</p>
			<p class="input">
				<input type="password" name="password" maxlength="20" class="text"
					placeholder="비밀번호">
			</p>
			<input type="hidden" name="redirect" value="/">
			<p class="submit">
				<input type="submit" value="로그인" class="text">
			</p>
						<p class="register">
				<span>에브리타임에 처음이신가요?</span> 
				<a href="/joinForm">회원가입</a>
			</p>
			<p class="register">
				<span>페이스북 아이디가 있으신가요?</span>
				<a href="/oauth2/authorization/facebook">페이스북 로그인</a>
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

	<script type="text/javascript">
      var _serverTime = 1615362600494;
      var _clientTime = new Date().getTime();
      var _diffTime = _clientTime - _serverTime;
      var _apiServerUrl = 'https://api.everytime.kr';
    </script>
	<script async=""
		src="https://www.googletagmanager.com/gtag/js?id=UA-22022140-4"></script>
	<script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'UA-22022140-4');
    </script>

</body>
</html>