<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../layout/header.jsp"%>
<title>내 스크랩</title>
<%@include file ="../../layout/submenu.jsp" %>

 <div id="container" class="article">
	<input type="hidden" id="isUser" value="1"> <input type="hidden" id="boardId" value="389150">
	<aside class="none">
		<div class="title">
			<a class="hamburger"></a>
			<h1>
				<a href="/389150">내 스크랩</a>
			</h1>
		</div>
	</aside>
	<div class="wrap title" >
		<h1>
			<a href="/389150">내 스크랩</a>
		</h1>
		<hr>
	</div>
	<!-- 스크랩복사 -->

<div id="container" class="article">
  
    <div class="wrap articles">
    <article>
    <c:forEach var="scrap" items="${scraps.content}">
    				<a class="article" href="/boardDetail/${scrap.board.id}">
    <img src="https://cf-fpi.everytime.kr/0.png" class="picture medium">
    <c:choose>
    <c:when test="${scrap.board.isAnonymous eq 'false'}">
    <h3 class="small">${scrap.board.user.username}</h3>
</c:when>
						<c:otherwise>
	<h3 class="medium">익명</h3>
						</c:otherwise>
						</c:choose>
    
    <time class="medium">03/04 16:38</time>
    <hr>
    <h2 class="medium bold">${scrap.board.title}</h2>
    <p class="medium">${scrap.board.content}</p>
    <a href="/389150" class="boardname">&nbsp;&nbsp;&nbsp;&nbsp; from ${scrap.board.typeName}</a>
    <ul class="status">
    <li class="removescrap">스크랩 취소</li>
						<li title="공감" class="vote" onClick="boardLike(${scrap.board.id})">${scrap.board.likeCount}</li>
						<li title="댓글" class="comment">${scrap.board.replyCount}</li>
						<li title="스크랩" class="scrap">${scrap.board.scrapCount}&nbsp;&nbsp;</li>
					</ul>
    <hr>
    <input type="hidden" name="172961707_comment_anonym" value="0"></a>
    <div class="comments"></div>
    </c:forEach>
    </article>
    
    <div class="clearBothOnly">
    
    </div>		<div class="pagination jkb__pagination">
			<c:choose>
				<c:when test="${scraps.first}">
				<a class="prev" disabled='disabled' >처음</a>
				</c:when>
				<c:otherwise>
					<a href="?page=${scraps.number-1}" class="prev">이전</a>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${scraps.last}">
					<a class="next" disabled>끝</a>
				</c:when>
				<c:otherwise>
						<a href="?page=${scraps.number+1}" class="next">다음</a>
				</c:otherwise>
			</c:choose>
		</div>
    </div>
	<!-- 스크랩복사 -->
<%@include file="../../layout/realtimemenu.jsp"%>

<form id="abuseForm" class="modal">
		<a title="닫기" class="close"></a>
		<h3>신고 사유 선택</h3>
		<ul>
			<li><a data-reason="1">게시판 성격에 부적절함</a></li>
			<li><a data-reason="2">욕설/비하</a></li>
			<li><a data-reason="3">음란물/불건전한 만남 및 대화</a></li>
			<li><a data-reason="4">상업적 광고 및 판매</a></li>
			<li><a data-reason="5">유출/사칭/사기</a></li>
			<li><a data-reason="6">낚시/놀람/도배</a></li>
			<li><a data-reason="7">정당/정치인 비하 및 선거운동</a></li>
		</ul>
	</form>
	<form id="manageMoimForm" class="modal">
		<a title="닫기" class="close"></a>
		<h3>게시판 설정</h3>
		<p>
			<label>소개</label> <input type="text" name="info" class="text">
		</p>
		<p class="hide">
			<label>인기 글 금지</label> <input type="checkbox" id="manageMoimForm_is_not_selected_hot_article" name="is_not_selected_hot_article"><label for="manageMoimForm_is_not_selected_hot_article"
				class="checkbox">글이 공감을 받아도 인기 글 및 HOT 게시물에 선정되지 않음</label>
		</p>
		<input type="button" value="게시판 양도" class="button light floatLeft"> <input type="button" value="게시판 삭제" class="button light floatLeft"> <input type="submit" value="수정" class="button">
	</form>
	<form id="transferMoimForm" class="modal">
		<a title="닫기" class="close"></a>
		<h3>게시판 양도</h3>
		<p>
			<label>양도인 비밀번호</label> <input type="password" name="transferer_password" class="text">
		</p>
		<p>
			<label>피양도인 아이디</label> <input type="text" name="transferee_userid" class="text">
		</p>
		<input type="submit" value="양도 요청" class="button">
	</form>
	<form id="attachThumbnailForm" class="modal">
		<a title="닫기" class="close"></a>
		<h3>첨부된 이미지</h3>
		<p>
			<label>설명 추가</label>
			<textarea name="caption" class="text" placeholder="이 이미지에 대한 설명을 입력하세요."></textarea>
		</p>
		<input type="button" value="첨부 삭제" class="button light floatLeft"> <input type="submit" value="설명 저장" class="button">
	</form>
	<form id="messageSend" class="modal">
		<a title="닫기" class="close"></a>
		<h3>쪽지 보내기</h3>
		<p>
			<textarea name="message" class="text" placeholder="내용을 입력해주세요."></textarea>
		</p>
		<input type="submit" value="전송" class="button">
	</form>
</div>
<%@include file ="../../layout/footer.jsp" %>
</body>
<script src="/js/board.post.js" type="text/javascript"></script>
<script src="/js/board.likes.js" type="text/javascript"></script>
</html>