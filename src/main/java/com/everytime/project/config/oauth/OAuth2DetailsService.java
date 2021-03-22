package com.everytime.project.config.oauth;

import java.util.Map;
import java.util.UUID;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.everytime.project.config.auth.PrincipalDetails;
import com.everytime.project.domain.user.RoleType;
import com.everytime.project.domain.user.User;
import com.everytime.project.domain.user.UserRepository;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Service
public class OAuth2DetailsService extends DefaultOAuth2UserService {
	private final UserRepository userRepository;
	
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println("oAuth 로그인 진행중...");
		System.out.println(userRequest.getAccessToken());
		OAuth2User oauth2User = super.loadUser(userRequest);
		System.out.println(oauth2User.getAttributes());
		return processOAuth2User(userRequest, oauth2User);
	}
	//구글 로그인 프로세스
	private OAuth2User processOAuth2User (OAuth2UserRequest userRequest, OAuth2User oauth2User) {
		OAuth2UserInfo oAuth2UserInfo =null;
		if(userRequest.getClientRegistration().getClientName().equals("Facebook")) {
			oAuth2UserInfo = new FacebookInfo(oauth2User.getAttributes());
		}
		//2번 최초 : 회원가입 + 로그인 , 최초x 로그인
		User userEntity = userRepository.findByUsername(oAuth2UserInfo.getUsername());
		
		UUID uuid = UUID.randomUUID();
		String encPassword = new BCryptPasswordEncoder().encode(uuid.toString());
		
		if(userEntity==null) {
			User user = User.builder()
					.username(oAuth2UserInfo.getUsername())
					.password(encPassword)
					.email(oAuth2UserInfo.getEmail())
					.useRole(RoleType.USER)
					.build();
			userEntity=userRepository.save(user);
			return new PrincipalDetails(userEntity,oauth2User.getAttributes());
		}else {//이미 회원가입이 완료되었다는 뜻(구글정보가 변경될 수 있어서 update해야됨)
			return new PrincipalDetails(userEntity,oauth2User.getAttributes());
		}
	}

}
