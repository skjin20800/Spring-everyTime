package com.everytime.project.web.dto.reply;

import javax.validation.constraints.NotBlank;

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

	@NotBlank(message = "댓글 내용을 입력하세요")
	private String content;		
	private Boolean isAnonymous;
				
	public Reply toEntity() {

		return Reply.builder()
				.content(content)
				.isAnonymous(isAnonymous)
				.build();			
	}
}
