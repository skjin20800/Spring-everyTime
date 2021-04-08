package com.everytime.project.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.everytime.project.config.auth.PrincipalDetails;
import com.everytime.project.domain.user.User;
import com.everytime.project.service.MyService;
import com.everytime.project.web.dto.CMRespDto;
import com.everytime.project.web.dto.my.EmailUpdateDto;
import com.everytime.project.web.dto.my.OauthUpdateDto;
import com.everytime.project.web.dto.my.PasswordUpdateDto;
import com.everytime.project.web.dto.my.UniversityUpdateDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MyController {

	private final MyService myService;

	@GetMapping("/my")
	public String my() {
		return "my/my";
	}
	@GetMapping("/my/password")
	public String myPassword() {
		return "my/password";
	}
	@GetMapping("/my/university")
	public String myUniversity() {
		return "my/university";
	}
	@GetMapping("/my/email")
	public String myEmail() {
		return "my/email";
	}
	@GetMapping("/my/oauth")
	public String myOauth() {
		return "my/oauth";
	}
	@PutMapping("/my/universityUpdate")
	@ResponseBody
	public  CMRespDto<?> universityUpdate(@RequestBody UniversityUpdateDto universityUpdateDto, @AuthenticationPrincipal PrincipalDetails principalDetails)  {
		System.out.println("MyController emailUpdate -  작동");
		User userEntity = universityUpdateDto.toEntity();
		return myService.대학교변경(userEntity);
	}
	@PutMapping("/my/emailUpdate")
	@ResponseBody
	public  CMRespDto<?> emailUpdate(@RequestBody EmailUpdateDto emailUpdateDto, @AuthenticationPrincipal PrincipalDetails principalDetails)  {
		System.out.println("MyController emailUpdate -  작동");
		User userEntity = emailUpdateDto.toEntity();
		return myService.이메일변경(userEntity);
	}
	@PutMapping("/my/passwordUpdate")
	@ResponseBody
	public CMRespDto<?> passwordUpdate(@RequestBody PasswordUpdateDto passwordUpdateDto) {
		System.out.println("MyController passwordUpdate - 작동");
		System.out.println("passwordUpdate - "+passwordUpdateDto);
		return myService.패스워드변경(passwordUpdateDto);
	}

	@PutMapping("/my/oauthUpdate")
	@ResponseBody
	public  CMRespDto<?> oauthUpdate(@RequestBody OauthUpdateDto oauthUpdateDto, @AuthenticationPrincipal PrincipalDetails principalDetails)  {
		System.out.println("MyController oauthUpdate -  작동");
		User userEntity = myService.oauth수정(oauthUpdateDto);
		if (userEntity == null) {
			return new CMRespDto<>(-1,null);
		}else {
		principalDetails.setUser(userEntity);
		return new CMRespDto<>(1,null);
		}
	}
}
