package com.everytime.project.domain.timetable;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.PostLoad;
import javax.persistence.Transient;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import com.everytime.project.domain.timetable.studentLecture.StudentLecture;
import com.everytime.project.domain.user.User;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity

public class Timetable {

	@Id // Primary Key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id; // 시퀀스, auto_increment

	@Column(nullable = false, length = 100)
	private String tableName;
	@Column(nullable = false, length = 100)
	private String semesterType;
	@Column(nullable = false, length = 100)
	private String yearType;
	@Column(length = 100)
	@ColumnDefault("FALSE")
	private Boolean isStandard;

	@Transient
	private double tableCredit;

	 @ManyToOne
	 @JoinColumn(name = "userId")
	 private User user;
	 
	@OneToMany(mappedBy = "timetable", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({ "timetable" })
	@OrderBy("id desc")
	private List<StudentLecture> studentLectures;

	@CreationTimestamp
	private Timestamp updateDate;

	@PostLoad // select 되자마자 실행된다.
	public void postLoad() {
		for (StudentLecture credit : studentLectures) {
			tableCredit += credit.getLecture().getCredit();
		}
	}

}
