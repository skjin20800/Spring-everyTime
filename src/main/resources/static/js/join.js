/*글쓰기 완료*/

	
  $("#joinPost").on("click", (e)=>{
	e.preventDefault(); //form태그 action안타게 막아버리는것
  	let data = {
		username: $("#username").val(),
		password: $("#password").val(),
		nickname: $("#nickname").val(),
		email: $("#email").val(),
		university: $("#university").val(),		
		entranceYear: $("#entranceYear").val(),
	};
      
      $.ajax({
		type: "POST",
		url: "/join",
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType:"json"
	}).done((res)=>{
		
		if(res.statusCode === 1){
			alert("회원가입에 성공하였습니다.");
		location.href='/loginForm'
		}else{
			alert("회원정보를 확인해주세요.");
		}
	});
      
});

/*글쓰기 완료*/


