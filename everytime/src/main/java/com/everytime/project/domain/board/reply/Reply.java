package com.everytime.project.domain.board.reply;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import com.everytime.project.domain.board.Board;
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
public class Reply {

	@Id //Primary Key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id; //시퀀스, auto_increment
	
	private Long from;
		
	@Lob
	private String content;
	
	@ColumnDefault("0") 
	private Integer scrapCount;
	
	@ColumnDefault("1") 
	private Integer replyAnomymous_Number;
	
	@Column(nullable = false, length = 100)
	private Boolean isAnonymous;
	
	@CreationTimestamp
	private Timestamp createDate;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_Id") // 테이블에 user_Id로적힘
	private User user;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "board_Id") // 테이블에 user_Id로적힘
	private Board board;
	
	
}