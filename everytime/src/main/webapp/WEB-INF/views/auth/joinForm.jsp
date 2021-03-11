<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블로그</title>
</head>
<body>
<h1>회원가입 페이지</h1>

<hr/>
<form action="/join" method="POST">
<input type ="text" placeholder="아이디를 입력해주세요" name = "username"/> <br/>
<input type = "password" placeholder="패스워드를 입력해주세요" name ="password"/> <br/>
<input type ="text" placeholder="별명을 입력해주세요" name = "nickname"/> <br/>
<input type = "email" placeholder="Email을 입력해주세요" name ="email"/> <br/>
<input type ="text" placeholder="대학교을 입력해주세요" name = "university"/> <br/>
<input type ="text" placeholder="학번을 입력해주세요" name = "entranceYear"/> <br/>
<button>회원가입</button>

</form>
이미 회원가입이 되셨나요? <a href="/loginForm">로그인</a>
</body>
</html>