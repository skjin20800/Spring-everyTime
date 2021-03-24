package com.everytime.project.domain.board;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import org.hibernate.annotations.CreationTimestamp;

import com.everytime.project.domain.board.like.Likes;
import com.everytime.project.domain.board.reply.Reply;
import com.everytime.project.domain.user.User;
import com.everytime.project.domain.user.scrap.Scrap;
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
public class Board {
	
	@Id //Primary Key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id; //시퀀스, auto_increment
	
	@Column(nullable = false, length = 100)
	private String title;
	
	@Lob
	private String content;
	
	@Enumerated(EnumType.STRING) // Enum값을 DB에넣을때 STRING으로 바꿔넣어준다
	private BoardType type; // FREE, 기타 타입
	
	@Lob
	private String url;
	
	@Column(nullable = false, length = 100)
	private Boolean isAnonymous;
			
	@CreationTimestamp
	private Timestamp createDate;
	
	@ManyToOne
	@JoinColumn(name = "userId")
	private User user;
	
	//양방향 매핑
	@OneToMany(mappedBy = "board",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({"board"})
	@OrderBy("id desc")
	private List<Reply> replys;
//
	 
		//양방향 매핑
		@OneToMany(mappedBy = "board",fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
		@JsonIgnoreProperties({"board"})
		@OrderBy("id desc")
		private List<Likes> likes;
		
		//양방향 매핑
		@OneToMany(mappedBy = "board", cascade = CascadeType.REMOVE)
		@JsonIgnoreProperties({"board"})
		@OrderBy("id desc")
		private List<Scrap> scraps;
}
