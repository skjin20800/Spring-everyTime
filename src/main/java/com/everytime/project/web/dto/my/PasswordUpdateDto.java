package com.everytime.project.web.dto.my;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PasswordUpdateDto {


	private String username;	
	private String nowpassword;
	private String newpassword;
						
}
