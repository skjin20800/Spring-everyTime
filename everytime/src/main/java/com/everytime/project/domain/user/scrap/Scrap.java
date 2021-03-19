package com.everytime.project.domain.user.scrap;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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
//				
////	@ManyToMany(fetch = FetchType.EAGER)
//	@JoinColumn(name = "user_Id") // 테이블에 user_Id로적힘
//	private User user;
//	
////	@ManyToOne(fetch = FetchType.EAGER)
//	@JoinColumn(name = "board_Id") // 테이블에 user_Id로적힘
//	private Board board;
	
	
}