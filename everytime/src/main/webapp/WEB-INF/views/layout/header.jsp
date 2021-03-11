<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/common/commonStyle.css"  media="all" type="text/css"/>
    <title>메인 페이지</title>
</head>

<body cz-shortcut-listen="true" style>
<header>
  <nav>
    <div class="wrap">
      <div id="logo">
        <a href="/"><img src="/images/new/nav.logo.png"></a>
        <p><span class="name multiple">에브리타임</span><span class="subname">동의대</span></p>
      </div>
      <div id="account">
        <a href="/message" title="쪽지함" class="icon message">쪽지함</a></li>
        <a href="/my" title="내 정보" class="icon my">내 정보</a>
        <input type="hidden" id="userUserid" value="lonru">
        <input type="hidden" id="userSchool" value="151">
        <input type="hidden" id="userCampus" value="183">
      </div>
      <ul id="menu">
        <li class="active"><a href="/">게시판</a></li>
        <li><a href="/timetable">시간표</a></li>
        <li><a href="/lecture">강의평가</a></li>
        <li><a href="/calculator">학점계산기</a></li>
        <li><a href="/friend">친구</a></li>
        <li><a href="https://bookstore.everytime.kr/">책방</a></li>
        <li><a href="https://www.campuspick.com/">캠퍼스픽</a></li>
      </ul>
    </div>
  </nav>
  </header>