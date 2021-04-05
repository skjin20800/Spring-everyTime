package com.everytime.project.web.dto.board;

import javax.validation.constraints.NotBlank;

import com.everytime.project.domain.board.Board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardPostReqDto {

	@NotBlank(message = "타이틀을 입력하세요")
	private String title;	
	@NotBlank(message = "내용을 입력하세요")
	private String content;		
	private Boolean isAnonymous;
				
	public Board toEntity() {

		return Board.builder()
				.title(title)
				.content(content)
				.isAnonymous(isAnonymous)
				.build();			
	}
}
