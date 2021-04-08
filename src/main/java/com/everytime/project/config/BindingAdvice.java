package com.everytime.project.config;

import java.util.HashMap;
import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import com.everytime.project.handler.ExceptionList;
import com.everytime.project.web.dto.CMRespDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
@Aspect
public class BindingAdvice {

	private final ExceptionList exceptionList;

	@Transactional
	@Around("execution(* com.everytime.project.web..*Controller.*(..))")
	public Object validCheck(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {

		Object[] args = proceedingJoinPoint.getArgs();
		for (Object arg : args) {
			if(arg instanceof BindingResult) {			
				BindingResult bindingResult = (BindingResult) arg;
				// 서비스 : 정상적인 화면 -> 사용자요청
				if(bindingResult.hasErrors()) {					
					Map<String, String> errorMap = new HashMap<>();
					for(FieldError error : bindingResult.getFieldErrors()) {	
						exceptionList.addExceptionList(error.getDefaultMessage());
						errorMap.put(error.getField(), error.getDefaultMessage());
					}					
					return new CMRespDto<>(HttpStatus.BAD_REQUEST.value(), errorMap);
				}
			}
		}
		return proceedingJoinPoint.proceed(); // 함수의 스택을 실행해라
	}
}
