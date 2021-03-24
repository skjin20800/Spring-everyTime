package com.everytime.project.web.reply.dto;

import com.everytime.project.domain.board.reply.Reply;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReplyReqDto {

	private String content;		
	private Boolean isAnonymous;
				
	public Reply toEntity() {

		return Reply.builder()
				.content(content)
				.isAnonymous(isAnonymous)
				.build();			
	}
}
