<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="board" items="${boards}">
				 
					<c:choose>
						<c:when test="${board.isAnonymous eq 'false'}">
							<article class="parent">
					<img src="https://cf-fpi.everytime.kr/0.png" class="picture medium">
					<h3 class="medium">익명1</h3>
					<ul class="status">
						<li class="childcomment">대댓글</li>
						<li class="commentvote">공감</li>
						<li class="messagesend" data-modal="messageSend" data-comment-id="841986086" data-is-anonym="1">쪽지</li>
						<li class="abuse">신고</li>
					</ul>
					<hr>
					<p class="large">그 방탄 뷔 말씀하시는겁니까..</p>
					<time class="medium">2분 전</time>
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














</body>
</html>