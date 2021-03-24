package com.everytime.project.config.auth;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import com.everytime.project.domain.user.User;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class PrincipalDetails implements UserDetails,OAuth2User {


	private User user;
	private Map<String, Object> attributes; // OAUth제공자로 부터 받은 회원 정보
	private boolean oauth = false;


	public PrincipalDetails(User user) {
		this.user = user;
	}	
	public PrincipalDetails(User user, Map<String, Object> attributes) {
		this.user = user;
		this.attributes = attributes;
		oauth = true;
	}
	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String getPassword() {
		return user.getPassword();
	}
	@Override
	public String getUsername() {
		return user.getUsername();
	}
	@Override
	public boolean isAccountNonExpired() { //인증 만료기한 ex 1년 등등
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() { //몇번 실패시 막는것 
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() { // 비밀번호 만료
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() { //계정 활성화
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		System.out.println("롤 검증 하는 중");
		Collection<GrantedAuthority> collectors = new ArrayList<>();
		collectors.add(()->"ROLE_"+user.getUseRole().toString());
		return collectors;		
	}
}
