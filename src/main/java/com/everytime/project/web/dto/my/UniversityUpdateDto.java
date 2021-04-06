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
public class UniversityUpdateDto {


	private String username;	
	private String password;
	private String university;

				
	public User toEntity() {

		return User.builder()
				.username(username)
				.password(password)
				.university(university)
				.build();			
	}
}
