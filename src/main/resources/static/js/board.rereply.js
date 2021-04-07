/*대댓글 버튼 클릭시 form 생성*/
function formReReply(id){
	
	if($("#rereply-"+id).val() == null || $("#rereply-"+id).val() == ""){
$("#reply-"+id).after(
	`<form class="writecomment child">
	<input type="hidden" id="rereply-${id}" value="${id}" /> 
	<input type="text" id="rereplycontent-${id}" maxlength="300" placeholder="댓글을 입력하세요." class="text" />
	<ul class="option">
	<li class="mAnmoy "><input type="checkbox" class="form-check-input" id="isAnonymous-${id}" name="isAnonymous-${id}" />
	<label class="form-check-label " for="exampleCheck1"> 익명 </label></li>
	<li title="완료" onClick="postReReply(${id})" class = "submit"><p class="center__1">&nbsp;</p></li>
	
	</ul>
	<div class="clearBothOnly"></div>
	</form>
`);	
	}else{
	
	}	
}
/*대댓글 버튼 클릭시 form 생성 끝*/

/*대댓글 글쓰기*/
function postReReply(id){

  	let data = {
		content: $("#rereplycontent-"+id).val(),
		isAnonymous: $("input:checkbox[name=isAnonymous-"+id+"]").is(':checked')
	};
	
       $.ajax({
		type: "POST",
		url: "/rereply/"+id,
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType:"json"
	}).done((res)=>{
		
		if(res.statusCode === 1){
			alert("대댓글 작성에 성공하였습니다.");
			 location.reload();
		}else{
			alert("대댓글 작성에 실패하였습니다.");
		}
	});
}
/*대댓글 글쓰기 끝*/

/*대댓글 삭제*/
function deleteReReply(id){
	
 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
        }else{   //취소
            return;
          }
	
    $.ajax({
		type: "DELETE",
		url: "/rereply/"+id,
		dataType:"json"
	}).done((res)=>{
	
		if(res.statusCode === 1){
		$("#rereply-"+id).remove();
		}else{
			alert("삭제에 실패하였습니다.");
		}
	});
}
/*대댓글 삭제 완료*/
