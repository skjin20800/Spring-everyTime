<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../layout/header.jsp"%>
<title>자유 게시판</title>
<%@include file ="../../layout/submenu.jsp" %>

 <div id="container" class="article">
	<input type="hidden" id="isUser" value="1"> <input type="hidden" id="boardId" value="389150">
	<aside class="none">
		<div class="title">
			<a class="hamburger"></a>
			<h1>
				<a href="/389150">자유게시판</a>
			</h1>
		</div>
	</aside>
	<div class="wrap title">
		<h1>
			<a href="/389150">자유게시판</a>
		</h1>
		<hr>
	</div>
	<div class="wrap articles" id="writeBoardContainer">
		<!-- 글쓰기 -->
		<a id="writeArticleButton">새 글을 작성해주세요!</a>
		<article>
			<c:forEach var="board" items="${boards}">
				<a class="article" href="/board/freeDetail/${board.id}">
					<h2 class="medium">${board.title}</h2>
					<p class="small">${board.content}</p> <time class="small">4분 전1</time> 
					<c:choose>
						<c:when test="${board.isAnonymous eq 'false'}">
							<h3 class="small">${board.user.username}</h3>
						</c:when>
						<c:otherwise>
							<h3 class="small">익명</h3>
						</c:otherwise>
					</c:choose>					
					<ul class="status">
					<li title="공감" class="vote" onClick="boardLike(${board.id})">${fn:length(board.likes)}</li>
					<li title="댓글" class="comment">
					<!-- 댓글, 대댓글 갯수 더해서 출력 -->
					<c:set var = "sum" value = "0" />
					<c:set var= "sum" value="${sum + fn:length(board.replys)}"/>
					<c:forEach var="reply" items="${board.replys}">
					<c:set var= "sum" value="${sum + fn:length(reply.rereplys)}"/>
					</c:forEach>
					<c:out value="${sum}"/>
					</li>
					<li title="스크랩" class="scrap">${fn:length(board.scraps)}</li>
				</ul>
					
					<hr> <input type="hidden" name="177388788_comment_anonym" value="0">
				</a>
				<div class="comments"></div>
			</c:forEach>
		</article>

		<div class="clearBothOnly"></div>
		<div class="pagination">
			<form id="searchArticleForm" class="search">
				<select name="search_type"><option value="4">전체</option>
					<option value="3">해시태그</option>
					<option value="2">글 제목</option>
					<option value="1">글 내용</option></select><input name="keyword" placeholder="검색어를 입력하세요." class="text">
			</form>
			<a href="/389150/p/2" class="next">다음</a>
		</div>
	</div>
	<hr>
	
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