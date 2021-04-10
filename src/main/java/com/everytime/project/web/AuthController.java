package com.everytime.project.web;



import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.everytime.project.service.AuthService;
import com.everytime.project.web.dto.CMRespDto;
import com.everytime.project.web.dto.auth.AuthJoinReqDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class AuthController {
	
	private final AuthService authService;
	
	// 주소 : 인증안되었을 때 /user, /post, 인증이 되던 말던 무조건 온다./loginForm
	@GetMapping("/loginForm")
	public String login() {
		return "auth/loginForm";
	}
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "auth/joinForm";
	}
	
	@PostMapping("/join")
	@ResponseBody
	public CMRespDto<?> join(@Valid @RequestBody AuthJoinReqDto authJoinReqDto, BindingResult bindingResult) {
		
		int result = authService.회원가입(authJoinReqDto.toEntity());
		return new CMRespDto<>(result,null);
	}
}
