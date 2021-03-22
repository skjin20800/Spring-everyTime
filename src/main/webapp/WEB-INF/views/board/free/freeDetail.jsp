<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../layout/header.jsp"%>
<%@include file="../../layout/submenu.jsp"%>
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
	<div class="wrap articles">
		<a id="writeArticleButton" style="display: none;">새 글을 작성해주세요!</a>
		<article>
			<a class="article"> <img src="https://cf-fpi.everytime.kr/0.png" class="picture large">
				<div class="profile__kb">
					<c:choose>
						<c:when test="${board.isAnonymous eq 'false'}">
							<h3 class="small">${board.user.username}</h3>
						</c:when>
						<c:otherwise>
							<h3 class="small">익명</h3>
						</c:otherwise>
					</c:choose>
					<time class="large">${date}</time>
				</div>
				<ul class="status">
					<li class="messagesend" data-modal="messageSend" data-article-id="177166298" data-is-anonym="1">쪽지</li>
					<li class="abuse">신고</li>
				</ul>
				<hr>
				<h2 class="large">${board.title}</h2>
				<p class="large">${board.content}</p>
				<ul class="status">
					<li title="공감" class="vote">0</li>
					<li title="댓글" class="comment">3</li>
					<li title="스크랩" class="scrap">0</li>
				</ul>
				<hr> <input type="hidden" name="177166298_comment_anonym" value="0"></a>
			<div class="comments" style="display: block;">
				<c:forEach var="reply" items="${board.replys}">
					<c:choose>
						<c:when test="${empty reply.fromReply}">
							<article class="parent">
								<img src="https://cf-fpi.everytime.kr/0.png" class="picture medium">
								<c:choose>
									<c:when test="${reply.isAnonymous eq 'false'}">
										<h3 class="medium">${reply.user.username}</h3>
									</c:when>
									<c:otherwise>
										<h3 class="medium">익명</h3>
									</c:otherwise>
								</c:choose>
								<ul class="status">
									<li class="childcomment">대댓글</li>
									<li class="commentvote">공감</li>
									<li class="messagesend" data-modal="messageSend" data-comment-id="841986086" data-is-anonym="1">쪽지</li>
									<li class="abuse">신고</li>
								</ul>
								<hr>
								<p class="large">${reply.content}</p>
								<time class="medium">${date}</time>
								<ul class="status commentvotestatus">
									<li class="vote commentvote" style="display: none;">0</li>
								</ul>
							</article>
						</c:when>
						<c:otherwise>

							<article class="child">
								<img src="https://cf-fpi.everytime.kr/0.png" class="picture medium">
								<h3 class="medium writer">익명(글쓴이)</h3>
								<ul class="status">
									<li class="commentvote">공감</li>
									<li class="messagesend" data-modal="messageSend" data-comment-id="841986687" data-is-anonym="1">쪽지</li>
									<li class="abuse">신고</li>
								</ul>
								<hr>
								<p class="large">네.</p>
								<time class="medium">방금</time>
								<ul class="status commentvotestatus">
									<li class="vote commentvote" style="display: none;">0</li>
								</ul>
							</article>

						</c:otherwise>
					</c:choose>

				</c:forEach>

				<form class="writecomment">
					<input type="hidden" id="postId" value="${board.id}" /> <input type="text" id="reply" maxlength="300" placeholder="댓글을 입력하세요." class="text" />
					<ul class="option">
						<li class="anonym "><input type="checkbox" class="form-check-input" id="isAnonymous" name="isAnonymous" /> <label class="form-check-label " for="exampleCheck1"> 익명 </label></li>
						<li title="완료" class="submit" id="replyPost"><p class="center__1">그림</p></li>
					</ul>
					<div class="clearBothOnly"></div>
				</form>

			</div>
		</article>
		<div class="clearBothOnly"></div>
		<div class="pagination">
			<a id="goListButton" class="list">글 목록</a>
		</div>
	</div>
	<hr>

	<%@include file="../../layout/realtimemenu.jsp"%>
</div>
<%@include file="../../layout/footer.jsp"%>
<script src="/js/board.reply.js" type="text/javascript"></script>

</body>
</html>