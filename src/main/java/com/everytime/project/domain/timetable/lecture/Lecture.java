package com.everytime.project.domain.timetable.lecture;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PostLoad;
import javax.persistence.Transient;

import org.hibernate.annotations.CreationTimestamp;

import com.everytime.project.domain.timetable.course.Course;
import com.everytime.project.domain.timetable.studentLecture.StudentLecture;
import com.everytime.project.domain.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity

public class Lecture {
	@Id //Primary Key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id; //시퀀스, auto_increment
	@Column(nullable = false, length = 100)
	private String	lectureTime;
	@Column(nullable = false, length = 100)
	private String recommendYear;
	@Column(nullable = false, length = 100)
	private Double credit;
	@Column(nullable = false, length = 100)
	private Integer regularNumber;
	@Column(nullable = false, length = 100)
	private String	courseTarget;
	@Column(nullable = false, length = 100)
	private String professor;
	@CreationTimestamp
	private Timestamp createDate;
	
	@ManyToOne
	@JoinColumn(name = "courseId")
	private Course course;

	@Transient 
	private String lectureroom;
	@Transient 
	private String firstTime;
	@Transient 
	private String secondTime;
	
	@PostLoad //select 되자마자 실행된다.
	public void postLoad() {
		this.lectureroom = lectureTime.substring(0,5);
		this.firstTime= lectureTime.substring(lectureTime.indexOf("[")+1,lectureTime.indexOf("]"));
		this.secondTime = lectureTime.substring(lectureTime.lastIndexOf("[")+1, lectureTime.lastIndexOf("]"));
	}
}
