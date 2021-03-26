/*게시글 스크랩 클릭시 */
function boardScrap(id){
	
	 if (confirm("정말 스크랩 하시겠습니까??") == true){    //확인
        }else{   //취소
            return;
          }
	
	       $.ajax({
		type: "POST",
		url: "/scrap/"+id,
		dataType:"json"
	}).done((res)=>{
		console.log(res);
		if(res.statusCode === 1){
			 location.reload();
		}else{
			alert("이미 스크랩 하였습니다.");
		}
	});
}
/*게시글 스크랩 클릭시 끝 */


