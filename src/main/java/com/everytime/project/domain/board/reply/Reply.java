package com.everytime.project.domain.board.reply;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.PostLoad;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;

import com.everytime.project.domain.board.Board;
import com.everytime.project.domain.board.like.Likes;
import com.everytime.project.domain.board.reply.rereply.ReReply;
import com.everytime.project.domain.user.User;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
public class Reply {
	@Id //Primary Key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id; //시퀀스, auto_increment
	
	@Lob
	private String content;
	
	@Column(nullable = false, length = 100)
	private Boolean isAnonymous;
	
	@CreationTimestamp
	private Timestamp createDate;
	
	@ManyToOne
	@JoinColumn(name = "userId") // 테이블에 user_Id로적힘
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "boardId")
	private Board board;
	
	//양방향 매핑
	@OneToMany(mappedBy = "reply",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({"reply"})
   @OrderBy("id desc")
	private List<ReReply> rereplys;

	//양방향 매핑
		@OneToMany(mappedBy = "reply",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
		@JsonIgnoreProperties({"reply"})
		@OrderBy("id desc")
		private List<Likes> likes;
		
		@Transient // 칼럼이 만들어지지 않는다.
		private String dateSubstr;
		@Transient
		private int rereplyCount;
		@Transient
		private int likeCount;
	
		@PostLoad //select 되자마자 실행된다.
		public void dateSubstr() {
			this.dateSubstr = createDate.toString().substring(5, 16);  
			this.rereplyCount = rereplys.size();
			this.likeCount = likes.size();
		}
		
		
		
		  


	
}