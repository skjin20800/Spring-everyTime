package com.everytime.project.web;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.everytime.project.service.AuthService;
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
	public String join(AuthJoinReqDto authJoinReqDto) {
		System.out.println("회원가입 실행");
		authService.회원가입(authJoinReqDto.toEntity());
		return "redirect:/loginForm"; // 로그인 로직 다시 때리기
	}
	
}
