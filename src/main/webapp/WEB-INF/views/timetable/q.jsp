<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/timetable.tableload.js"></script>
<script type="text/javascript" src="/js/timetable.tablesave.js"></script>
<script type="text/javascript" src="/js/timetable.subjects.js"></script>
<script type="text/javascript" src="/js/timetable.customsubjects.js"></script>
<script type="text/javascript" src="/js/timetable.index.js"></script>
<script type="text/javascript" src="/js/timetable.subjectcolumninfo.js"></script>
<script type="text/javascript" src="/js/timetable.imagegenerator.js"></script>
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
							<c:when test="${timetableId eq semester.id and semester.isStandard eq 'true'}">
										<li class="active"><a
											href="/timetable/${semester.yearType}/${semester.semesterType }/${semester.id}"
											class="primary">${semester.tableName}</a></li>
									</c:when>

									<c:when test="${timetableId eq semester.id and semester.isStandard eq 'false'}">
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
							<td><div class="cols" style="width: 199px;">
									<div class="subject color3" style="height: 121px; top: 900px;">
										<ul class="status" style="display: none;">
											<li title="삭제" class="del"></li>
										</ul>
										<h3>컴퓨터네트워크</h3>
										<p>
											<em>권오준</em><span>정보913</span>
										</p>
									</div>
									<div class="subject color4" style="height: 121px; top: 720px;">
										<ul class="status" style="display: none;">
											<li title="삭제" class="del"></li>
										</ul>
										<h3>파일처리론</h3>
										<p>
											<em>이중화</em><span>정보913</span>
										</p>
									</div>
									<div class="subject color6" style="height: 121px; top: 600px;">
										<ul class="status" style="display: none;">
											<li title="삭제" class="del"></li>
										</ul>
										<h3>수치해석학</h3>
										<p>
											<em>장희숙</em><span>정보913</span>
										</p>
									</div>
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
							<td><div class="cols" style="width: 200px;">
									<div class="subject color1" style="height: 61px; top: 960px;">
										<ul class="status">
											<li title="삭제" class="del"></li>
										</ul>
										<h3>전공탐색과진로설계Ⅱ-Ⅱ</h3>
										<p>
											<em>김태석</em><span>정보908</span>
										</p>
									</div>
									<div class="subject color2" style="height: 121px; top: 780px;">
										<ul class="status">
											<li title="삭제" class="del"></li>
										</ul>
										<h3>비주얼프로그래밍</h3>
										<p>
											<em>권순각</em><span>정보913</span>
										</p>
									</div>
									<div class="subject color3" style="height: 61px; top: 660px;">
										<ul class="status">
											<li title="삭제" class="del"></li>
										</ul>
										<h3>컴퓨터네트워크</h3>
										<p>
											<em>권오준</em><span>정보913</span>
										</p>
									</div>
									<div class="subject color7" style="height: 121px; top: 540px;">
										<ul class="status">
											<li title="삭제" class="del"></li>
										</ul>
										<h3>컴퓨터구조이론및실습</h3>
										<p>
											<em>김성우</em><span>정보912</span>
										</p>
									</div>
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
							<td><div class="cols" style="width: 200px;">
									<div class="subject color2" style="height: 121px; top: 540px;">
										<ul class="status">
											<li title="삭제" class="del"></li>
										</ul>
										<h3>비주얼프로그래밍</h3>
										<p>
											<em>권순각</em><span>정보911</span>
										</p>
									</div>
									<div class="subject color7" style="height: 121px; top: 660px;">
										<ul class="status">
											<li title="삭제" class="del"></li>
										</ul>
										<h3>컴퓨터구조이론및실습</h3>
										<p>
											<em>김성우</em><span>정보915</span>
										</p>
									</div>
									<div class="subject color8" style="height: 121px; top: 900px;">
										<ul class="status">
											<li title="삭제" class="del"></li>
										</ul>
										<h3>직업과윤리</h3>
										<p>
											<em>김보성(철학상담·심리학과)</em><span>공과618</span>
										</p>
									</div>
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
							<td><div class="cols" style="width: 200px;">
									<div class="subject color4" style="height: 61px; top: 780px;">
										<ul class="status">
											<li title="삭제" class="del"></li>
										</ul>
										<h3>파일처리론</h3>
										<p>
											<em>이중화</em><span>정보913</span>
										</p>
									</div>
									<div class="subject color5" style="height: 121px; top: 540px;">
										<ul class="status">
											<li title="삭제" class="del"></li>
										</ul>
										<h3>객체지향프로그래밍Ⅱ</h3>
										<p>
											<em>이종민</em><span>정보916</span>
										</p>
									</div>
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
							<td><div class="cols" style="width: 200px;">
									<div class="subject color5" style="height: 121px; top: 540px;">
										<ul class="status">
											<li title="삭제" class="del"></li>
										</ul>
										<h3>객체지향프로그래밍Ⅱ</h3>
										<p>
											<em>이종민</em><span>정보914</span>
										</p>
									</div>
									<div class="subject color6" style="height: 61px; top: 720px;">
										<ul class="status">
											<li title="삭제" class="del"></li>
										</ul>
										<h3>수치해석학</h3>
										<p>
											<em>장희숙</em><span>정보913</span>
										</p>
									</div>
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
		<form id="tableExport" class="modal">
			<a title="닫기" class="close"></a>
			<h3>시간표 이미지 저장</h3>
			<p>
				<label>이미지 옵션</label> <label class="checkbox"><input
					type="radio" name="is_mobile" value="false" checked=""> PC용</label>
				<label class="checkbox"><input type="radio" name="is_mobile"
					value="true"> 모바일용</label>
			</p>
			<input type="hidden" name="id"> <input type="submit"
				value="저장하기" class="button">
		</form>
		<form id="tableSetting" class="modal">
			<a title="닫기" class="close"></a>
			<h3>시간표 설정</h3>
			<p>
				<label>이름</label> <input type="text" name="name" value=""
					maxlength="40" class="text">
			</p>
			<p>
				<label>공개 범위</label> <input type="radio" id="tableSetting_priv0"
					name="priv" value="0"><label for="tableSetting_priv0"
					class="checkbox">전체공개</label> <input type="radio"
					id="tableSetting_priv1" name="priv" value="1"><label
					for="tableSetting_priv1" class="checkbox">친구공개</label> <input
					type="radio" id="tableSetting_priv2" name="priv" value="2"><label
					for="tableSetting_priv2" class="checkbox">비공개</label>
			</p>
			<p>
				<label>기본</label> <input type="checkbox"
					id="tableSetting_is_primary" name="is_primary"><label
					for="tableSetting_is_primary" class="checkbox">기본시간표 설정</label>
			</p>
			<input type="button" value="삭제" class="button light floatLeft">
			<input type="submit" value="설정 저장" class="button">
		</form>
		<form id="subjectCampusFilter" class="modal">
			<a title="닫기" class="close"></a>
			<h3>캠퍼스</h3>
			<div class="filter"></div>
			<input type="submit" value="적용" class="button">
		</form>
		<form id="subjectCategoryFilter" class="modal">
			<a title="닫기" class="close"></a>
			<h3>전공/영역</h3>
			<div class="filter"></div>
		</form>
		<form id="subjectKeywordFilter" class="modal">
			<a title="닫기" class="close"></a>
			<h3>검색어</h3>
			<div class="filter"></div>
			<input type="submit" value="검색" class="button">
		</form>
		<form id="subjectOrderFilter" class="modal">
			<a title="닫기" class="close"></a>
			<h3>정렬</h3>
			<div class="filter"></div>
			<input type="submit" value="적용" class="button">
		</form>
		<form id="subjectTimeFilter" class="modal">
			<a title="닫기" class="close"></a>
			<h3>시간</h3>
			<div class="filter"></div>
			<input type="submit" value="적용" class="button">
		</form>
		<form id="subjectGradeFilter" class="modal">
			<a title="닫기" class="close"></a>
			<h3>학년</h3>
			<div class="filter"></div>
			<input type="button" value="전체 선택" class="button light floatLeft"
				data-action="select"> <input type="button" value="전체 취소"
				class="button light floatLeft" data-action="deselect"> <input
				type="submit" value="적용" class="button">
		</form>
		<form id="subjectTypeFilter" class="modal">
			<a title="닫기" class="close"></a>
			<h3>구분</h3>
			<div class="filter"></div>
			<input type="button" value="전체 선택" class="button light floatLeft"
				data-action="select"> <input type="button" value="전체 취소"
				class="button light floatLeft" data-action="deselect"> <input
				type="submit" value="적용" class="button">
		</form>
		<form id="subjectCreditFilter" class="modal">
			<a title="닫기" class="close"></a>
			<h3>학점</h3>
			<div class="filter"></div>
			<input type="button" value="전체 선택" class="button light floatLeft"
				data-action="select"> <input type="button" value="전체 취소"
				class="button light floatLeft" data-action="deselect"> <input
				type="submit" value="적용" class="button">
		</form>
		<ul class="floating" style="left: 753.2px;">
			<li class="button search">수업 목록에서 검색</li>
			<li class="button custom">직접 추가</li>
		</ul>
	</div>
	<form id="customsubjects">
		<input type="hidden" name="id"> <a title="닫기" class="close"></a>
		<h2></h2>
		<dl>
			<dt>과목명 (필수)</dt>
			<dd>
				<input type="text" name="name" placeholder="예) 경제학입문" maxlength="40"
					class="text">
			</dd>
			<dt>교수명</dt>
			<dd>
				<input type="text" name="professor" placeholder="예) 홍길동"
					maxlength="40" class="text">
			</dd>
			<dt>시간/장소</dt>
			<dd class="timeplaces">
				<a class="new"><strong>+</strong> 더 입력</a>
			</dd>
		</dl>
		<div class="clearBothOnly"></div>
		<div class="submit">
			<input type="submit" value="저장" class="button">
		</div>
	</form>
	<div id="subjects" style="display: block;">
		<div class="filter">
			<a class="close">닫기</a><a class="reset hide">초기화</a><a class="item"
				data-id="category"><span class="key">전공/영역:</span><span
				class="value">전체</span><span class="reset"></span></a><a class="item"
				data-id="keyword"><span class="key">검색어:</span><span
				class="value">없음</span><span class="reset"></span></a><a class="item"
				data-id="order"><span class="key">정렬:</span><span class="value">기본</span><span
				class="reset"></span></a><a class="item" data-id="time"><span
				class="key">시간:</span><span class="value">전체</span><span
				class="reset"></span></a><a class="item" data-id="grade"><span
				class="key">학년:</span><span class="value">전체</span><span
				class="reset"></span></a><a class="item" data-id="type"><span
				class="key">구분:</span><span class="value">전체</span><span
				class="reset"></span></a><a class="item" data-id="credit"><span
				class="key">학점:</span><span class="value">전체</span><span
				class="reset"></span></a>
		</div>
		<div class="list">
			<div class="thead"></div>
			<table>
				<thead>
					<tr>
						<th>과목코드
							<div>과목코드</div>
						</th>
						<th>과목명
							<div>과목명</div>
						</th>
						<th>교수
							<div>교수</div>
						</th>
						<th>강의시간
							<div>강의시간</div>
						</th>
						<th>강의실
							<div>강의실</div>
						</th>
						<th>구분
							<div>구분</div>
						</th>
						<th>학년
							<div>학년</div>
						</th>
						<th>학점
							<div>학점</div>
						</th>
						<th>강의평
							<div>강의평</div>
						</th>
						<th>담은 인원
							<div>담은 인원</div>
						</th>
						<th>정원
							<div>정원</div>
						</th>
						<th>수강대상
							<div>수강대상</div>
						</th>
						<th>비고
							<div>비고</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>100017-001</td>
						<td class="bold">실용영어</td>
						<td>제이하프</td>
						<td>공과513[월5-6],[화5](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672391" target="_blank"
							title="4.35" class="star"><span class="on"
								style="width: 87%;"></span></a></td>
						<td>26</td>
						<td>35</td>
						<td class="small">신소재공학부(1;1839~1874)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-002</td>
						<td class="bold">실용영어</td>
						<td>크레그</td>
						<td>공과519[월5-6],[화5](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672384" target="_blank"
							title="3.11" class="star"><span class="on"
								style="width: 62.2%;"></span></a></td>
						<td>19</td>
						<td>35</td>
						<td class="small">신소재공학부(1;1876~1910)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-003</td>
						<td class="bold">실용영어</td>
						<td>팀멘기니</td>
						<td>공과521[월5-6],[화5](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672389" target="_blank"
							title="4.47" class="star"><span class="on"
								style="width: 89.4%;"></span></a></td>
						<td>20</td>
						<td>35</td>
						<td class="small">신소재공학부(1;1911~1944)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-004</td>
						<td class="bold">실용영어</td>
						<td>다니엘블리</td>
						<td>정보209[월5-6],[화5](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672397" target="_blank"
							title="3.85" class="star"><span class="on"
								style="width: 77%;"></span></a></td>
						<td>26</td>
						<td>35</td>
						<td class="small">신소재공학부(1;1945~1978)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-005</td>
						<td class="bold">실용영어</td>
						<td>폴포터</td>
						<td>정보210[월5-6],[화5](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672393" target="_blank"
							title="1.78" class="star"><span class="on"
								style="width: 35.6%;"></span></a></td>
						<td>18</td>
						<td>35</td>
						<td class="small">신소재공학부(1;1979~2013)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-006</td>
						<td class="bold">실용영어</td>
						<td>해즐턴새뮤</td>
						<td>지천관507[수4],[금5-6](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1741228" target="_blank"
							title="4.57" class="star"><span class="on"
								style="width: 91.4%;"></span></a></td>
						<td>25</td>
						<td>35</td>
						<td class="small">디자인공학부(1;2014~2045)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-007</td>
						<td class="bold">실용영어</td>
						<td>다니엘쉐리</td>
						<td>지천관515[수4],[금5-6](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672394" target="_blank"
							title="3.51" class="star"><span class="on"
								style="width: 70.2%;"></span></a></td>
						<td>24</td>
						<td>35</td>
						<td class="small">디자인공학부(1;2046~2078)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-008</td>
						<td class="bold">실용영어</td>
						<td>제이하프</td>
						<td>공과112[화3],[목2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672391" target="_blank"
							title="4.53" class="star"><span class="on"
								style="width: 90.6%;"></span></a></td>
						<td>15</td>
						<td>35</td>
						<td class="small">기계자동차로봇부품공학부(1;2079~2110)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-009</td>
						<td class="bold">실용영어</td>
						<td>크레그</td>
						<td>공과113[화3],[목2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672384" target="_blank"
							title="3.11" class="star"><span class="on"
								style="width: 62.2%;"></span></a></td>
						<td>18</td>
						<td>35</td>
						<td class="small">기계자동차로봇부품공학부(1;2111~2142)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-010</td>
						<td class="bold">실용영어</td>
						<td>팀멘기니</td>
						<td>공과119[화3],[목2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672389" target="_blank"
							title="4.47" class="star"><span class="on"
								style="width: 89.4%;"></span></a></td>
						<td>20</td>
						<td>35</td>
						<td class="small">기계자동차로봇부품공학부(1;2143~2173)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-011</td>
						<td class="bold">실용영어</td>
						<td>다니엘블리</td>
						<td>공과218[화3], 정보210[목2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672397" target="_blank"
							title="3.86" class="star"><span class="on"
								style="width: 77.2%;"></span></a></td>
						<td>17</td>
						<td>35</td>
						<td class="small">기계자동차로봇부품공학부(1;2174~2204)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-012</td>
						<td class="bold">실용영어</td>
						<td>폴포터</td>
						<td>정보410[화3],[목2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672393" target="_blank"
							title="1.78" class="star"><span class="on"
								style="width: 35.6%;"></span></a></td>
						<td>17</td>
						<td>35</td>
						<td class="small">기계자동차로봇부품공학부(1;2205~2234)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-013</td>
						<td class="bold">실용영어</td>
						<td>케이티</td>
						<td>정보411[화3], 정보512[목2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672390" target="_blank"
							title="4.64" class="star"><span class="on"
								style="width: 92.8%;"></span></a></td>
						<td>17</td>
						<td>35</td>
						<td class="small">기계자동차로봇부품공학부(1;2235~2264)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-014</td>
						<td class="bold">실용영어</td>
						<td>데이비드스</td>
						<td>정보109[화3],[목2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672395" target="_blank"
							title="4.6" class="star"><span class="on" style="width: 92%;"></span></a></td>
						<td>18</td>
						<td>35</td>
						<td class="small">기계자동차로봇부품공학부(1;2265~2296)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-015</td>
						<td class="bold">실용영어</td>
						<td>얀커트</td>
						<td>정보110[화3],[목2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672392" target="_blank"
							title="2.56" class="star"><span class="on"
								style="width: 51.2%;"></span></a></td>
						<td>20</td>
						<td>35</td>
						<td class="small">기계자동차로봇부품공학부(1;2297~2326)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-016</td>
						<td class="bold">실용영어</td>
						<td>컬트카노</td>
						<td>지천관606[월3],[수2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672386" target="_blank"
							title="4.84" class="star"><span class="on"
								style="width: 96.8%;"></span></a></td>
						<td>17</td>
						<td>35</td>
						<td class="small">산업융합시스템공학부(1;2327~2357)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-017</td>
						<td class="bold">실용영어</td>
						<td>해즐턴새뮤</td>
						<td>공과414[월3],[수2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1741228" target="_blank"
							title="4.5" class="star"><span class="on" style="width: 90%;"></span></a></td>
						<td>17</td>
						<td>35</td>
						<td class="small">산업융합시스템공학부(1;2358~2386)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-018</td>
						<td class="bold">실용영어</td>
						<td>찰스</td>
						<td>자대619[월3],[수2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672383" target="_blank"
							title="4.2" class="star"><span class="on" style="width: 84%;"></span></a></td>
						<td>16</td>
						<td>35</td>
						<td class="small">산업융합시스템공학부(1;2387~2416)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-019</td>
						<td class="bold">실용영어</td>
						<td>팀멘기니</td>
						<td>공과618[월4],[수5-6](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672389" target="_blank"
							title="4.56" class="star"><span class="on"
								style="width: 91.2%;"></span></a></td>
						<td>29</td>
						<td>35</td>
						<td class="small">건설공학부(1;2417~2450)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-020</td>
						<td class="bold">실용영어</td>
						<td>다니엘블리</td>
						<td>공과514[월4],[수5-6](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672397" target="_blank"
							title="3.85" class="star"><span class="on"
								style="width: 77%;"></span></a></td>
						<td>25</td>
						<td>35</td>
						<td class="small">건설공학부(1;2451~2485)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-021</td>
						<td class="bold">실용영어</td>
						<td>아데</td>
						<td>공과120[월4],[수5-6](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1741229" target="_blank"
							title="4.39" class="star"><span class="on"
								style="width: 87.8%;"></span></a></td>
						<td>30</td>
						<td>35</td>
						<td class="small">건설공학부(1;2486~2519)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-022</td>
						<td class="bold">실용영어</td>
						<td>해즐턴새뮤</td>
						<td>정보209[월4],[수5-6](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1741228" target="_blank"
							title="4.5" class="star"><span class="on" style="width: 90%;"></span></a></td>
						<td>30</td>
						<td>35</td>
						<td class="small">건설공학부(1;2520~2553)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-023</td>
						<td class="bold">실용영어</td>
						<td>찰스</td>
						<td>공과620[월4],[수5-6](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672383" target="_blank"
							title="4.2" class="star"><span class="on" style="width: 84%;"></span></a></td>
						<td>34</td>
						<td>35</td>
						<td class="small">건설공학부(1;2554~2587)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-024</td>
						<td class="bold">실용영어</td>
						<td>컬트카노</td>
						<td>정보611[월4],[수5-6](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672386" target="_blank"
							title="4.84" class="star"><span class="on"
								style="width: 96.8%;"></span></a></td>
						<td>31</td>
						<td>35</td>
						<td class="small">건설공학부(1;2588~2625)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-025</td>
						<td class="bold">실용영어</td>
						<td>폴포터</td>
						<td>자대418[목4],[금7-8](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672393" target="_blank"
							title="2.7" class="star"><span class="on" style="width: 54%;"></span></a></td>
						<td>27</td>
						<td>35</td>
						<td class="small">바이오응용공학부(1;2626~2656)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-026</td>
						<td class="bold">실용영어</td>
						<td>케이티</td>
						<td>자대719[목4],[금7-8](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672390" target="_blank"
							title="4.73" class="star"><span class="on"
								style="width: 94.6%;"></span></a></td>
						<td>23</td>
						<td>35</td>
						<td class="small">바이오응용공학부(1;2657~2686)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-027</td>
						<td class="bold">실용영어</td>
						<td>데이비드스</td>
						<td>자대517[목4],[금7-8](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672395" target="_blank"
							title="4.33" class="star"><span class="on"
								style="width: 86.6%;"></span></a></td>
						<td>21</td>
						<td>35</td>
						<td class="small">바이오응용공학부(1;2688~2717)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-028</td>
						<td class="bold">실용영어</td>
						<td>얀커트</td>
						<td>자대524[목4],[금7-8](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672392" target="_blank"
							title="2.94" class="star"><span class="on"
								style="width: 58.8%;"></span></a></td>
						<td>21</td>
						<td>35</td>
						<td class="small">바이오응용공학부(1;2718~2747)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-029</td>
						<td class="bold">실용영어</td>
						<td>아데</td>
						<td>자대727[목4],[금7-8](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1741229" target="_blank"
							title="4.64" class="star"><span class="on"
								style="width: 92.8%;"></span></a></td>
						<td>26</td>
						<td>35</td>
						<td class="small">바이오응용공학부(1;2748~2778)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-030</td>
						<td class="bold">실용영어</td>
						<td>케이티</td>
						<td>공과318[월5-6],[화5](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672390" target="_blank"
							title="4.64" class="star"><span class="on"
								style="width: 92.8%;"></span></a></td>
						<td>19</td>
						<td>35</td>
						<td class="small">화학환경공학부(1;2779~2812)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-031</td>
						<td class="bold">실용영어</td>
						<td>해즐턴새뮤</td>
						<td>공과420[월5-6],[화5](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1741228" target="_blank"
							title="4.5" class="star"><span class="on" style="width: 90%;"></span></a></td>
						<td>23</td>
						<td>35</td>
						<td class="small">화학환경공학부(1;2813~2842)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-032</td>
						<td class="bold">실용영어</td>
						<td>찰스</td>
						<td>자대317[월5-6],[화5](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672383" target="_blank"
							title="4.04" class="star"><span class="on"
								style="width: 80.8%;"></span></a></td>
						<td>22</td>
						<td>35</td>
						<td class="small">화학환경공학부(1;2843~2873)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-033</td>
						<td class="bold">실용영어</td>
						<td>컬트카노</td>
						<td>공과419[월5-6],[화5](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672386" target="_blank"
							title="4.69" class="star"><span class="on"
								style="width: 93.8%;"></span></a></td>
						<td>19</td>
						<td>35</td>
						<td class="small">화학환경공학부(1;2874~2902)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-034</td>
						<td class="bold">실용영어</td>
						<td>닐햄</td>
						<td>자대627[월5-6],[화5](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672396" target="_blank"
							title="3.56" class="star"><span class="on"
								style="width: 71.2%;"></span></a></td>
						<td>26</td>
						<td>35</td>
						<td class="small">화학환경공학부(1;2903~2934)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-035</td>
						<td class="bold">실용영어</td>
						<td>폴포터</td>
						<td>공과229[화4],[금3-4](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672393" target="_blank"
							title="1.78" class="star"><span class="on"
								style="width: 35.6%;"></span></a></td>
						<td>19</td>
						<td>35</td>
						<td class="small">조선해양공학과(1;2936~2966)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-036</td>
						<td class="bold">실용영어</td>
						<td>케이티</td>
						<td>정보210[화4],[금3-4](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672390" target="_blank"
							title="4.64" class="star"><span class="on"
								style="width: 92.8%;"></span></a></td>
						<td>24</td>
						<td>35</td>
						<td class="small">조선해양공학과(1;2967~2998)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-037</td>
						<td class="bold">실용영어</td>
						<td>제이하프</td>
						<td>정보811[월1-2],[화2](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672391" target="_blank"
							title="4.34" class="star"><span class="on"
								style="width: 86.8%;"></span></a></td>
						<td>18</td>
						<td>35</td>
						<td class="small">컴퓨터공학과(1;2999~3034)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-038</td>
						<td class="bold">실용영어</td>
						<td>크레그</td>
						<td>자대319[월1-2],[화2](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672384" target="_blank"
							title="2.95" class="star"><span class="on"
								style="width: 59%;"></span></a></td>
						<td>15</td>
						<td>35</td>
						<td class="small">컴퓨터공학과(1;3035~3068)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-039</td>
						<td class="bold">실용영어</td>
						<td>닐햄</td>
						<td>정보210[월1-2],[화2](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672396" target="_blank"
							title="3.72" class="star"><span class="on"
								style="width: 74.4%;"></span></a></td>
						<td>24</td>
						<td>35</td>
						<td class="small">컴퓨터공학과(1;3069~3103)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-040</td>
						<td class="bold">실용영어</td>
						<td>데이비드스</td>
						<td>정보913[수4],[금5-6](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672395" target="_blank"
							title="4.06" class="star"><span class="on"
								style="width: 81.2%;"></span></a></td>
						<td>20</td>
						<td>35</td>
						<td class="small">창의소프트웨어공학부(1;3104~3134)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-041</td>
						<td class="bold">실용영어</td>
						<td>얀커트</td>
						<td>정보912[수4],[금5-6](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672392" target="_blank"
							title="2.64" class="star"><span class="on"
								style="width: 52.8%;"></span></a></td>
						<td>24</td>
						<td>35</td>
						<td class="small">창의소프트웨어공학부(1;3135~3163)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-042</td>
						<td class="bold">실용영어</td>
						<td>아데</td>
						<td>산학415[수4],[금5-6](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1741229" target="_blank"
							title="4.41" class="star"><span class="on"
								style="width: 88.2%;"></span></a></td>
						<td>24</td>
						<td>35</td>
						<td class="small">창의소프트웨어공학부(1;3164~3195)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-043</td>
						<td class="bold">실용영어</td>
						<td>닐햄</td>
						<td>정보611[수4],[금5-6](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672396" target="_blank"
							title="3.64" class="star"><span class="on"
								style="width: 72.8%;"></span></a></td>
						<td>26</td>
						<td>35</td>
						<td class="small">창의소프트웨어공학부(1;3196~3228)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-044</td>
						<td class="bold">실용영어</td>
						<td>제이하프</td>
						<td>정보912[월3],[수2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672391" target="_blank"
							title="4.53" class="star"><span class="on"
								style="width: 90.6%;"></span></a></td>
						<td>19</td>
						<td>35</td>
						<td class="small">전기전자통신공학부(1;3229~3263)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-045</td>
						<td class="bold">실용영어</td>
						<td>크레그</td>
						<td>정보512[월3],[수2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672384" target="_blank"
							title="3.12" class="star"><span class="on"
								style="width: 62.4%;"></span></a></td>
						<td>18</td>
						<td>35</td>
						<td class="small">전기전자통신공학부(1;3264~3293)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-046</td>
						<td class="bold">실용영어</td>
						<td>팀멘기니</td>
						<td>정보617[월3],[수2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672389" target="_blank"
							title="4.47" class="star"><span class="on"
								style="width: 89.4%;"></span></a></td>
						<td>19</td>
						<td>35</td>
						<td class="small">전기전자통신공학부(1;3294~3324)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-047</td>
						<td class="bold">실용영어</td>
						<td>다니엘블리</td>
						<td>정보710[월3],[수2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672397" target="_blank"
							title="3.85" class="star"><span class="on"
								style="width: 77%;"></span></a></td>
						<td>26</td>
						<td>35</td>
						<td class="small">전기전자통신공학부(1;3325~3355)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-048</td>
						<td class="bold">실용영어</td>
						<td>아데</td>
						<td>정보209[월3],[수2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1741229" target="_blank"
							title="4.45" class="star"><span class="on"
								style="width: 89%;"></span></a></td>
						<td>20</td>
						<td>35</td>
						<td class="small">전기전자통신공학부(1;3356~3386)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-049</td>
						<td class="bold">실용영어</td>
						<td>닐햄</td>
						<td>공과527[월3],[수2-3](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672396" target="_blank"
							title="3.72" class="star"><span class="on"
								style="width: 74.4%;"></span></a></td>
						<td>19</td>
						<td>35</td>
						<td class="small">전기전자통신공학부(1;3387~3417)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-050</td>
						<td class="bold">실용영어</td>
						<td>데이비드스</td>
						<td>산학622[화4],[금3-4](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672395" target="_blank"
							title="4.33" class="star"><span class="on"
								style="width: 86.6%;"></span></a></td>
						<td>17</td>
						<td>35</td>
						<td class="small">디지털콘텐츠게임애니메이션공학부(1;3418~3</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-051</td>
						<td class="bold">실용영어</td>
						<td>얀커트</td>
						<td>산학522[화4],[금3-4](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672392" target="_blank"
							title="2.88" class="star"><span class="on"
								style="width: 57.6%;"></span></a></td>
						<td>18</td>
						<td>35</td>
						<td class="small">디지털콘텐츠게임애니메이션공학부(1;3446~3</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-052</td>
						<td class="bold">실용영어</td>
						<td>찰스</td>
						<td>정보209[화4],[금3-4](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672383" target="_blank"
							title="4.2" class="star"><span class="on" style="width: 84%;"></span></a></td>
						<td>19</td>
						<td>35</td>
						<td class="small">디지털콘텐츠게임애니메이션공학부(1;3472~3</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-053</td>
						<td class="bold">실용영어</td>
						<td>컬트카노</td>
						<td>정보617[화4],[금3-4](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672386" target="_blank"
							title="4.84" class="star"><span class="on"
								style="width: 96.8%;"></span></a></td>
						<td>21</td>
						<td>35</td>
						<td class="small">디지털콘텐츠게임애니메이션공학부(1;3498~3</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100017-054</td>
						<td class="bold">실용영어</td>
						<td>다니엘쉐리</td>
						<td>산학712[목4],[금7-8](35)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672394" target="_blank"
							title="3.71" class="star"><span class="on"
								style="width: 74.2%;"></span></a></td>
						<td>28</td>
						<td>35</td>
						<td class="small">영화학과(1;3527~3559)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-001</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>송춘호</td>
						<td>한의303[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570882" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>2</td>
						<td>40</td>
						<td class="small">한의예과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-002</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>이용태</td>
						<td>한의207[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570883" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>4</td>
						<td>40</td>
						<td class="small">한의예과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-003</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>김경철</td>
						<td>간호206[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570884" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의예과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-004</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>김훈</td>
						<td>한의310[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570885" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의예과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-005</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>김인락</td>
						<td>한의306[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570887" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>3</td>
						<td>40</td>
						<td class="small">한의예과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-006</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>신순식</td>
						<td>간호207[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570888" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의예과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-007</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>최영현</td>
						<td>한의302[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570889" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>2</td>
						<td>40</td>
						<td class="small">한의예과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-008</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>강경화</td>
						<td>한의205[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570890" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>1</td>
						<td>40</td>
						<td class="small">한의예과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-009</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>이해웅</td>
						<td>간호208[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570891" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>1</td>
						<td>40</td>
						<td class="small">한의예과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-010</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>김범회</td>
						<td>한의206[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570892" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의예과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-011</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>이상협</td>
						<td>한의402[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570893" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>1</td>
						<td>40</td>
						<td class="small">한의예과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-012</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>홍수현</td>
						<td>한의408-1[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1571060" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>2</td>
						<td>40</td>
						<td class="small">한의예과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-013</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>박신형</td>
						<td>한의407-1[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1914310" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>1</td>
						<td>40</td>
						<td class="small">한의예과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-014</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>송춘호</td>
						<td>한의303[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570882" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의학과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-015</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>이용태</td>
						<td>한의207[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570883" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의학과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-016</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>김경철</td>
						<td>간호206[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570884" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의학과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-017</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>김훈</td>
						<td>한의310[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570885" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의학과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-018</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>김인락</td>
						<td>한의306[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570887" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의학과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-019</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>신순식</td>
						<td>간호207[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570888" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의학과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-020</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>최영현</td>
						<td>한의302[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570889" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의학과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-021</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>강경화</td>
						<td>한의205[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570890" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의학과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-022</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>이해웅</td>
						<td>간호208[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570891" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의학과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-023</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>김범회</td>
						<td>한의206[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570892" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의학과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-024</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>이상협</td>
						<td>한의402[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1570893" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>1</td>
						<td>40</td>
						<td class="small">한의학과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-025</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>홍수현</td>
						<td>한의408-1[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1571060" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의학과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100079-026</td>
						<td class="bold">지도교수세미나Ⅱ</td>
						<td>박신형</td>
						<td>한의407-1[월10](40)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>0.25</td>
						<td><a href="/lecture/view/1914310" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>40</td>
						<td class="small">한의학과(1)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100087-001</td>
						<td class="bold">사회봉사의이해</td>
						<td>김철민</td>
						<td>원격사이버강좌 (별도제한)</td>
						<td></td>
						<td>기교</td>
						<td>1 / 3</td>
						<td>1</td>
						<td><a href="/lecture/view/1741230" target="_blank" title="5"
							class="star"><span class="on" style="width: 100%;"></span></a></td>
						<td>1</td>
						<td>0</td>
						<td class="small">한국어문학과(1;2~52),중국어학과(1;53~111),일본어학과(1;112~165),영어학과(1;166~225),문헌정보학과(1;226~261),평생교육·청소년상담학과(1;262~303),유아교육과(1;304~324)
							/ 사학과(3),철학상담·심리학과(3)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100087-002</td>
						<td class="bold">사회봉사의이해</td>
						<td>김철민</td>
						<td>원격사이버강좌 (별도제한)</td>
						<td></td>
						<td>기교</td>
						<td>1 / 3</td>
						<td>1</td>
						<td><a href="/lecture/view/1741230" target="_blank" title="5"
							class="star"><span class="on" style="width: 100%;"></span></a></td>
						<td>1</td>
						<td>0</td>
						<td class="small">미디어·광고학부(1;325~433),법·경찰행정학부(1;434~536),소방방재행정학과(1;538~569),공공인재학부(1;570~677)
							/ 행정학과(3),정치외교학과(3)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100087-003</td>
						<td class="bold">사회봉사의이해</td>
						<td>김철민</td>
						<td>원격사이버강좌 (별도제한)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>1</td>
						<td><a href="/lecture/view/1741230" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>0</td>
						<td class="small">경제·금융보험·재무부동산학부(1;678~799),부동산금융·자산경영학과(1;~),무역·유통학부(1;881~1019)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100087-004</td>
						<td class="bold">사회봉사의이해</td>
						<td>김철민</td>
						<td>원격사이버강좌 (별도제한)</td>
						<td></td>
						<td>기교</td>
						<td>1 / 4</td>
						<td>1</td>
						<td><a href="/lecture/view/1741230" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>0</td>
						<td class="small">경영학부(1;1020~1155),정보경영학부(1;1156~1236),호텔관광외식경영학부(1;1237~1402)
							/ 자연과학대학(4)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100087-005</td>
						<td class="bold">사회봉사의이해</td>
						<td>김철민</td>
						<td>원격사이버강좌 (별도제한)</td>
						<td></td>
						<td>기교</td>
						<td>1 / 2 / 4</td>
						<td>1</td>
						<td><a href="/lecture/view/1741230" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>0</td>
						<td class="small">간호학과(1;1403~1512),임상병리학과(1;1513~1562),치위생학과(1;1563~1602),방사선학과(1;1603~1627),의료경영학과(1;1628~1657),물리치료학과(1;1658~1697),보육·가정상담학과(1;1698~1739),식품영양학과(1;1741~1788)
							/ 한의과대학(2) / IT융합부품소재공과대학(4)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100087-006</td>
						<td class="bold">사회봉사의이해</td>
						<td>김철민</td>
						<td>원격사이버강좌 (별도제한)</td>
						<td></td>
						<td>기교</td>
						<td>1 / 3 / 4</td>
						<td>1</td>
						<td><a href="/lecture/view/1741230" target="_blank" title="0"
							class="star"><span class="on" style="width: 0%;"></span></a></td>
						<td>0</td>
						<td>0</td>
						<td class="small">음악학과(1;~),디자인조형학과(1;3615~3708),패션디자인학과(1;3710~3753),체육학과(1;3755~3804),레저스포츠태권도학부(1;3805~3880)
							/ 미술학과(3),산업디자인학과(3) / ICT공과대학(4)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100108-001</td>
						<td class="bold">기본영어</td>
						<td>권성진</td>
						<td>2인207[수5-6],[금6](60)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672406" target="_blank"
							title="3.18" class="star"><span class="on"
								style="width: 63.6%;"></span></a></td>
						<td>37</td>
						<td>60</td>
						<td class="small">한국어문학과(1;2~52)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100108-002</td>
						<td class="bold">기본영어</td>
						<td>권성진</td>
						<td>2인409[목4],[금7-8](70)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672406" target="_blank"
							title="2.94" class="star"><span class="on"
								style="width: 58.8%;"></span></a></td>
						<td>49</td>
						<td>70</td>
						<td class="small">중국어학과(1;53~111)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100108-003</td>
						<td class="bold">기본영어</td>
						<td>권성진</td>
						<td>2인410[화2],[수2-3](70)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672406" target="_blank"
							title="2.96" class="star"><span class="on"
								style="width: 59.2%;"></span></a></td>
						<td>37</td>
						<td>70</td>
						<td class="small">일본어학과(1;112~165)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100108-004</td>
						<td class="bold">기본영어</td>
						<td>김경미</td>
						<td>2인311[화3],[목2-3](70)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672404" target="_blank"
							title="3.03" class="star"><span class="on"
								style="width: 60.6%;"></span></a></td>
						<td>38</td>
						<td>70</td>
						<td class="small">영어학과(1;166~225)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100108-005</td>
						<td class="bold">기본영어</td>
						<td>김경미</td>
						<td>1인610[화4],[금3-4](60)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672404" target="_blank"
							title="3.64" class="star"><span class="on"
								style="width: 72.8%;"></span></a></td>
						<td>34</td>
						<td>60</td>
						<td class="small">문헌정보학과(1;226~261)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100108-006</td>
						<td class="bold">기본영어</td>
						<td>안은주</td>
						<td>1인102[화4],[금3-4](70)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672405" target="_blank"
							title="4.04" class="star"><span class="on"
								style="width: 80.8%;"></span></a></td>
						<td>52</td>
						<td>70</td>
						<td class="small">평생교육·청소년상담학과(1;262~303),유아교육과(1;304~324)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100108-007</td>
						<td class="bold">기본영어</td>
						<td>곽응경</td>
						<td>1인314[화4],[금3-4](60)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672403" target="_blank"
							title="4.5" class="star"><span class="on" style="width: 90%;"></span></a></td>
						<td>39</td>
						<td>60</td>
						<td class="small">미디어·광고학부(1;325~378)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100108-008</td>
						<td class="bold">기본영어</td>
						<td>권성진</td>
						<td>1인501[화4],[금3-4](66)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672406" target="_blank"
							title="3.18" class="star"><span class="on"
								style="width: 63.6%;"></span></a></td>
						<td>39</td>
						<td>66</td>
						<td class="small">미디어·광고학부(1;379~433)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100108-009</td>
						<td class="bold">기본영어</td>
						<td>곽응경</td>
						<td>법정402[월4],[수5-6](70)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672403" target="_blank"
							title="4.5" class="star"><span class="on" style="width: 90%;"></span></a></td>
						<td>47</td>
						<td>70</td>
						<td class="small">법·경찰행정학부(1;434~485)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100108-010</td>
						<td class="bold">기본영어</td>
						<td>김은지</td>
						<td>법정207[월4],[수5-6](60)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672407" target="_blank"
							title="4.77" class="star"><span class="on"
								style="width: 95.4%;"></span></a></td>
						<td>48</td>
						<td>60</td>
						<td class="small">법·경찰행정학부(1;486~536)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100108-011</td>
						<td class="bold">기본영어</td>
						<td>박지영</td>
						<td>본관501[월1-2],[화2](50)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672408" target="_blank"
							title="2.29" class="star"><span class="on"
								style="width: 45.8%;"></span></a></td>
						<td>19</td>
						<td>50</td>
						<td class="small">소방방재행정학과(1;538~569)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100108-012</td>
						<td class="bold">기본영어</td>
						<td>곽응경</td>
						<td>법정408[월1-2],[화2](64)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672403" target="_blank"
							title="4.45" class="star"><span class="on"
								style="width: 89%;"></span></a></td>
						<td>42</td>
						<td>64</td>
						<td class="small">공공인재학부(1;570~623)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100108-013</td>
						<td class="bold">기본영어</td>
						<td>김은지</td>
						<td>법정205[월1-2],[화2](60)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672407" target="_blank"
							title="4.33" class="star"><span class="on"
								style="width: 86.6%;"></span></a></td>
						<td>51</td>
						<td>60</td>
						<td class="small">공공인재학부(1;624~677)</td>
						<td class="small"></td>
					</tr>
					<tr>
						<td>100108-014</td>
						<td class="bold">기본영어</td>
						<td>박지영</td>
						<td>상경413[화3],[목2-3](70)</td>
						<td></td>
						<td>기교</td>
						<td>1</td>
						<td>3</td>
						<td><a href="/lecture/view/1672408" target="_blank"
							title="2.22" class="star"><span class="on"
								style="width: 44.4%;"></span></a></td>
						<td>27</td>
						<td>70</td>
						<td class="small">경제·금융보험·재무부동산학부(1;678~739)</td>
						<td class="small"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="13"></td>
					</tr>
				</tfoot>
			</table>
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