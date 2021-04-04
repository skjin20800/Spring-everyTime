package com.everytime.project.web.dto.my;

import com.everytime.project.domain.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OauthUpdateDto {


	private String username;
	private String university;
	private String nickname;
	private String entranceYear;
	

				
	public User toEntity() {

		return User.builder()
				.username(username)
				.university(university)
				.nickname(nickname)
				.entranceYear(entranceYear)
				.build();			
	}
}
