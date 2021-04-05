package com.everytime.project.web.dto.board;

import java.util.ArrayList;
import java.util.List;

import com.everytime.project.domain.board.BoardType;
import com.everytime.project.util.BoardName;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardGetRespDto {

	private List<BoardAllRespDto> boardGetRespDto2 = new ArrayList<>();
	

//	
		public BoardGetRespDto(BoardType[] boardTypes) {
			
			for (int i = 0; i < boardTypes.length; i++) {
				BoardAllRespDto boardGetRespDto2 = new BoardAllRespDto();
				boardGetRespDto2.setBoardType(boardTypes[i]);
				boardGetRespDto2.setBoardName(BoardName.boardName(boardTypes[i]));
				this.boardGetRespDto2.add(i, boardGetRespDto2);
			}
	}
}
