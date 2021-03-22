package com.everytime.project.domain.board.like;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import com.everytime.project.domain.board.Board;
import com.everytime.project.domain.board.reply.Reply;
import com.everytime.project.domain.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


public class Like {
//
//	@Id //Primary Key
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private Long id; //시퀀스, auto_increment
//	
//	private Boolean isLike;
//		
//	@ManyToOne
//	@JoinColumn(name = "user_Id") // 테이블에 user_Id로적힘
//	private User user;
//	
//	@ManyToOne
//	@JoinColumn(name = "board_Id") // 테이블에 user_Id로적힘
//	private Board board;
//	
//	@ManyToOne
//	@JoinColumn(name = "reply_Id") // 테이블에 user_Id로적힘
//	private Reply reply;
	//
	
}