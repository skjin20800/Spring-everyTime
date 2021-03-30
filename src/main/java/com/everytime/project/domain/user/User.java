package com.everytime.project.domain.user;

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
public class User {

	@Id //Primary Key
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id; //시퀀스, auto_increment
	
	@Column(nullable = false, length = 100, unique = true)
	private String username;
	
	@Column(nullable = false, length = 100)// 123456 => 해쉬(비밀번호 암호화)
	private String password;
	
	@Column(nullable = false, length = 100, unique = true)
	private String nickname;
	
	@Column(nullable = false, length = 100)
	private String email;
	
	@Enumerated(EnumType.STRING) // Enum값을 DB에넣을때 STRING으로 바꿔넣어준다
	private RoleType userRole; // ADMIN, USER
	
	@Column(nullable = false, length = 100)
	private String university;
	
	@Column(nullable = false, length = 100)
	private String entranceYear;
		
	@CreationTimestamp
	private Timestamp createDate;
	
}
