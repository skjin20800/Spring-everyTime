# SpringBoot-EveryTime


안녕하세요. 진경빈입니다.  
에브리타임 홈페이지를 Spring-Boot를 이용하여 제작했습니다.
팀 프로젝트로 진행이 되었습니다.

인원은 2명으로 각자 파트를 맡아서 진행되었습니다

진경빈 파트 : 로그인, 회원가입, 게시판입니다.
김현직 파트: 회원정보 수정, Oauth로그인, 시간표 입니다.

프로젝트 기간 : 2021-03-11일 ~ 2021~04-07일


# 목차
- 홈페이지 시연 영상
- 기능
- 사용 기술
	- Front end
	- Back end
	- 배포
	- 도식화
 - 개발 환경 
    - 기존 의존성
    - 추가 의존성
    - Mysql
 - 화면별 기능설명
 - DB 초기 데이터
 -  블로그 주소
  
# 진경빈 - 구현 영상 (그림을 클릭하세요)
[![Video Label](http://img.youtube.com/vi/kc0yDIMrTlE/1.jpg)](https://youtu.be/kc0yDIMrTlE)

# 김현직 - 구현 영상 (그림을 클릭하세요)
[![Video Label](http://img.youtube.com/vi/kc0yDIMrTlE/1.jpg)](https://youtu.be/kc0yDIMrTlE)



# 진경빈 구현한 기능 
- 회원가입
- 로그인
- 게시판 
  - 글 쓰기
  - 글 수정
  - 글 삭제
  - 글 제목 검색 
- 댓글 
  - 댓글 쓰기
  - 댓글 삭제
  - 대댓글 쓰기
  - 대댓글 삭제
- 실시간 인기글 TOP3
- 전체 게시판 리스트 출력
- AOP Vaildation 체크
- Batch Exception 처리

# 김현직 구현한 기능 
- OAuth2 -Facebook 로그인
- 비밀번호 수정
- 이메일 수정
- 학교 수정
- 시간표 검색
- 시간표 등록
- 학교API 가져오기
- 기타등등 추가할것


# 사용 기술
 
## Front end

  - JSP - [EveryTime 홈페이지 카피]
  - CSS- [EveryTime 홈페이지 카피]
  - JQuery
  - Bootstarp
  - Javascript
  
  ## Back end

  - MVC
     - Contrlloer
     - Service
     - Model
     - Repository
         - DB-MySQL
     - JPA
         - @Query
         - NamingQuery
         - Join
         - Pageable
     - DTO
  - AJAX
  - AOP
      - Valid
  - Batch
     - Exceipton


## 배포 -예정
- AWS
- ubuntu
- Putty
- Docker
- tomcat
- Mysql

![AWS](./mdimg/AWS.png)
![docker1](./mdimg/docker1.png)

<br>
<br>
  
## 도식화
 ###  MVC 패턴
![MVC](./mdimg/MVC.png)

 ### 기능설계
  ![Reflection](./mdimg/Reflection.png)


## 개발환경
- 개발언어 : JAVA SpringBoot - 2.4.3V
- IDE : STS, Vscode
- DB : Mysql 8.0
- WAS :  tomcat
- 배포 : AWS - Docker

##  의존성

  - 기본 의존성
      - Spring Boot DevTools
      - Lombok
      - Spring Data JPA
      - MySQL Driver
      - Spring Security
      - OAuth2 Client
      - Spring Web
      - Validation

  - 추가 의존성
      - AOP
      - JSTL
      - security (JSP에서 사용하는것)
      - JSP 템플릿 엔진

# Mysql

DB 생성
``` 
create user 'every'@'%' identified by 'every1234';
GRANT ALL PRIVILEGES ON *.* TO 'every'@'%';
create database every;
```



## 페이지 화면별 주요 기능설명


###  1. Index페이지
### 모텔 페이지이동
 ![index_1](./mdimg/index_1.png)

 <br>
  <br>

### bootstrap - Carousel
 ![carousel](./mdimg/carousel.png)


 <br>
  <br>
  
### JQuery
 ![JQuery_1](./mdimg/JQuery_1.png)
 ![JQuery_2](./mdimg/JQuery_2.png)

<br>
<br>

### 2. 회원가입
- 닉네임 중복체크 - AJAX  [닉네임 사용가능시 비활성화]
- 필수 입력기능
  ![usernameCheck](./mdimg/usernameCheck.png)

<br>
<br>

## 3. 로그인
### 로그인된 User 정보 Session에 저장
![Login](./mdimg/Login.png)

<br>
<br>

## 4. 헤더
### 비로그인
   ![Login1](./mdimg/Login1.png)


### 로그인
![Login2](./mdimg/Login2.png)

<br>
<br>
 
## 5. 지역선택
-  전국 지역 리스트 - Bootstrapt-Dropdown 응용
-  2개지역 구현
   - 서울 - 강남 역삼 삼성 논현
   - 부산 - 서면/양정/초읍/부산시민공원
 ![Area_1](./mdimg/Area_1.png)
 ![Area_2](./mdimg/Area_2.png)
 ![Area_3](./mdimg/Area_3.png)


<br>
<br>

## 6. 지역 모텔 리스트 
### 체크인, 체크아웃 [bootstrap4 - datetimepicker]  
  - Linked Pickers
 
 ![Calender_1](./mdimg/Calender_1.png)
 ![Calender_2](./mdimg/Calender_2.png)
  <br>
  

### 모텔 리스트 출력
   - 해당지역- 모텔리스트 Select
  - Select수만큼 javascript를 이용해 출력
  
  ![MotelList](./mdimg/MotelList.png)

<br>
<br>

## 7. 모텔 정보 출력
### 6번의 정보 출력
    - 체크인, 체크아웃, 모텔정보 
### 모텔 룸 사진 출력 [bootstrap - Carousel]
![MotelInfo1](./mdimg/MotelInfo1.png)
   <br>
   <br>
   
### 체크인 가능날짜 룸 타입 출력 [AJAX]
![MotelInfo2](./mdimg/MotelInfo2.png)
<br>
<br>
  
### 체크인 불가능 날짜 룸 타입 미출력 [AJAX]
![MotelInfo3](./mdimg/MotelInfo3.png)

<br>
<br>

## 8. 예약 하기
 -  예약시 typelist테이블의 reservation = 'true'로 update
    - reservation테이블 레코드 생성
    
- 7번의 정보 출력, Session 정보 출력
     - 체크인, 체크아웃, 모텔 정보, 모텔 룸 정보, User 정보
- 정보 입력
   -  체크인 시간, 체크아웃 시간
   -  대실, 숙박 선택
![reservation](./mdimg/reservation.png)

<br>
<br>

## 9. 예약리스트 보기
- 헤더의 예약리스트 보기 클릭
  -  세션의 ID로 조회하여 예약리스트 출력
  - 세션의 ID와 예약자의 ID 일치시 예약취소(삭제) [AJAX]
      -  예약 취소시 typelist테이블의 reservation = 'false'로 update
         -   reservation 테이블 레코드 삭제
   
   ![reservationList_1](./mdimg/reservationList_1.png)
  
<br>
<br>
  
### 예약리스트가 없을 때
 ![reservationList_3](./mdimg/reservationList_3.png)
<br>

### 예약 갯수만큼 출력가능
   ![reservationList_2](./mdimg/reservationList_2.png)
<br>

### admin계정 모든 User 예약정보 출력
 ![reservationList_5](./mdimg/reservationList_5.png)
 
 <br>
 <br>
 
## 10. 예약 불가 typelist 미출력 
### 모든방이 예약 가능할때

 ![typelist_1](./mdimg/typelist_1.png)
<br>

     
### VIP방이 예약 max일때
 ![typelist_2](./mdimg/typelist_2.png)
<br>
   
### 프리미엄방이 예약 max일때
![typelist_3](./mdimg/typelist_3.png)  

<br>
<br>

#everytime 프로젝트

-spring


```MYSQL
create user 'every'@'%' identified by 'every1234';
GRANT ALL PRIVILEGES ON *.* TO 'every'@'%';
create database every;
```

<<<<<<< HEAD

# 블로그 주소
진경빈 블로그 주소 : https://blog.naver.com/skjin20800
=======
## 회원가입 후
```MYSQL 
insert into course (courseCode,courseName,major,type)values ("111","자바 기초","컴퓨터공학과","COREMAJOR");
insert into course (courseCode,courseName,major,type)values ("101","스프링 기초","컴퓨터공학과","COREMAJOR");
insert into course (courseCode,courseName,major,type)values ("102","c언어 기초","컴퓨터공학과","COREMAJOR");

insert into timetable (tableName,yearType,semesterType,userId,isStandard)values ("시간표 1","2020","1",1,true);
insert into timetable (tableName,yearType,semesterType,userId,isStandard)values ("시간표 2","2020","1",1,false);

insert into lecture (courseTarget,credit,lectureTime,professor,recommendYear,regularNumber,courseId)values ("컴퓨터공학과(2)",3,"국제403[수3-5]","교수님","2","30",1);
insert into lecture (courseTarget,credit,lectureTime,professor,recommendYear,regularNumber,courseId)values ("컴퓨터공학과(3)",3,"국제403[화3-5]","장보고","3","20",2);
insert into lecture (courseTarget,credit,lectureTime,professor,recommendYear,regularNumber,courseId)values ("컴퓨터공학과(1)",3,"국제403[목3-5]","미스터","1","40",3);

insert into studentlecture (lectureId,timetableId)values (1,1);
insert into studentlecture (lectureId,timetableId)values (2,1);
insert into studentlecture (lectureId,timetableId)values (3,1);
```
>>>>>>> 57809655768b8b9cd50d5536c04941a53930acd7
