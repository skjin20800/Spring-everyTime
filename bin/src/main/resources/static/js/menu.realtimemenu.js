bestList();
function bestList(){
	
	       $.ajax({
		url: "/likes/bestList",
	}).done((res)=>{
		 let contents = res.data.content;
		
		
		  for(var i = 0; i<contents.length; i++){
			
			var cardGrid = $("#bestContainer");
			var newDiv = document.createElement("a");
                  newDiv.setAttribute( 'href', `/boardDetail/${contents[i].id}` );
				newDiv.className = 'article';
				
			var cardDetail = `<p class="title">${contents[i].title}</p>`;
			 cardDetail += `<p class="small">${contents[i].content}</p>`;
			 cardDetail += `<h4>${contents[i].typeName}</h4>`;
			 cardDetail += `<ul class="status">`;
			 cardDetail += `<li class="vote active">${contents[i].likeCount}</li>`;
			 cardDetail += `<li class="comment active">${contents[i].replyCount}</li>`;
			 cardDetail += `</ul><hr>`;
			newDiv.innerHTML = cardDetail;
			cardGrid.append(newDiv);
		}		
		
		
	});
}

