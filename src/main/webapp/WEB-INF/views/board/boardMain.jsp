<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp"%>
<title>메인 페이지</title>
<%@include file="../layout/submenu.jsp"%>
<div id="container" class="community">
	<aside class="none">
		<form class="search">
			<input type="search" name="keyword" class="text"
				placeholder="전체 게시판의 글을 검색하세요!">
		</form>
		<div class="title">
			<a class="hamburger"></a>
			<h1>동의대 에브리타임</h1>
			<ol class="buttons">
				<li><a id="searchArticle">글 검색</a></li>
			</ol>
		</div>
	</aside>

	<div class="leftside">
		
			<c:choose>
				<c:when test="${empty principal}">
				<div class="card pconly">
					<form class="login">
						<h3>
							커뮤니티 이용을 위해<br> <strong>로그인</strong>이 필요합니다!
						</h3>
						<a href="/loginForm" class="button login">로그인</a> <a
							href="/joinForm" class="button register">에브리타임 회원가입</a>
					</form>
					</div>
					
				</c:when>
				<c:otherwise>
<div class="card pconly">
					<form class="logged">
						<img src="https://cf-fpi.everytime.kr/0.png" class="picture">
						<p class="nickname">${principal.user.nickname}</p>
						<p class="school">${principal.user.username}</p>
						<p class="school">${principal.user.university}</p>
						<ul class="buttons">
							<li><a href="/my">내 정보</a></li>
							<li><a href="/logout">로그아웃</a></li>
						</ul>
						<hr>
					</form>
		</div>
		<div class="card">
			<div class="menus">
				<a href="/myboard" class="myarticle">내가 쓴 글</a> <a
					href="/myboard/myreply" class="mycommentarticle">댓글 단 글</a> <a
					href="/myboard/scrap" class="myscrap">내 스크랩</a>
				<hr>
			</div>
		</div>
		</c:otherwise>
		</c:choose>
		
		
	</div>
	<%@include file="../layout/realtimemenu.jsp"%>

	<div class="main">
	
 <c:forEach var="type" items="${types}">
 <c:set var="num" value="1"/>
<div class="card">
			<div class="board">
				<h3>
					<a href="/board/${type.boardType}">${type.boardName }</a>
				</h3>
			<c:forEach var="board" items="${boards}">
			
			<c:if test="${board.type eq type.boardType && num <5}">
					<a class="list" href="/board/freeDetail/${board.id}">
							<time>${board.dateSubstr}</time>
					<p>${board.content}</p>
					<hr></a>
					<c:set var="num" value="${num + 1}"/>
			</c:if>

					</c:forEach>
			</div>
		</div>
		</c:forEach>
	
		<hr>

<%@include file="../layout/footer.jsp"%>
	</div>
</div>

</body>
</html>