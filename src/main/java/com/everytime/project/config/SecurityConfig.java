package com.everytime.project.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.everytime.project.config.oauth.LoginSuccessHandler;
import com.everytime.project.config.oauth.OAuth2DetailsService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Configuration // IoC등록
@EnableWebSecurity // 내가 커스텀한 시큐리티 사용하기
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	// SecurityConfig타입이 될려면 WebSecurityConfigurerAdapter 선언
	private final OAuth2DetailsService oAuth2DetailsService;

	// IoC등록만 하면 AuthenticationManager가 Bcrypt로 자동 검증해줌
	@Bean
	public BCryptPasswordEncoder encode() {
		return new BCryptPasswordEncoder();
	};

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable(); // csrf비활성화
		http.authorizeRequests().antMatchers("/", "/css/**", "/images/**", "/js/**","/likes/**").permitAll()
		.antMatchers("/loginForm","/joinForm","join").permitAll()
				.antMatchers("/my/oauth","/my/oauthUpdate").access("hasRole('ROLE_OAUTH')")
				.antMatchers("/join").permitAll()
				.antMatchers("/**").access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')") // user,post만 인증 및 허용//ROLE_는 강제성이 있음. 롤 검증시 사용
				.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')").anyRequest().permitAll() // 나머지 다 허용
				.and().formLogin() // x-www-form-urlencoded
				.loginPage("/loginForm") // 로그인 주소
				.loginProcessingUrl("/login") // Spring Security가 Post방식으로 "/login" 주소가 들어오면 낚아챈다
				.defaultSuccessUrl("/") // 로그인후 기본이동페이지
				.and().oauth2Login().successHandler(new LoginSuccessHandler()).userInfoEndpoint()
				.userService(oAuth2DetailsService);
	}
}
