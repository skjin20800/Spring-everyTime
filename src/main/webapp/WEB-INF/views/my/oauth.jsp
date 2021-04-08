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
<title>Oauth 사용자 인증</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<c:choose>
	<c:when test="${principal.user.userRole!='OAUTH'}">
		<script>
	location.href="/";
</script>
	</c:when>
</c:choose>
<body>
	<h1>Oauth 사용자 정보변경 페이지</h1>

	<hr />
	<form id="oauthUpdateForm">
		<input type="hidden" id="username" value="${principal.user.username}">
		<input type="text" placeholder="별명을 입력해주세요" id="nickname" /> <br />
		<input type="text" placeholder="대학교을 입력해주세요" id="university" /> <br />
		<input type="text" placeholder="학번을 입력해주세요" id="entranceYear" /> <br />
		<button id="oauthPut" class="submit">추가 정보 입력</button>
	</form>
	<script src="/js/my.js" type="text/javascript"></script>

</body>
</html>