package com.everytime.project.domain.timetable.course;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity

public class Course {
	@Id //Primary Key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id; //시퀀스, auto_increment
	@Column(nullable = false, length = 100, unique = true)
	private String courseCode;
	@Column(nullable = false, length = 100)
	private String courseName;

	@Enumerated(EnumType.STRING)
	private CourseType type;
	@Column(nullable = false, length = 100)
	private String major;

	@CreationTimestamp
	private Timestamp createDate;
}
