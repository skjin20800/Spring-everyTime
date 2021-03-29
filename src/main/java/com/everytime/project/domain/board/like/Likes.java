package com.everytime.project.domain.board.like;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import com.everytime.project.domain.board.Board;
import com.everytime.project.domain.board.reply.Reply;
import com.everytime.project.domain.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class Likes {

	@Id //Primary Key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id; //시퀀스, auto_increment
	
	@ManyToOne
	@JoinColumn(name = "userId") //공감 유저
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "boardId") // 게시글 
	private Board board;
	
	@ManyToOne
	@JoinColumn(name = "replyId") // 댓글
	private Reply reply;
	
	@ManyToOne
	@JoinColumn(name = "reReplyId") // 대댓글
	private Reply reReply;
	
	@CreationTimestamp
	private Timestamp createDate;
	
}