/*게시글 스크랩 클릭시 */
boardScrap();
console.log("aa");
function boardScrap(){
	       $.ajax({
		url: "likes/bestList",
	}).done((res)=>{
		console.log(res);
	});
}
/*게시글 스크랩 클릭시 끝 */


