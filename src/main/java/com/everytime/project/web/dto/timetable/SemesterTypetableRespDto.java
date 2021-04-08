package com.everytime.project.web.dto.timetable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class SemesterTypetableRespDto {
	private String tableName;
	private Long id;
	private String yearType;
	private String semesterType;
	private Boolean isStandard;
	
//	private boolean getIsStandard() {
//		return isStandard;
//	}
//	private boolean getStandard() {
//		return isStandard;
//	}
//	private boolean isStandard() {
//		return isStandard;
//	}
}
