package com.everytime.project.web.dto.like;


	

	import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.PostLoad;
import javax.persistence.Transient;

import com.everytime.project.domain.board.BoardType;
import com.everytime.project.domain.board.like.Likes;
import com.everytime.project.domain.board.reply.Reply;
import com.everytime.project.domain.user.User;
import com.everytime.project.domain.user.scrap.Scrap;
import com.everytime.project.util.BoardName;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;


	@Data
	public class LikeBestRespDto {
		
		
		private Long id;		
		private String title;		
		private String content;		
		private BoardType type; // FREE, 기타 타입		
		private String url;		
		private Boolean isAnonymous;		
		private Timestamp createDate;		
		private User user;		
		private List<Reply> replys;		 
		private List<Likes> likes;
		private List<Scrap> scraps;
		private int likeCount;


}
