package com.everytime.project.web;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.everytime.project.config.auth.PrincipalDetails;
import com.everytime.project.domain.timetable.Timetable;
import com.everytime.project.domain.timetable.lecture.Lecture;
import com.everytime.project.service.TimetableService;
import com.everytime.project.web.dto.timetable.SemesterTypetableRespDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class TimetableController {

	private final TimetableService timetableService;
	
	@GetMapping("/lecture")
	public String timetable() {
		return "timetable/timetableEx";
	}

	@GetMapping("/timetable")
	public String timetablefind(Model model,@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Timetable timetableEntity = timetableService.시간표상세보기(principalDetails.getUser().getId(),"2020","1");
		List<SemesterTypetableRespDto> SemesterTypetableRespDtos = timetableService.시간표목록찾기(principalDetails.getUser().getId(),"2020","1");
		model.addAttribute("semester",SemesterTypetableRespDtos);
		model.addAttribute("timetableId",timetableEntity.getId());
		model.addAttribute("timetable",timetableEntity);
		List<Lecture> AllLecture = timetableService.강좌불러오기();
		model.addAttribute("AllLecture",AllLecture);
		return "timetable/timetable";
	}
	@GetMapping("/timetable/{yearType}/{semesterType}")
	public String timetablefind(@PathVariable String yearType,@PathVariable String semesterType,Model model,@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Timetable timetableEntity = timetableService.시간표상세보기(principalDetails.getUser().getId(),yearType,semesterType);
		List<SemesterTypetableRespDto> SemesterTypetableRespDtos = timetableService.시간표목록찾기(principalDetails.getUser().getId(),yearType,semesterType);
		model.addAttribute("semester",SemesterTypetableRespDtos);
		model.addAttribute("timetableId",timetableEntity.getId());
		model.addAttribute("timetable",timetableEntity);
		List<Lecture> AllLecture = timetableService.강좌불러오기();
		model.addAttribute("AllLecture",AllLecture);
		return "timetable/timetable";
	}
	@GetMapping("/timetable/{yearType}/{semesterType}/{id}")
	public String timetablefindById(@PathVariable String yearType,@PathVariable String semesterType,@PathVariable Long id,Model model,@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Timetable timetableEntity = timetableService.시간표상세보기(principalDetails.getUser().getId(),id);
		List<SemesterTypetableRespDto> SemesterTypetableRespDtos = timetableService.시간표목록찾기(principalDetails.getUser().getId(),yearType,semesterType);
		model.addAttribute("semester",SemesterTypetableRespDtos);
		model.addAttribute("timetableId",id);
		model.addAttribute("timetable",timetableEntity);
		List<Lecture> AllLecture = timetableService.강좌불러오기();
		model.addAttribute("AllLecture",AllLecture);
		return "timetable/timetable";
	}

}
