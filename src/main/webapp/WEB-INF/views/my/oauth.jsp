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
<title>Oauth 사용자 인증</title>

<c:choose>
	<c:when test="${principal.user.userRole!='OAUTH'}">
		<script>
	location.href="/";
</script>
	</c:when>
</c:choose>
<body>

	<hr />
	<div id="container" class="join"  style=" top: 310px !important;">
		<a href="#"><img src="/images/login/login.logo.png"></a>

	<form id="oauthUpdateForm">
		<input type="hidden" id="username" value="${principal.user.username}">
		<p class="input">
				<input type ="text" placeholder="별명을 입력해주세요" id = "nickname" class="text"/>
			</p>
				<p class="input">
				<input type ="text" placeholder="대학교을 입력해주세요" id = "university" class="text"/> 
			</p>
				<p class="input">
				<input type ="text" placeholder="학번을 입력해주세요" id = "entranceYear" class="text"/>
			</p>
		<p class="submit">
				<input id="oauthPut" type="button" value="추가 정보 입력" class="text">
				</p>
	</form>
	</div>
	<script src="/js/my.js" type="text/javascript"></script>
</body>
</html>