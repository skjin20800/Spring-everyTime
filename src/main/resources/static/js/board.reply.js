
/*댓글쓰기*/
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
		
		if(res.statusCode === 1){
			alert("댓글 작성에 성공하였습니다.");
			 location.reload();
		}else{
			alert("댓글 작성에 실패하였습니다.");
		}
	});
      
});



/*댓글쓰기 완료*/

/*댓글 삭제*/
function deleteReply(id){
	
 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
        }else{   //취소
            return;
          }
	
    $.ajax({
		type: "DELETE",
		url: "/reply/"+id,
		dataType:"json"
	}).done((res)=>{
		
		if(res.statusCode === 1){
		$("#reply-"+id).remove();
		}else{
			alert("삭제에 실패하였습니다.");
		}
	});
}
/*댓글 삭제 완료*/







