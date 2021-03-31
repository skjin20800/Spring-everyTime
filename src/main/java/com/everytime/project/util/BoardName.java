package com.everytime.project.util;

import com.everytime.project.domain.board.BoardType;

public class BoardName {

	public static String boardName(BoardType type) {
		if(type.equals(BoardType.free)) {
			return "자유 게시판";
		}else if(type.equals(BoardType.secret)) {
			return "비밀 게시판";
		}
		else{
			return null;
		}	
	
}
}
