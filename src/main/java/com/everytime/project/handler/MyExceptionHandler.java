package com.everytime.project.handler;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

import com.everytime.project.web.dto.CMRespDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@ControllerAdvice
public class MyExceptionHandler {

	private final ExceptionList exceptionList;
	
	@Transactional
	@ExceptionHandler(value = Exception.class)
	public CMRespDto<?> hello(Exception e) {
		exceptionList.addExceptionList(e.getMessage());
		return new CMRespDto<>(-1, "오류남"+e.getMessage());
	}	
}