<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    
    <sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var ="principal" />
</sec:authorize>

<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script src="https://www.googletagmanager.com/gtag/js?id=UA-22022140-4"
	async=""></script>
<script>
window.dataLayer = window.dataLayer || [];
function gtag() {
  dataLayer.push(arguments);
}
gtag('js', new Date());
gtag('config', 'UA-22022140-4');
</script>
<meta charset="utf-8">
<meta name="referrer" content="origin">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="naver-site-verification"
	content="7366738375e320e44bd1c743b364db13086a7b0e">
<link rel="shortcut icon" href="/favicon.ico">
<meta property="fb:app_id" content="258676027581965">
<meta property="og:type" content="website">
<meta property="og:image"
	content="https://everytime.kr/images/og_image.png">
<meta property="og:site_name" content="에브리타임">
<meta property="og:url" content="https://everytime.kr/my">
<title>내 정보 - 에브리타임</title>
<meta data-vue-meta="ssr" name="robots" content="noindex">
<link data-vue-meta="ssr" rel="preload"
	href="/css/6bd0dda348cba948ab66.css" as="style">
<link data-vue-meta="ssr" rel="preload"
	href="/js/2fb5b4c25a90ab94b0ef.js" as="script">
<link data-vue-meta="ssr" rel="preload"
	href="/css/3486d6a4ee769b24932f.css" as="style">
<link data-vue-meta="ssr" rel="preload"
	href="/js/8c0cb36e99d5e0e42550.js" as="script">
<link data-vue-meta="ssr" rel="stylesheet"
	href="/css/9fc4a99517b44451708c.css">
<script data-vue-meta="ssr" src="/js/aadaebd95a82a210c982.js" defer=""></script>
<script data-vue-meta="ssr" src="/js/0c1f1016774d00ecc683.js" defer=""></script>
<script data-vue-meta="ssr" src="/js/81595a16949cc0869630.js" defer=""></script>
<script data-vue-meta="ssr" src="/js/8c827fb390bbd5735893.js" defer=""></script>
<link rel="stylesheet" type="text/css"
	href="/js/../css/3486d6a4ee769b24932f.css">
<script charset="utf-8" src="/js/8c0cb36e99d5e0e42550.js"></script>
<link rel="stylesheet" type="text/css"
	href="/js/../css/6bd0dda348cba948ab66.css">
<script charset="utf-8" src="/js/2fb5b4c25a90ab94b0ef.js"></script>
<script charset="utf-8" src="/js/f2cbbeedee4f20dd6d7d.js"></script>
</head>
<body data-new-gr-c-s-check-loaded="14.1002.0" data-gr-ext-installed=""
	class="vsc-initialized">

	<div data-v-cd48e290="">
		<header data-v-78651b21="" data-v-cd48e290="">
			<div data-v-78651b21="" class="head">
				<div data-v-78651b21="" class="wrap">
					<div data-v-78651b21="" class="logo">
						<a data-v-78651b21="" href="/"><img data-v-78651b21=""
							src="/images/new/nav.logo.png"></a>
						<h1 data-v-78651b21="">
							<p data-v-78651b21="" class="subname">에브리타임</p>
							<p data-v-78651b21="" class="name">${principal.user.university}</p>
						</h1>
					</div>
					<nav data-v-78651b21="">
						<div data-v-78651b21="" class="">
							<a data-v-78651b21="" href="/"> 게시판 </a>
						</div>
						<div data-v-78651b21="" class="">
							<a data-v-78651b21="" href="/timetable"> 시간표 </a>
						</div>
						<div data-v-78651b21="" class="">
							<a data-v-78651b21="" href="/lecture"> 강의평가 </a>
						</div>
						<div data-v-78651b21="" class="">
							<a data-v-78651b21="" href="/calculator"> 학점계산기 </a>
						</div>
						<div data-v-78651b21="" class="">
							<a data-v-78651b21="" href="/friend"> 친구 </a>
						</div>
						<div data-v-78651b21="" class="">
							<a data-v-78651b21="" href="https://bookstore.everytime.kr">
								책방 </a>
						</div>
						<div data-v-78651b21="" class="">
							<a data-v-78651b21="" href="https://www.campuspick.com"> 캠퍼스픽
							</a>
						</div>
					</nav>
					<div data-v-78651b21="" class="account">
						<a data-v-78651b21="" href="/message" title="쪽지함"
							class="icon message"> 쪽지함 </a> <a data-v-78651b21="" href="/my"
							title="내 정보" class="icon my"> 내 정보 </a>
					</div>
				</div>
				<div data-v-78651b21="" class="backdrop"></div>
			</div>
			<div data-v-78651b21="" class="navbar">
				<a data-v-78651b21="" class="hamburger">메뉴 열기</a>
				<h1 data-v-78651b21="">내 정보</h1>
			</div>
		</header>
		<div data-v-cd48e290="" class="container">
	<section data-v-cd48e290="">
		<div data-v-cd48e290="" class="title">
			<h1 data-v-cd48e290="">내 정보</h1>
			<a data-v-cd48e290="" href="/logout" class="logout">로그아웃</a>
		</div>
		<div data-v-cd48e290="" class="profile">
			<img data-v-cd48e290="" src="https://cf-fpi.everytime.kr/0.png">
			<h3 data-v-cd48e290="">${principal.user.nickname}</h3>
			<p data-v-cd48e290="">
				<span data-v-cd48e290="">${principal.user.username}</span> / <span data-v-cd48e290="">${principal.user.nickname}</span>
			</p>
			<p data-v-cd48e290="">
				<span data-v-cd48e290="">${principal.user.university}</span> <span data-v-cd48e290="">${principal.user.entranceYear}</span>학번
			</p>
		</div>
	</section>
			<section data-v-cd48e290="">
				<h2 data-v-cd48e290="">계정</h2>
				<a data-v-cd48e290="" href="/my/university" class="item">학교 인증</a> <a
					data-v-cd48e290="" href="/my/password" class="item">비밀번호 변경</a> <a
					data-v-cd48e290="" href="/my/email" class="item">이메일 변경</a>
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

</body>
</html>