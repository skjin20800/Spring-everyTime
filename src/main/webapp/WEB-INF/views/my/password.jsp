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
<meta property="og:url" content="https://everytime.kr/my/password">
<title>비밀번호 변경 - 에브리타임</title>
<meta data-vue-meta="ssr" name="robots" content="noindex">
<link data-vue-meta="ssr" rel="preload"
	href="/css/6bd0dda348cba948ab66.css" as="style">
<link data-vue-meta="ssr" rel="preload"
	href="/js/2fb5b4c25a90ab94b0ef.js" as="script">
<link data-vue-meta="ssr" rel="preload"
	href="/css/f7797ee7fe90f03bc82d.css" as="style">
<link data-vue-meta="ssr" rel="preload"
	href="/js/02663e7f3b15c173fd46.js" as="script">
<script data-vue-meta="ssr" src="/js/aadaebd95a82a210c982.js" defer=""></script>
<script data-vue-meta="ssr" src="/js/0c1f1016774d00ecc683.js" defer=""></script>
<script data-vue-meta="ssr" src="/js/81595a16949cc0869630.js" defer=""></script>
<script data-vue-meta="ssr" src="/js/8c827fb390bbd5735893.js" defer=""></script>
<link rel="stylesheet" type="text/css"
	href="/js/../css/f7797ee7fe90f03bc82d.css">
<script charset="utf-8" src="/js/02663e7f3b15c173fd46.js"></script>
<link rel="stylesheet" type="text/css"
	href="/js/../css/6bd0dda348cba948ab66.css">
<script charset="utf-8" src="/js/2fb5b4c25a90ab94b0ef.js"></script>
<script charset="utf-8" src="/js/f2cbbeedee4f20dd6d7d.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body data-new-gr-c-s-check-loaded="14.1002.0" data-gr-ext-installed=""
	class="vsc-initialized"style="padding: 100px">

	<div data-v-e7756488="">
		<header data-v-78651b21="" data-v-e7756488="">
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
				<h1 data-v-78651b21="">비밀번호 변경</h1>
			</div>
		</header>
		<form id ="passwordUpdateForm" data-v-e7756488="" class="container">
			<section data-v-e7756488="">
				<h1 data-v-e7756488="">비밀번호 변경</h1>
				<div data-v-e7756488="" class="input">
					<div data-v-e7756488="" class="label">
						<label data-v-e7756488="">새 비밀번호</label>
						<p data-v-e7756488="">4~20자</p>
					</div>
					<input data-v-e7756488="" type="password" maxlength="20"
						placeholder="새 비밀번호" class=""id="newpassword">
					<!---->
					<input data-v-e7756488="" type="password" maxlength="20"
						placeholder="새 비밀번호 확인" class=""id="newpasswordCheck">
						<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
    <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
					<!---->
				</div>
				<div data-v-e7756488="" class="input">
					<div data-v-e7756488="" class="label">
						<label data-v-e7756488="">현재 비밀번호</label>
					</div>
					<input data-v-e7756488="" type="password" maxlength="20"
						placeholder="현재 비밀번호" class="" id = "nowpassword">
				</div>
												<input type="hidden" id ="username" value="${principal.user.username}">
				<div data-v-e7756488="" class="rules">
					<p data-v-e7756488="">
						<strong data-v-e7756488="">※ 혹시 타인에게 계정을 양도하려고 하시나요?</strong><br
							data-v-e7756488=""> 에브리타임 이용약관에서는 타인에게 계정 판매, 양도 및 대여 등을
						엄격하게 금지하고 있습니다.<br data-v-e7756488=""> 모니터링 시스템에 의해 계정 양도가
						적발될 경우 해당 계정은 영구 정지, 탈퇴 등의 조치가 가해지며, 계정 양도로 인해 사기, 불법 행위가 발생할 경우
						관련법에 따라 <span data-v-e7756488="" class="caution">법적 책임을 지게
							될 수 있습니다.</span>
					</p>
					<p data-v-e7756488="">
						<strong data-v-e7756488="">※ 타인에 의한 계정 사용이 의심되시나요?</strong><br
							data-v-e7756488=""> 개인정보 보호를 위해 비밀번호를 변경하여 주시기 바랍니다. 비밀번호를
						변경하면 <span data-v-e7756488="" class="caution">모든 디바이스(앱,
							브라우저 등)에서 즉시 로그아웃 처리됩니다.</span>
					</p>
				</div>
				<input id ="passwordPut" data-v-e7756488="" type="submit" value="비밀번호 변경">
			</section>
		</form>
		<footer data-v-20651ef4="" data-v-e7756488="">
			<a data-v-20651ef4="" href="/page/serviceagreement"> 이용약관 </a> <a
				data-v-20651ef4="" href="/page/privacy"> 개인정보처리방침 </a> <a
				data-v-20651ef4="" href="/page/rules"> 커뮤니티이용규칙 </a> <a
				data-v-20651ef4="" href="/page/faq"> 문의하기 </a> <a data-v-20651ef4=""
				href="/" class="copyright"> © 에브리타임 </a>
		</footer>
	</div>
<script src="/js/my.js" type="text/javascript">
</script>

</body>
</html>