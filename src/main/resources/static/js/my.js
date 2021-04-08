$("#oauthPut").on("click", (e) => {
	e.preventDefault();
	let data = {
		nickname: $("#nickname").val(),
		university: $("#university").val(),
		entranceYear: $("#entranceYear").val(),
		username: $("#username").val()
	};
	$.ajax({
		type: "put",
		url: "/my/oauthUpdate",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(res => {
		if (res.statusCode === 1) {
			alert("인증에 성공하였습니다.");
			history.go(-1);
		} else{
			alert("동일한 닉네임이 존제합니다.");
		}
	});
});
$("#emailPut").on("click", (e) => {
	e.preventDefault();
	let data = {
		email: $("#email").val(),
		password: $("#password").val(),
		username: $("#username").val()
	};

	$.ajax({
		type: "PUT",
		url: "/my/emailUpdate",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(res => {
		if (res.statusCode === 1) {

			alert("이메일 수정에  성공하였습니다.");
			history.go(-1);
		} else {

			alert("비밀번호를 잘못 입력하셨습니다.");
		}
	});
});
$("#universityPut").on("click", (e) => {
	e.preventDefault();
	let data = {
		university: $("#university").val(),
		password: $("#password").val(),
		username: $("#username").val()
	};
	$.ajax({
		type: "put",
		url: "/my/universityUpdate",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(res => {
		if (res.statusCode === 1) {

			alert("대학교 수정에  성공하였습니다.");
			history.go(-1);
		} else {

			alert("비밀번호를 잘못 입력하셨습니다.");
		}
	});
});
$("#newpasswordCheck").focusout(function() {
	var pwd1 = $("#newpassword").val();
	var pwd2 = $("#newpasswordCheck").val();

	if (pwd1 != '' && pwd2 == '') {
		null;
	} else if (pwd1 != "" || pwd2 != "") {
		if (pwd1 == pwd2) {
			$("#alert-success").css('display', 'inline-block');
			$("#alert-danger").css('display', 'none');
			$("#passwordPut").attr('disabled', false);
		} else {
			$("#alert-success").css('display', 'none');
			$("#alert-danger").css('display', 'inline-block');
			$("#passwordPut").attr('disabled', true);
		}
	}
});

$("#passwordPut").on("click", (e) => {
	e.preventDefault();
	let data = {
		newpassword: $("#newpassword").val(),
		nowpassword: $("#nowpassword").val(),
		username: $("#username").val()
	};
	$.ajax({
		type: "put",
		url: "/my/passwordUpdate",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType: "json"
	}).done(res => {
		if (res.statusCode === 1) {

			alert("비밀번호 수정에  성공하였습니다.");
			history.go(-1);
		} else {

			alert("비밀번호를 잘못 입력하셨습니다.");
		}
	});
});
