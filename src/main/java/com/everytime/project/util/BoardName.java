package com.everytime.project.util;

import com.everytime.project.domain.board.BoardType;

public class BoardName {
	//free, secret, graduate, freshman, issue, marketplace, promotion, club, information, employment, career
	public static String boardName(BoardType type) {
		if(type.equals(BoardType.free)) {
			return "자유 게시판";
		}else if(type.equals(BoardType.secret)) {
			return "비밀 게시판";
		}else if(type.equals(BoardType.graduate)) {
			return "졸업생 게시판";
		}else if(type.equals(BoardType.freshman)) {
			return "새내기 게시판";
		}else if(type.equals(BoardType.issue)) {
			return "시사-이슈 게시판";
		}else if(type.equals(BoardType.marketplace)) {
			return "장터 게시판";
		}else if(type.equals(BoardType.promotion)) {
			return "홍보 게시판";
		}else if(type.equals(BoardType.club)) {
			return "동아리-학회";
		}else if(type.equals(BoardType.information)) {
			return "정보 게시판";
		}else if(type.equals(BoardType.career)) {
			return "취업-진로";
		}
		
		else{
			return null;
		}	
	
}
}
