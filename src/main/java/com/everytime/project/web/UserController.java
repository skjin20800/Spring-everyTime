package com.everytime.project.web;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.everytime.project.config.auth.PrincipalDetails;



@Controller
public class UserController {
	
//	@GetMapping("/user")
//	public @ResponseBody String hello() {//@Controller + @ResponseBody = @RestController
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//		PrincipalDetails principalDetails =  (PrincipalDetails) authentication.getPrincipal();
//		System.out.println(principalDetails.getUser());
//		return "jsp/boardMain";
//	}
	
//	@GetMapping("/")
//	public String login() {
//		return "jsp/index";
//	}

}
