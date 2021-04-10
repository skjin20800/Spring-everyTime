package com.everytime.project.domain.timetable;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TimetableRepository extends JpaRepository<Timetable, Long>{

	@Query(value = "select * from timetable where userId = :principalId AND yearType= :yearType AND semesterType = :semesterType", nativeQuery = true)
	List<Timetable> findSemestertables(Long principalId,String yearType,String semesterType);
	
	@Query(value = "select * from timetable where userId = :principalId AND isStandard='1' AND yearType= '2020' AND semesterType = '1'", nativeQuery = true)
	Timetable findByStandard(Long principalId);
	
	@Query(value = "insert into timetable (tableName,yearType,semesterType,userId,isStandard)values ('시간표 1',:yearType,:semesterType,:principalId,true)", nativeQuery = true)
	List<Timetable> createSemestertable(Long principalId,String yearType,String semesterType);
}