package com.everytime.project.web.auth.dto;

import com.everytime.project.domain.user.User;

import lombok.Data;

// Valid 나중에 처리하자.

@Data
public class AuthJoinReqDto {
	
	private String username;	
	private String password;
	private String nickname;
	private String email;
	private String university;
	private Integer entranceYear;
	
	public User toEntity() {
		return User.builder()
				.username(username)
				.password(password)
				.nickname(nickname)
				.email(email)
				.university(university)
				.entranceYear(entranceYear)
				.build();
	}
	
}
