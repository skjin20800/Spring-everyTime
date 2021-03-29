package com.everytime.project.web.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CMRespDto<T> {
	private String msg; // 오류 내용 Value too long for column "TITLE VARCHAR(60)"
	private int statusCode; //-1 실패, 1성공
	private T data;
	
	public CMRespDto(int statusCode,  String msg, T data) {
		this.statusCode = statusCode;
		this.data = data;
		this.msg = msg;
	}
	
	public CMRespDto(int statusCode, T data) {
		this.statusCode = statusCode;
		this.data = data;
	}	
}
