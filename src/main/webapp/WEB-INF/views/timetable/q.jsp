<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>에브리타임 q</title>
<meta charset="utf-8">
<meta name="referrer" content="origin">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta property="fb:app_id" content="258676027581965">
<meta property="og:type" content="website">
<meta property="og:image"
	content="https://everytime.kr/images/og_image.png">
<meta property="og:url" content="https://everytime.kr/timetable/2018/1">
<meta property="og:site_name" content="에브리타임">
<meta property="og:title" content="에브리타임">
<meta property="og:description"
	content="전국 400개 대학을 지원하는 대학교 커뮤니티 및 시간표 서비스. 시간표 작성 및 학업 관리, 학교 생활 정보, 학교별 익명 커뮤니티 기능을 제공합니다.">
<meta name="description"
	content="전국 400개 대학을 지원하는 대학교 커뮤니티 및 시간표 서비스. 시간표 작성 및 학업 관리, 학교 생활 정보, 학교별 익명 커뮤니티 기능을 제공합니다.">
<meta name="keywords"
	content="에브리타임, 에타, everytime, 시간표, 수강신청, 강의평가, 학점계산기, 학식, 오늘의학식, 책방, 중고책, 대학생, 대학교, 대학, 대학생 시간표, 대학교 시간표, 대학생 커뮤니티, 대학교 커뮤니티, 시간표 앱, 시간표 어플">
<meta name="naver-site-verification"
	content="7366738375e320e44bd1c743b364db13086a7b0e">
<meta name="robots" content="noindex">
<link type="text/css" href="/css/common.css" rel="stylesheet">
<link type="text/css" href="/css/common.partial.css" rel="stylesheet">
<link type="text/css" href="/css/container.table.css" rel="stylesheet">
<link type="text/css" href="/css/container.modal.css" rel="stylesheet">
<link type="text/css" href="/css/subjects.css" rel="stylesheet">
<link href="/favicon.ico" rel="shortcut icon">
<!--[if lt IE 9]>
  <script src="/js/extensions.html5shiv.js"></script>
  <script src="/js/extensions.respond.min.js"></script>
  <script src="/js/extensions.excanvas.min.js"></script>
  <![endif]-->
<!--[if lt IE 8]>
  <script src="/js/extensions.json3.min.js"></script>
  <![endif]-->
<script type="text/javascript" src="/js/extensions.jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/js/extensions.underscore-min.js"></script>
<!-- <script type="text/javascript" src="/js/common.js"></script> -->
<!-- <script type="text/javascript" src="/js/timetable.tableload.js"></script> -->
<!-- <script type="text/javascript" src="/js/timetable.tablesave.js"></script> -->
<!-- <script type="text/javascript" src="/js/timetable.subjects.js"></script> -->
<!-- <script type="text/javascript" src="/js/timetable.customsubjects.js"></script> -->
<!-- <script type="text/javascript" src="/js/timetable.index.js"></script> -->
<!-- <script type="text/javascript" src="/js/timetable.subjectcolumninfo.js"></script> -->
<!-- <script type="text/javascript" src="/js/timetable.imagegenerator.js"></script> -->
</head>

<body>
	<nav>
		<div class="wrap">
			<div id="logo">
				<a href="/"><img src="/images/new/nav.logo.png"></a>
				<p>
					<span class="name multiple">에브리타임</span><span class="subname">동의대</span>
				</p>
			</div>
			<div id="account">
				<a href="/message" title="쪽지함" class="icon message">쪽지함</a>
				</li> <a href="/my" title="내 정보" class="icon my">내 정보</a> <input
					type="hidden" id="userUserid" value="lonru"> <input
					type="hidden" id="userSchool" value="151"> <input
					type="hidden" id="userCampus" value="183">
			</div>
			<ul id="menu">
				<li><a href="/">게시판</a></li>
				<li class="active"><a href="/timetable">시간표</a></li>
				<li><a href="/lecture">강의평가</a></li>
				<li><a href="/calculator">학점계산기</a></li>
				<li><a href="/friend">친구</a></li>
				<li><a href="https://bookstore.everytime.kr/">책방</a></li>
				<li><a href="https://www.campuspick.com/">캠퍼스픽</a></li>
			</ul>
		</div>
	</nav>
	<script type="text/javascript">
    var _timetableGridInfo = [];
  </script>
	<div id="container" class="timetable" style="height: 344px;">
		<hr>
		<aside>
			<form class="select">
				<select id="semesters">
					<option>2021년 2학기</option>
					<option>2021년 1학기</option>
					<option>2020년 2학기</option>
					<option>2020년 1학기</option>
				</select>
			</form>
			<div class="title">
				<a class="hamburger"></a>
				<h1 id="tableName">${timetable.tableName}</h1>
				<div class="description">
					<ul class="info">
						<li><span id="tableCredit">${timetable.tableCredit}</span> 학점</li>
						<li><time id="tableUpdatedAt">${timetable.updateDate}</time>
							변경</li>
					</ul>
				</div>
				<hr>
				<ol class="buttons threecols">
					<li data-modal="tableExport"><a class="light image export">이미지</a></li>
					<li data-modal="tableSetting"><a class="light image setting">설정</a></li>
					<li class="mobileonly"><a id="semestersButton">학기변경</a></li>
				</ol>
				<hr>
			</div>
			<div class="menu">
				<ol>
					<c:forEach var="semester" items="${semester}">
						<c:choose>
							<c:when
								test="${timetableId eq semester.id and semester.isStandard eq 'true'}">
								<li class="active"><a
									href="/timetable/${semester.yearType}/${semester.semesterType }/${semester.id}"
									class="primary">${semester.tableName}</a></li>
							</c:when>

							<c:when
								test="${timetableId eq semester.id and semester.isStandard eq 'false'}">
								<li class="active"><a
									href="/timetable/${semester.yearType}/${semester.semesterType }/${semester.id}">${semester.tableName}</a></li>
							</c:when>
							<c:when test="${semester.isStandard eq 'true'}">
								<li><a
									href="/timetable/${semester.yearType}/${semester.semesterType }/${semester.id}"
									class="primary">${semester.tableName}</a></li>

							</c:when>
							<c:otherwise>

								<li><a
									href="/timetable/${semester.yearType}/${semester.semesterType }/${semester.id}">${semester.tableName}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="extension"><a class="create">새 시간표 만들기</a>
				</ol>
			</div>
		</aside>
		<div class="wrap" style="width: 1085px;">
			<div class="tablehead">
				<table class="tablehead">
					<tbody>
						<tr>
							<th></th>
							<td>월</td>
							<td>화</td>
							<td>수</td>
							<td>목</td>
							<td>금</td>
							<td style="display: none;">토</td>
							<td style="display: none;">일</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="tablebody">
				<table class="tablebody" style="margin-top: -542px;">
					<tbody>
						<tr>
							<th><div class="times">
									<div class="time">오전 0시</div>
									<div class="time">오전 1시</div>
									<div class="time">오전 2시</div>
									<div class="time">오전 3시</div>
									<div class="time">오전 4시</div>
									<div class="time">오전 5시</div>
									<div class="time">오전 6시</div>
									<div class="time">오전 7시</div>
									<div class="time">오전 8시</div>
									<div class="time">오전 9시</div>
									<div class="time">오전 10시</div>
									<div class="time">오전 11시</div>
									<div class="time">오후 12시</div>
									<div class="time">오후 1시</div>
									<div class="time">오후 2시</div>
									<div class="time">오후 3시</div>
									<div class="time">오후 4시</div>
									<div class="time">오후 5시</div>
									<div class="time">오후 6시</div>
									<div class="time">오후 7시</div>
									<div class="time">오후 8시</div>
									<div class="time">오후 9시</div>
									<div class="time">오후 10시</div>
									<div class="time">오후 11시</div>
								</div></th>
							<!-- 								1교시 450 5교시 650 -->
							<c:set var="list" value="${fn:split('월,화,수,목,금',',')}" />
							<c:forEach var="day" items="${list}" varStatus="i">
								<td><div class="cols" style="width: 200px;">
										<c:forEach var="sLecture" items="${timetable.studentLectures}">
											<c:if test="${fn:contains(sLecture.lecture.firstTime,day)}">
												<fmt:formatNumber type="number" var="top"
													value="${fn:substring(sLecture.lecture.firstTime,1,2)*60+480}" />
													<c:set var="length" value="${fn:length(sLecture.lecture.firstTime)}"/>
													<fmt:formatNumber type="number" var="end" value="${fn:substring(sLecture.lecture.firstTime,length-1,length)}"/>
													<fmt:formatNumber type="number" var="start" value="${fn:substring(sLecture.lecture.firstTime,1,2)}"/>
												<fmt:formatNumber type="number" var="height"
													value="${(end-start)*60+61 }" />
												<div class="subject color${sLecture.id}"
													style="height: ${height}px; top: ${top}px;">
													<ul class="status" style="display: none;">
														<li title="삭제" class="del"></li>
													</ul>
													<h3>${sLecture.lecture.course.courseName}</h3>
													<p>
														<em>${sLecture.lecture.professor}</em><span>${sLecture.lecture.lectureroom}</span>
													</p>
												</div>
											</c:if>
											<c:if test="${fn:contains(sLecture.lecture.secondTime,day)}">
												<fmt:formatNumber type="number" var="top"
													value="${fn:substring(sLecture.lecture.secondTime,1,2)*60+480}" />
														<c:set var="length" value="${fn:length(sLecture.lecture.secondTime)}"/>
													<fmt:formatNumber type="number" var="end" value="${fn:substring(sLecture.lecture.secondTime,length-1,length)}"/>
													<fmt:formatNumber type="number" var="start" value="${fn:substring(sLecture.lecture.secondTime,1,2)}"/>
												<fmt:formatNumber type="number" var="height"
													value="${(end-start)*60+61 }" />
												<div class="subject color${sLecture.id}"
													style="height: ${height}px; top: ${top}px;">
													<ul class="status" style="display: none;">
														<li title="삭제" class="del"></li>
													</ul>
													<h3>${sLecture.lecture.course.courseName}</h3>
													<p>
														<em>${sLecture.lecture.professor}</em><span>${Lecture.lecture.lectureroom}</span>
													</p>
												</div>
											</c:if>
										</c:forEach>
									</div>
									<div class="grids">
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
										<div class="grid"></div>
									</div></td>
							</c:forEach>

							<td style="display: none;"><div class="cols"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div></td>
							<td style="display: none;"><div class="cols"></div>
								<div class="grids">
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
									<div class="grid"></div>
								</div></td>
						</tr>
					</tbody>
				</table>
				<div class="nontimes"></div>
			</div>
		</div>
			<div id="bottom">
		<ul class="links">
			<li><a href="/page/serviceagreement">이용약관</a></li>
			<li><a href="/page/privacy">개인정보처리방침</a></li>
			<li><a href="/page/rules">커뮤니티이용규칙</a></li>
			<li><a href="/notice">공지사항</a></li>
			<li><a href="/page/faq">문의하기</a></li>
			<li class="copyright"><a href="/">&copy; 에브리타임</a></li>
		</ul>
	</div>
	<script type="text/javascript">
    var _serverTime = 1617309472160;
    var _clientTime = new Date().getTime();
    var _diffTime = _clientTime - _serverTime;
    var _apiServerUrl = 'https://api.everytime.kr';
  </script>
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-22022140-4"></script>
	<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'UA-22022140-4');
  </script>
</body>
</html>