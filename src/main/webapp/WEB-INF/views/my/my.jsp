<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<div data-v-cd48e290="" class="container">
			<section data-v-cd48e290="">
				<div data-v-cd48e290="" class="title">
					<h1 data-v-cd48e290="">내 정보</h1>
					<a data-v-cd48e290="" href="/user/logout" class="logout">로그아웃</a>
				</div>
				<div data-v-cd48e290="" class="profile">
					<img data-v-cd48e290="" src="https://cf-fpi.everytime.kr/0.png">
					<h3 data-v-cd48e290="">${principal.user.nickname}</h3>
					<p data-v-cd48e290="">
						<span data-v-cd48e290="">${principal.user.username}</span> / <span data-v-cd48e290="">${principal.user.username}</span>
					</p>
					<p data-v-cd48e290="">
						<span data-v-cd48e290="">${principal.user.university}</span> <span data-v-cd48e290="">${principal.user.entranceYear}</span>학번
					</p>
				</div>
			</section>
			<section data-v-cd48e290="">
				<h2 data-v-cd48e290="">계정</h2>
				<a data-v-cd48e290="" href="my/universityUpdate" class="item">학교 변경</a> <a
					data-v-cd48e290="" href="/my/passwordUpdate" class="item">비밀번호 변경</a> <a
					data-v-cd48e290="" href="/my/emailUpdate" class="item">이메일 변경</a>
			</section>
			<section data-v-cd48e290="">
				<h2 data-v-cd48e290="">커뮤니티</h2>
				<a data-v-cd48e290="" href="/my/nickname" class="item">닉네임 설정</a> <a
					data-v-cd48e290="" href="/my/banlist" class="item">이용 제한 내역</a> <a
					data-v-cd48e290="" href="/my/boardlist" class="item">게시판 관리</a> <a
					data-v-cd48e290="" href="/page/rules" class="item">커뮤니티 이용규칙</a>
			</section>
			<section data-v-cd48e290="">
				<h2 data-v-cd48e290="">이용 안내</h2>
				<a data-v-cd48e290="" href="/page/faq" class="item">문의하기</a> <a
					data-v-cd48e290="" href="/notice" class="item">공지사항</a> <a
					data-v-cd48e290="" href="/page/serviceagreement" class="item">서비스
					이용약관</a> <a data-v-cd48e290="" href="/page/privacy" class="item">개인정보
					처리방침</a>
			</section>
			<section data-v-cd48e290="">
				<h2 data-v-cd48e290="">기타</h2>
				<a data-v-cd48e290="" href="/my/adagreement" class="item">정보 동의
					설정</a> <a data-v-cd48e290="" href="/my/withdrawal" class="item">회원
					탈퇴</a>
			</section>
		</div>
		<footer data-v-20651ef4="" data-v-cd48e290="">
			<a data-v-20651ef4="" href="/page/serviceagreement"> 이용약관 </a> <a
				data-v-20651ef4="" href="/page/privacy"> 개인정보처리방침 </a> <a
				data-v-20651ef4="" href="/page/rules"> 커뮤니티이용규칙 </a> <a
				data-v-20651ef4="" href="/page/faq"> 문의하기 </a> <a data-v-20651ef4=""
				href="/" class="copyright"> © 에브리타임 </a>
		</footer>
	</div>
	<script id="__INITIAL_STATE__" type="application/json">{"apiServerUrl":"https://api.everytime.kr","appInfo":{"appName":"","appVersion":"","osName":"","osVersion":""},"campusData":{"schoolId":151,"campusId":183,"communityName":"동의대"},"isLogged":true,"pageName":"pages/my/index","pageTitle":"내 정보","requestUser":{"campusName":"동의대","enterYear":2015,"name":"김현직","nickname":"lonru","picture":"https://cf-fpi.everytime.kr/0.png","userid":"lonru"}}</script>


</body>
</html>