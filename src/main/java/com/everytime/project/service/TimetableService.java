package com.everytime.project.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everytime.project.domain.timetable.Timetable;
import com.everytime.project.domain.timetable.TimetableRepository;
import com.everytime.project.web.dto.timetable.SemesterTypetableRespDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class TimetableService {
	private final TimetableRepository timetableRepository;
	
//	@Transactional(readOnly = true)
//	public Page<Board> 게시판목록(BoardType type,Pageable pageable) {		
//		return boardRepository.findByType(type,pageable);
//	}
	
	@Transactional(readOnly = true)
	public Timetable 시간표상세보기(Long principalId) {
		Timetable timetableEntity = timetableRepository.findByStandard(principalId);
		if(principalId.equals(timetableEntity.getUser().getId())) {
			return timetableEntity;
		}else {
			return null;
		}
	}

	@Transactional(readOnly = true)
	public Timetable 시간표상세보기(Long principalID,Long timetableId) {
		Timetable timetableEntity = timetableRepository.findById(timetableId).orElseThrow(()->{
			return new IllegalArgumentException("시간표를 찾을 수 없습니다.");
		}); 
		if(principalID.equals(timetableEntity.getUser().getId())) {
			return timetableEntity;
		}else {
			return null;
		}
	}
	@Transactional(readOnly = true)
	public List<SemesterTypetableRespDto> 시간표목록찾기(Long principalID,String yearType,String semesterType) {
	
			List<Timetable> timetableEntity = timetableRepository.findSemestertables(principalID,yearType,semesterType);
			if (timetableEntity ==null) {
				timetableEntity = timetableRepository.createSemestertable(principalID,yearType,semesterType);
			}
			List<SemesterTypetableRespDto> dtoEntity = new ArrayList<>();
			for(int i=0;i<timetableEntity.size();i++) {
				SemesterTypetableRespDto dto = new SemesterTypetableRespDto();
				dto.setId(timetableEntity.get(i).getId());
				dto.setYearType(timetableEntity.get(i).getYearType());
				dto.setSemesterType(timetableEntity.get(i).getSemesterType());
				dto.setTableName(timetableEntity.get(i).getTableName());
				dto.setIsStandard(timetableEntity.get(i).getIsStandard());
				dtoEntity.add(dto);
			}
			return dtoEntity;
	}
//	@Transactional
//	public int 글쓰기(Board board) {
//		Board boardEntity = boardRepository.save(board);
//		if(boardEntity == null) {
//			return -1;
//		}else {
//			return 1;
//		}
//	}

}
