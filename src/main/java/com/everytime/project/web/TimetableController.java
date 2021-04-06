package com.everytime.project.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class TimetableController {

	@GetMapping("/timetable")
	public String timetable() {
//		return "timetable/timetable";
		return "timetable/q";
	}
}
