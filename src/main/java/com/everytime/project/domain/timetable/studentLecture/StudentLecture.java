package com.everytime.project.domain.timetable.studentLecture;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import com.everytime.project.domain.timetable.Timetable;
import com.everytime.project.domain.timetable.lecture.Lecture;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity

public class StudentLecture {
	@Id //Primary Key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id; //시퀀스, auto_increment
	
	@ManyToOne
	@JoinColumn(name = "lectureId")
	private Lecture lecture;

	@ManyToOne
	@JoinColumn(name = "timetableId")
	private Timetable timetable;
	@CreationTimestamp
	private Timestamp createDate;
}
