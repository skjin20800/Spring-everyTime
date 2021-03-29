package com.everytime.project.web.dto.rereply;

import com.everytime.project.domain.board.reply.rereply.ReReply;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReReplyReqDto {

	private String content;		
	private Boolean isAnonymous;
				
	public ReReply toEntity() {

		return ReReply.builder()
				.content(content)
				.isAnonymous(isAnonymous)
				.build();			
	}
}
