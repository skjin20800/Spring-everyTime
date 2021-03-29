package com.everytime.project.web.dto.board;

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

	private String title;	
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
