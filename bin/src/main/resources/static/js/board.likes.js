/*게시글 좋아요 클릭시 */
function boardLike(id){
	       $.ajax({
		type: "POST",
		url: "/likes/board/"+id,
		dataType:"json"
	}).done((res)=>{
		
		if(res.statusCode === 1){
			 location.reload();
		}else{
			alert("이미 공감 하였습니다.");
		}
	});
}
/*게시글 좋아요 클릭시 끝 */

/*댓글 좋아요 클릭시 */
function replyLike(id){
	       $.ajax({
		type: "POST",
		url: "/likes/reply/"+id,
		dataType:"json"
	}).done((res)=>{
		
		if(res.statusCode === 1){
			 location.reload();
		}else{
			alert("이미 공감 하였습니다.");
		}
	});
}
/*댓글 좋아요 클릭시 끝 */

/*대댓글 좋아요 클릭시 */
function reReplyLike(id){
	       $.ajax({
		type: "POST",
		url: "/likes/rereply/"+id,
		dataType:"json"
	}).done((res)=>{
		
		if(res.statusCode === 1){
			 location.reload();
		}else{
			alert("이미 공감 하였습니다.");
		}
	});
}
/*대댓글 좋아요 클릭시 끝 */
