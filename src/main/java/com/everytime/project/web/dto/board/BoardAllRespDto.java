package com.everytime.project.web.dto.board;

import com.everytime.project.domain.board.BoardType;

import lombok.Data;

@Data
public class BoardAllRespDto {

private BoardType boardType;
private String boardName;
	
	}

