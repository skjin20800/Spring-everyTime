package com.everytime.project.web.dto.rereply;

import javax.validation.constraints.NotBlank;

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

	@NotBlank(message = "대댓글 내용을 입력하세요")
	private String content;		
	private Boolean isAnonymous;
				
	public ReReply toEntity() {

		return ReReply.builder()
				.content(content)
				.isAnonymous(isAnonymous)
				.build();			
	}
}
