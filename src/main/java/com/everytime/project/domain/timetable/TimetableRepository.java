package com.everytime.project.domain.timetable;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.everytime.project.domain.user.User;

public interface TimetableRepository extends JpaRepository<Timetable, Long>{

	@Query(value = "select * from timetable where userId = :principalId AND yearType= :yearType AND semesterType = :semesterType", nativeQuery = true)
	List<Timetable> findSemestertables(Long principalId,String yearType,String semesterType);
	
	@Query(value = "select * from timetable where userId = :principalId AND isStandard='1' AND yearType= :yearType AND semesterType = :semesterType", nativeQuery = true)
	Timetable findByStandard(Long principalId,String yearType,String semesterType);
	
	@Query(value = "insert into timetable (tableName,yearType,semesterType,userId,isStandard)values ('시간표 1',:yearType,:semesterType,:principalId,true)", nativeQuery = true)
	List<Timetable> createSemestertable(Long principalId,String yearType,String semesterType);
	
	@Modifying
	@Query(value = "update timetable set updateDate= now() where id =:timetableId", nativeQuery = true)
	int UpdateUpdateDate(Long timetableId);
}