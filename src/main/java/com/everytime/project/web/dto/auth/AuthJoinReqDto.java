package com.everytime.project.web.dto.auth;

import javax.validation.constraints.NotBlank;

import com.everytime.project.domain.user.User;

import lombok.Data;

// Valid 나중에 처리하자.

@Data
public class AuthJoinReqDto {
	
	@NotBlank(message = "유저네임을 입력하세요")
	private String username;
	@NotBlank(message = "패스워드를 입력하세요")
	private String password;
	@NotBlank(message = "닉네임을 입력하세요")
	private String nickname;
	@NotBlank(message = "이메일을 입력하세요")
	private String email;
	@NotBlank(message = "대학교를 입력하세요")
	private String university;
	@NotBlank(message = "학번을 입력하세요")
	private String entranceYear;
	
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
