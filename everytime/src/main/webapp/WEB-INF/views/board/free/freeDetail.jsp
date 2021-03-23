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
			<!-- 게시글 내용 -->
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
					<li title="공감" class="vote">10</li>
					<li title="댓글" class="comment">3</li>
					<li title="스크랩" class="scrap">0</li>
				</ul>
				</a>
				
				<br/>
			<!-- 게시글 끝 -->
			<!-- 댓글리스트-->
			<div class="comments" style="display: block;">
				<!-- 댓글 반복문 -->
				<c:forEach var="reply" items="${board.replys}">
					<!-- 댓글 or 대댓글 -->
					<!-- 댓글 -->
					<article class="parent" id="reply-${reply.id}">
						<img src="https://cf-fpi.everytime.kr/0.png" class="picture medium">
						<!-- 익명 여부 -->
						<c:choose>
							<c:when test="${reply.isAnonymous eq 'false'}">
								<h3 class="medium">${reply.user.username}</h3>
							</c:when>
							<c:otherwise>
								<h3 class="medium">익명</h3>
							</c:otherwise>
						</c:choose>
						<!-- 댓글 작성자만 삭제가능 -->
						<c:choose>
							<c:when test="${reply.user.id ne principal.user.id}">
								<ul class="status">
									<li class="childcomment" onClick="formReReply(${reply.id})" >대댓글</li>
									<li class="commentvote">공감</li>
									<li class="messagesend" data-modal="messageSend" data-comment-id="841986086" data-is-anonym="1">쪽지</li>
									<li class="abuse">신고</li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul class="status">
									<li class="childcomment" onClick="formReReply(${reply.id})" >대댓글</li>
									<li class="commentvote">공감</li>
									<li class="del"><a onClick="deleteReply(${reply.id})">삭제</a></li>
								</ul>
							</c:otherwise>
						</c:choose>

						<hr>
						<p class="large">${reply.content}</p>
						<time class="medium">시간미정</time>
						<ul class="status commentvotestatus">
							<li class="vote commentvote" style="display: none;">0</li>
						</ul>
								</article>
						
								<!-- 대댓글 -->
					<!-- 대댓글 반복문 -->
					<c:forEach var="rereply" items="${reply.rereplys}">
						<article class="child" id="reply-${rereply.id}">
							<img src="https://cf-fpi.everytime.kr/0.png" class="picture medium">
							<!-- 익명 여부 -->
							<c:choose>
								<c:when test="${rereply.isAnonymous eq 'false'}">
									<h3 class="medium">${rereply.user.username}</h3>
								</c:when>
								<c:otherwise>
									<h3 class="medium">익명</h3>
								</c:otherwise>
							</c:choose>
							<!-- 대댓글 작성자만 삭제가능 -->
							<c:choose>
								<c:when test="${rereply.user.id ne principal.user.id}">
									<ul class="status">
									<li class="commentvote">공감</li>										
										<li class="messagesend" data-modal="messageSend" data-comment-id="841986086" data-is-anonym="1">쪽지</li>
										<li class="abuse">신고</li>
									</ul>
								</c:when>
								<c:otherwise>
									<ul class="status">
										<li class="commentvote">공감</li>
										<li class="del"><a onClick="deleteReReply(${rereply.id})">삭제</a></li>
									</ul>
									<hr>
									<p class="large">${rereply.content}</p>
									<time class="medium">시간 미정</time>
									<ul class="status commentvotestatus">
										<li class="vote commentvote" style="display: none;">0</li>
									</ul>
						</article>
						</c:otherwise>
						</c:choose>
					</c:forEach>			
				</c:forEach>

<!-- 댓글쓰기 -->
				<form class="writecomment">
					<input type="hidden" id="postId" value="${board.id}" />
					<input type="text" id="reply" maxlength="300" placeholder="댓글을 입력하세요." class="text" />
					<ul class="option">
						<li class="anonym "><input type="checkbox" class="form-check-input" id="isAnonymous" name="isAnonymous" /> <label class="form-check-label " for="exampleCheck1"> 익명 </label></li>
						<li title="완료" class="submit" id="replyPost"><p class="center__1">그림</p></li>
					</ul>
					<div class="clearBothOnly"></div>
				</form>
				<!-- 댓글쓰기 끝-->

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
<script src="/js/board.rereply.js" type="text/javascript"></script>
<script>

</script>
</body>
</html>