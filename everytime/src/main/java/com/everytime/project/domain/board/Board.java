package com.everytime.project.domain.board;

import java.sql.Timestamp;

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

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import com.everytime.project.domain.user.User;

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
	
	@ColumnDefault("0") 
	private Integer scrapCount;
	
	@ColumnDefault("0") 
	private Integer replyCount;
	
	@ColumnDefault("0") 
	private Integer likeCount;
			
	@CreationTimestamp
	private Timestamp createDate;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_Id") // 테이블에 user_Id로적힘
	private User user;
	
	
}
