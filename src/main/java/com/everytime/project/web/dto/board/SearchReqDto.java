package com.everytime.project.web.dto.board;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class SearchReqDto {
	
	@NotBlank(message = "검색어를 입력하세요")
	String keyword; 

}
