package com.everytime.project.domain.user.scrap;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

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
public class Scrap {

	@Id //Primary Key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id; //시퀀스, auto_increment
				
	@ManyToOne
	@JoinColumn(name = "userId") // 테이블에 user_Id로적힘
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "boardId") // 테이블에 user_Id로적힘
	private Board board;
	
	@CreationTimestamp
	private Timestamp createDate;
}