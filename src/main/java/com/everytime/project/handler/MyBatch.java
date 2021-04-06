package com.everytime.project.handler;

import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.everytime.project.domain.exception.MyExceptionRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class MyBatch {

	private final ExceptionList exceptionList;
	private final MyExceptionRepository exceptionRepository;
	
	@Scheduled(fixedDelay = 1000*60*60) // Cron 정기적 실행
	public void excute() {
		System.out.println("excute실행");
		List<String> exList = exceptionList.getExList();
		for (String exception : exList) {
			System.out.println(exception);
			exceptionRepository.mException(exception);	
		}
		exList.clear();
	}
}
