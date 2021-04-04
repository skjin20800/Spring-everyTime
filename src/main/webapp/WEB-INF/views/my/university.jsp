<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
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
<meta property="og:url" content="https://everytime.kr/my/email">
<title>학교 변경 - 에브리타임</title>
<meta data-vue-meta="ssr" name="robots" content="noindex">
<link data-vue-meta="ssr" rel="preload"
	href="/css/6bd0dda348cba948ab66.css" as="style">
<script charset="utf-8" src="/js/1cb527347bd77aafc8d6.js"></script>
<link rel="stylesheet" type="text/css"
	href="/js/../css/6bd0dda348cba948ab66.css">
<script charset="utf-8" src="/js/2fb5b4c25a90ab94b0ef.js"></script>
<script charset="utf-8" src="/js/f2cbbeedee4f20dd6d7d.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body data-new-gr-c-s-check-loaded="14.1002.0" data-gr-ext-installed=""
	class="vsc-initialized" style="padding: 100px">

	<div data-v-bdf4e790="">
		<header data-v-78651b21="" data-v-bdf4e790="">
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
				<h1 data-v-78651b21="">이메일 변경</h1>
			</div>
		</header>
		<form id ="universityUpdateForm"data-v-bdf4e790="" class="container" >
			<section data-v-bdf4e790="">
				<h1 data-v-bdf4e790="">학교 변경</h1>
				<div data-v-bdf4e790="" class="input">
					<div data-v-bdf4e790="" class="label">
						<label data-v-bdf4e790="">학교</label>
					</div>
					<input data-v-bdf4e790="" type="text" maxlength="255" id="university"
						placeholder="학교" autocomplete="off" class=""
						value="${principal.user.university}">
					<!---->
				</div>
				<div data-v-bdf4e790="" class="input">
					<div data-v-bdf4e790="" class="label">
						<label data-v-bdf4e790="">계정 비밀번호</label>
					</div>
					<input data-v-bdf4e790="" type="password" maxlength="20"
						id="password" placeholder="계정 비밀번호" class="">
				</div>
				<div data-v-bdf4e790="" class="rules">
					<p data-v-bdf4e790="">
						※ 반드시 본인의 학교를 입력해주세요.<br data-v-bdf4e790=""> ※ 서비스 이용 등에 사용됩니다.
					</p>
				</div>
				<button id="btn-update" data-v-bdf4e790="" >학교
					변경</button>
			</section>
		</form>
		<footer data-v-20651ef4="" data-v-bdf4e790="">
			<a data-v-20651ef4="" href="/page/serviceagreement"> 이용약관 </a> <a
				data-v-20651ef4="" href="/page/privacy"> 개인정보처리방침 </a> <a
				data-v-20651ef4="" href="/page/rules"> 커뮤니티이용규칙 </a> <a
				data-v-20651ef4="" href="/page/faq"> 문의하기 </a> <a data-v-20651ef4=""
				href="/" class="copyright"> © 에브리타임 </a>
		</footer>
	</div>
	<script src="/js/my.js" type="text/javascript"></script>


</body>
</html>