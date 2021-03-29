package com.everytime.project.web.dto.reply;

import com.everytime.project.domain.board.Board;
import com.everytime.project.domain.board.reply.Reply;
import com.everytime.project.domain.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReplyDistinctDto {

	private User userId;		
	private Board boardId;
				
	public Reply toEntity() {

		return Reply.builder()
				.user(userId)
				.board(boardId)
				.build();			
	}
}
