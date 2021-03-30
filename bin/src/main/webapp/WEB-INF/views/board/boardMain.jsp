<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="../layout/header.jsp" %>
<title>메인 페이지</title>
<%@include file ="../layout/submenu.jsp" %>
   <div id="container" class="community">
        <aside class="none">
          <form class="search">
            <input type="search" name="keyword" class="text" placeholder="전체 게시판의 글을 검색하세요!">
          </form>
          <div class="title">
            <a class="hamburger"></a>
            <h1>동의대 에브리타임</h1>
            <ol class="buttons">
              <li><a id="searchArticle">글 검색</a></li>
            </ol>
          </div>
        </aside>
        <div class="banners">
          <a href="https://ad.everytime.kr/adClick?adToken=fjpYoRNwndxMcFJnp66KyB3R3ovhrCg0JbkIQsNNOimmC6BkS%2FmB%2BdeyS4yVG08K0%2FrgpcVhLGs5asmqDznXuRC3c70MOZcHo2M7PHxkzYdHwR5%2F6bZOG%2FIWZafO%2FLEJx32wsPgTKp1rGpoamDmK3ifVSTaaKfipoNKBpxqrwwbKyzsTGzpVV1AMhbh5gTXFgJe%2BtugRZABF84YGRcpi9u9kqpeV7WpS3pnfb0uO8hILL5vXNvmoPQ3oEWnDb0c2"><img src="https://cf-eba.everytime.kr/20210305_Naver2_internship_home.jpg"></a>
        </div>
        <div class="leftside">
          <div class="card pconly">
            <form class="logged">
              <img src="https://cf-fpi.everytime.kr/0.png" class="picture">
              <p class="nickname">학새엥123</p>
              <p class="school">진경빈</p>
              <p class="school">skjin20800</p>
              <ul class="buttons">
                <li><a href="/my">내 정보</a></li>
                <li><a href="/logout">로그아웃</a></li>
              </ul>
              <hr>
            </form>
          </div>
          <div class="card">
            <div class="menus">
              <a href="/myboard" class="myarticle">내가 쓴 글</a>
              <a href="/myboard/myreply" class="mycommentarticle">댓글 단 글</a>
              <a href="/myboard/scrap" class="myscrap" >내 스크랩</a>
              <hr>
            </div>
          </div>
          <div class="card">
            <div class="banner">
              <a href="https://ad.everytime.kr/adClick?adToken=niovGR2dwj0LxRPYHyvq6zbk7uibduGjhHekGX3CpSGKXAhCjRhgV4n1Nfi%2FGBU2H1x7Mt5UfuoupUlMEAc34%2Bq%2FVX2kG5jiO6%2FcH2IA6Q6UmmxnC0997rw73aIKcwz8i2dCoNHycVGx9zjkEE19WvlcGPKBrWzQsLLZJ4Y0tP4hnhGFk6AtvhZ6apQrKwvTNCZeHUA51xLtbNkAEKNSoHHpt5e2T7WWvHL%2FEsJag8ydJT%2Bz%2FfnPaNh1jPqJXRGX"><img src="https://cf-eba.everytime.kr/20210306_MIRAEASSET_challenge_card.png"></a>
            </div>
          </div>
          <div class="card">
            <div class="banner">
              <a href="https://ad.everytime.kr/adClick?adToken=niovGR2dwj0LxRPYHyvq6zbk7uibduGjhHekGX3CpSGKXAhCjRhgV4n1Nfi%2FGBU2H1x7Mt5UfuoupUlMEAc34%2Bq%2FVX2kG5jiO6%2FcH2IA6Q6UmmxnC0997rw73aIKcwz8i2dCoNHycVGx9zjkEE19WvlcGPKBrWzQsLLZJ4Y0tP5G54qJwfwu1kBOYCWXsIUGKKEmalYUi3Om09D6s3UiBk5ZnvkHLrpYm2cYV1nbYZHfaXnygo%2F%2BgFJtzjvPJC5p"><img src="https://cf-eba.everytime.kr/20210301_samsung_cardpromotion_card.jpg"></a>
            </div>
          </div>
          <div class="card">
            <div class="banner">
              <a href="https://ad.everytime.kr/adClick?adToken=niovGR2dwj0LxRPYHyvq6zbk7uibduGjhHekGX3CpSGKXAhCjRhgV4n1Nfi%2FGBU2H1x7Mt5UfuoupUlMEAc34%2Bq%2FVX2kG5jiO6%2FcH2IA6Q6UmmxnC0997rw73aIKcwz8i2dCoNHycVGx9zjkEE19WvlcGPKBrWzQsLLZJ4Y0tP4Dd3wWTZrIFyqJFk%2FJ6e9SWspzjdKHVwFeWoqmvFdNR%2BoTm5J29CAaIq7dssYwVigCE3AMUmgfIzVHG36UwOt%2F"><img src="https://cf-eba.everytime.kr/20210308_SAPkorea_IT_card.png"></a>
            </div>
          </div>
        </div>
        <%@include file="../layout/realtimemenu.jsp"%>        
        
        <div class="main"><div class="card"><div class="board"><h3><a href="/389150">자유게시판</a></h3><a class="list" href="/389150/v/175399047"><time>6분 전</time><p>밤샐때</p><hr></a><a class="list" href="/389150/v/175398879"><time>7분 전</time><p>국장 받으려면</p><hr></a><a class="list" href="/389150/v/175398779"><time>7분 전</time><p>검도도복이쁘더랑</p><hr></a><a class="list" href="/389150/v/175398423"><time>8분 전</time><p>서비스 경영론</p><hr></a></div></div><div class="card"><div class="board"><h3><a href="/259143">비밀게시판</a></h3><a class="article" href="/259143/v/175395542"><p>20학번 친해질 사람 ㅠㅠ 다들 친구 어떻게 사귄거야 ,,</p><time>18분 전</time><ul class="status"><li class="vote active">0</li><li class="comment active">4</li></ul><hr></a><a class="article" href="/259143/v/175389308"><p>20대후반 남자 생일 선물 뭐가 좋을까</p><time>39분 전</time><ul class="status"><li class="vote active">0</li><li class="comment active">6</li></ul><hr></a></div></div><div class="card"><div class="board"><h3><a href="/389426">졸업생게시판</a></h3><a class="article" href="/389426/v/175391506"><p>혹시 과탑해보신 분 계신가요,,?<br>질문드릴려구요</p><time>31분 전</time><ul class="status"><li class="vote active">0</li><li class="comment active">2</li></ul><hr></a><a class="article" href="/389426/v/175343532"><p>진영완 교수님 인체해부학 책 사정이 생겨서 다음주에나 살 수 있을 것 같은데 담주 월.화만 빌려줄 수 있는 선배님 계십니까 ㅠㅠㅠ....</p><time>03/11 13:34</time><ul class="status"><li class="vote active">0</li><li class="comment active">0</li></ul><hr></a></div></div><div class="card"><div class="board"><h3><a href="/389239">새내기게시판</a></h3><a class="article" href="/389239/v/175400711"><p>문학과 삶 박지영 교수는 과제 뭔지 아는사람??</p><time>방금</time><ul class="status"><li class="vote active">0</li><li class="comment active">0</li></ul><hr></a><a class="article" href="/389239/v/175400339"><p>종강 언제 하나 나는야 베짱이</p><time>2분 전</time><ul class="status"><li class="vote active">0</li><li class="comment active">0</li></ul><hr></a></div></div><div class="card"><div class="board"><h3><a href="/482707">시사·이슈</a></h3><a class="list" href="/482707/v/175372717"><time>03/11 15:11</time><p>대한민국에 가장높은산과 가장낮은산이 공존한다</p><hr></a><a class="list" href="/482707/v/175310758"><time>03/11 11:39</time><p>윤석열 대통령되면</p><hr></a><a class="list" href="/482707/v/175286720"><time>03/11 09:55</time><p>명 합성</p><hr></a><a class="list" href="/482707/v/175274376"><time>03/11 08:09</time><p>구라친다고 고생이 많다</p><hr></a></div></div><div class="card"><div class="board"><h3><a href="/389374">장터게시판</a></h3><a class="list" href="/389374/v/175395801"><time>17분 전</time><p>철학,논사글,기초물리학,Qskills,생명에 대한 이해 팔아요</p><hr></a><a class="list" href="/389374/v/175393570"><time>25분 전</time><p>스판 U넥 티 팜</p><hr></a><a class="list" href="/389374/v/175392805"><time>27분 전</time><p>🌸봄 원피스 팔아요🌸</p><hr></a><a class="list" href="/389374/v/175388836"><time>40분 전</time><p>컨버스 척 70 팔아요</p><hr></a></div></div><div class="card"><div class="board"><h3><a href="/259145">정보게시판</a></h3><a class="list" href="/259145/v/154870797"><time>20/12/02 05:07</time><p>안녕하세요! 동의언론사방송국입니다😊</p><hr></a><a class="list" href="/259145/v/142537462"><time>20/09/10 13:51</time><p>중앙도서관 독서PT 경연대회📚</p><hr></a><a class="list" href="/259145/v/138981863"><time>20/08/26 13:15</time><p>제 4기 중앙도서관 독서토론동아리 모집📚</p><hr></a><a class="list" href="/259145/v/96322939"><time>19/12/10 00:50</time><p>출석인정 및 공결안내표</p><hr></a></div></div><div class="card"><div class="board"><h3><a href="/389322">취업·진로</a></h3><a class="list" href="/389322/v/174394794"><time>03/08 17:34</time><p>자동차공하과 3학년인데</p><hr></a><a class="list" href="/389322/v/173974155"><time>03/07 16:39</time><p>선배님들..ㅜㅜ</p><hr></a><a class="list" href="/389322/v/172090121"><time>03/03 01:07</time><p>잡서포터즈 모집 주능(~3/10일까지)</p><hr></a><a class="list" href="/389322/v/171929677"><time>03/02 20:14</time><p>용접 실기 어렵나요?</p><hr></a></div></div><div class="card"><div class="board"><h3><a href="/367573">홍보게시판</a></h3><a class="list" href="/367573/v/175202885"><time>03/10 23:21</time><p>💕21모임💕</p><hr></a><a class="list" href="/367573/v/175100600"><time>03/10 17:36</time><p>[ 부산 / 서면 ] 일본어 일반회화반을 모집합니다^^</p><hr></a><a class="list" href="/367573/v/174846469"><time>03/09 22:08</time><p>🇺🇸영어 학원 조교 아르바이트 구합니다🇺🇸</p><hr></a><a class="list" href="/367573/v/174776319"><time>03/09 18:19</time><p>부산범죄피해자지원센터 인권지킴이단 모집</p><hr></a></div></div><div class="card"><div class="board"><h3><a href="/418900">동아리·학회</a></h3><a class="list" href="/418900/v/175393562"><time>25분 전</time><p>🌝동의검도부🌝에서 신입생을 모십니당✨</p><hr></a><a class="list" href="/418900/v/175365110"><time>03/11 14:48</time><p>🥋동의유도부 23기 부원 모집🥋</p><hr></a><a class="list" href="/418900/v/175362266"><time>03/11 14:38</time><p>별나래 타로맛집이네</p><hr></a><a class="list" href="/418900/v/175339927"><time>03/11 13:22</time><p>보드동아리</p><hr></a></div></div><hr><div class="bookstore"><a class="item" href="https://bookstore.everytime.kr"><div class="image" style="background-image: url(&quot;https://cf-cii.everytime.kr/0dd9dcb5b4cf53579fd258e0c45b67d32ad54de24c66148ac73032816cd9621a/1615446425931_0_thumb.jpg&quot;);"></div><h4>완벽한 공부법</h4><span class="price">10,000원</span></a><a class="item" href="https://bookstore.everytime.kr"><div class="image" style="background-image: url(&quot;https://cf-cii.everytime.kr/56cf633954acad38f575e7688eabc4c8ccd055a8488e14b2fe73d2bfec35fad0/1615446357405_0_thumb.jpg&quot;);"></div><h4>교육연구방법의 이해(5판)</h4><span class="price">10,000원</span></a><a class="item" href="https://bookstore.everytime.kr"><div class="image" style="background-image: url(&quot;https://cf-cii.everytime.kr/3eedd69a4e2d2ce443c8650456eb8acb84bcabf49c9521ba0803407ed59508e2/1615446298947_0_thumb.jpg&quot;);"></div><h4>아동권리와 복지</h4><span class="price">10,000원</span></a><a class="item" href="https://bookstore.everytime.kr"><div class="image" style="background-image: url(&quot;https://cf-cii.everytime.kr/9d43389117ab86bc8c8fc20f643ef08d873659c09a830737e9e7b1f76833be06/1615446225798_0_thumb.jpg&quot;);"></div><h4>놀이지도(아이와 교사가 즐거운)</h4><span class="price">10,000원</span></a></div></div>
      </div>
<%@include file="../layout/submenu.jsp"%>

      <script type="text/javascript">
        var _serverTime = 1615448854119;
        var _clientTime = new Date().getTime();
        var _diffTime = _clientTime - _serverTime;
        var _apiServerUrl = 'https://api.everytime.kr';
      </script>
      <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-22022140-4"></script>
      <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'UA-22022140-4');
      </script>
    
  
  </body>
</html>