package com.everytime.project.domain.board.replyamonymous;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Builder;
import lombok.Data;

@Data

@Builder
@Entity
public class ReplyAmonymous {

	@Id //Primary Key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id; //시퀀스, auto_increment
//	
//	private Integer amonyNumber;
//			
////	@ManyToOne
//	@JoinColumn(name = "user_Id") 
//	private User user;
//	
////	@ManyToOne
//	@JoinColumn(name = "board_Id") 
//	private Board board;
//	
////	@ManyToOne
//	@JoinColumn(name = "reply_Id") 
//	private Reply reply;
//	
	
}