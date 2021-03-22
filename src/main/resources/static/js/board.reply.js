
  $("#replyPost").on("click", (e)=>{
	e.preventDefault(); //form태그 action안타게 막아버리는것

let postId = $("#postId").val();

  	let data = {
		content: $("#reply").val(),
		isAnonymous: $('input:checkbox[name=isAnonymous]').is(':checked')
	};
      
      $.ajax({
		type: "POST",
		url: "/reply/"+postId,
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType:"json"
	}).done((res)=>{
		console.log(res);
		if(res.statusCode === 1){
			alert("게시글 작성에 성공하였습니다.");
			 location.reload();
		}else{
			alert("게시글 작성에 실패하였습니다.");
		}
	});
      
});

/*글쓰기 완료*/


