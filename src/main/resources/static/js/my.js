function updateOauth() {
	event.preventDefault();
	let data = $("#oauthUpdateForm").seriallize();

	alert("my.js  - Oauth변경 작동되나?");
	$.ajax({
		type: "put",
		url: "/my/oauthUpdate",
		data: data,
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "json"
	}).done(res => {
			location.href = "/"
	});
}
function updateEmail() {
	event.preventDefault();
	let data = $("#emailUpdateForm").seriallize();

	alert("my.js  - Email변경 작동되나?");
	$.ajax({
		type: "put",
		url: "/my/emailUpdate",
		data: data,
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "json"
	}).done(res => {
		if (res.statusCode === 1) {

			alert("이메일 수정에  성공하였습니다.");
			alert(res.msg);
			history.go(-1);
		} else {

			alert("이메일 수정에 실패하였습니다.");
			alert(res.msg);
		}
	});
}
function updateUniversity() {
	event.preventDefault();
	let data = $("#universityUpdateForm").seriallize();

	$.ajax({
		type: "put",
		url: "/my/universityUpdate",
		data: data,
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "json"
	}).done(res => {
		if (res.statusCode === 1) {

			alert("대학교 수정에  성공하였습니다.");
			alert(res.msg);
			history.go(-1);
		} else {

			alert("대학교 수정에 실패하였습니다.");
			alert(res.msg);
		}
	});
}
$("#newPasswordCheck").focusout(function() {
	var pwd1 = $("#newPassword").val();
	var pwd2 = $("#newPasswordCheck").val();

	if (pwd1 != '' && pwd2 == '') {
		null;
	} else if (pwd1 != "" || pwd2 != "") {
		if (pwd1 == pwd2) {
			$("#alert-success").css('display', 'inline-block');
			$("#alert-danger").css('display', 'none');
		} else {
			$("#alert-success").css('display', 'none');
			$("#alert-danger").css('display', 'inline-block');
		}
	}
});

function updatePassword() {
	event.preventDefault();
	let data = $("#passwordUpdateForm").serialize();

	$.ajax({
		type: "put",
		url: "/my/passwordUpdate",
		data: data,
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		dataType: "json"
	}).done(res => {
		if (res.statusCode === 1) {

			alert("패스워드 수정에  성공하였습니다.");
			alert(res.msg);
			history.go(-1);
		} else {

			alert("페스워드 수정에 실패하였습니다.");
			alert(res.msg);
		}
	});
}
