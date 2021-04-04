package com.everytime.project.config.oauth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.everytime.project.config.auth.PrincipalDetails;
import com.everytime.project.domain.user.RoleType;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		PrincipalDetails principal = (PrincipalDetails) authentication.getPrincipal();
		if(principal.getUser().getUserRole().equals(RoleType.OAUTH)) {
			System.out.println("준 회원인 OAUTH 유저입니다.");
			response.sendRedirect("/my/oauth");
		}
			
		}
		
}
