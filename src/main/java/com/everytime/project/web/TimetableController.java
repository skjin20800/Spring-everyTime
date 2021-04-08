package com.everytime.project.web;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.everytime.project.config.auth.PrincipalDetails;
import com.everytime.project.domain.board.Board;
import com.everytime.project.domain.timetable.Timetable;
import com.everytime.project.service.TimetableService;
import com.everytime.project.web.dto.timetable.SemesterTypetableRespDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class TimetableController {

	private final TimetableService timetableService;
	
	@GetMapping("/lecture")
	public String timetable() {
		return "timetable/timetable";
	}

	@GetMapping("/timetable")
	public String timetablefind(Model model,@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Timetable timetableEntity = timetableService.시간표상세보기(principalDetails.getUser().getId());
		List<SemesterTypetableRespDto> SemesterTypetableRespDtos = timetableService.시간표목록찾기(principalDetails.getUser().getId(),"2020","1");
		model.addAttribute("semester",SemesterTypetableRespDtos);
		model.addAttribute("timetableId",timetableEntity.getId());
		if (timetableEntity !=null) {
			model.addAttribute("timetable",timetableEntity);
		}
		return "timetable/q";
	}
	
	@GetMapping("/timetable/{yearType}/{semesterType}/{id}")
	public String timetablefindById(@PathVariable String yearType,@PathVariable String semesterType,@PathVariable Long id,Model model,@AuthenticationPrincipal PrincipalDetails principalDetails) {
		Timetable timetableEntity = timetableService.시간표상세보기(principalDetails.getUser().getId(),id);
		List<SemesterTypetableRespDto> SemesterTypetableRespDtos = timetableService.시간표목록찾기(principalDetails.getUser().getId(),yearType,semesterType);
		model.addAttribute("semester",SemesterTypetableRespDtos);
		model.addAttribute("timetableId",id);
		if (timetableEntity !=null) {
			model.addAttribute("timetable",timetableEntity);
		}
		return "timetable/q";
	}

}
