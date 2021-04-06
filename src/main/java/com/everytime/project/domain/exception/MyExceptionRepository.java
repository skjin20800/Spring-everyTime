package com.everytime.project.domain.exception;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface MyExceptionRepository extends JpaRepository<MyException, Long> {
	
	@Transactional
	@Modifying
	@Query(value = "INSERT INTO myexception(content,createDate) VALUES(:content,now())", nativeQuery = true)
	int mException(String content); //
	
}
