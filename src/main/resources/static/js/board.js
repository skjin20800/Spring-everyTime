

/*글삭제*/
function deleteBoard(id){
	
 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
        }else{   //취소
            return;
          }
	
    $.ajax({
		type: "DELETE",
		url: "/board/"+id,
		dataType:"json"
	}).done((res)=>{
		
		if(res.statusCode === 1){
		 history.go(-1);
		}else{
			alert("삭제에 실패하였습니다.");
		}
	});
}
/*글삭제 끝*/

/*수정 기본 Form*/
      $("#writeBoardContainer").prepend(
	`<form class="write" id = "writeBoard">
	<input type="hidden" id="boardId" >
	<p><input id="title" placeholder="글 제목" class="title"></p>
	<p style="margin-bottom: 0px !important;">
	<textarea id="content" class="smallplaceholder large">
</textarea></p>
<input class="file" type="file" name="file" multiple="multiple">
<ol class="thumbnails">
<li class="new"></li>
</ol>
<div class="clearBothOnly"></div>
<ul class="option">
<li title="해시태그" class="hashtag"></li>
<li title="첨부" class="attach"></li>
<li title="완료" class="submit" id="writePut"></li>
<li class="anonym">
<input type="checkbox" class="form-check-input" id="isAnonymous" name="isAnonymous">
 <label class="form-check-label" for="exampleCheck1"> 익명 </label>
</li>
</ul>
<div class="clearBothOnly"></div>
</form>
`);
/*수정 기본 Form*/

$("#writeBoard").hide(); // Hide
var toggle = false;

/*기존 정보 뿌리기*/
function updateBoard(id,content,title,isAnonymous){
	toggle = !toggle;
	if(toggle == true){
		document.getElementById("boardId").value = `${id}`;
		
		document.getElementById("content").value = `${content}`;
		document.getElementById("title").value = `${title}`;
		$('input:checkbox[name=isAnonymous]').prop("checked",`${isAnonymous}`);
		 
	$("#goListButton").text("수정 취소");
	$("#goListButton").attr('onClick','updateCancel()','');
	
		$("#writeBoard").show(); //Show
		$("#boardInfo").hide(); //Show
		
	}else{		
		
		$("#writeBoard").hide(); // Hide
			$("#boardInfo").show(); //Show
	}
}
/*기존 정보 뿌리기*/

/*글 수정 완료*/
  $("#writePut").on("click", (e)=>{
	e.preventDefault(); //form태그 action안타게 막아버리는것

	let id = $("#boardId").val();
  	let data = {
		content: $("#content").val(),
		title: $("#title").val(),
		isAnonymous: $('input:checkbox[name=isAnonymous]').is(':checked')
	};
      
      $.ajax({
		type: "PUT",
		url: "/board/post/"+id,
		data: JSON.stringify(data),
		contentType: "application/json; charset=utf-8",
		dataType:"json"
	}).done((res)=>{
		
		if(res.statusCode === 1){
			alert("게시글 수정에  성공하였습니다.");
			 location.reload();
		}else{
			alert("게시글 수정에 실패하였습니다.");
		}
	});
      
});

/*글 수정 완료*/

function updateCancel(){
		 location.reload();
}

