package com.everytime.project.service;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everytime.project.domain.user.RoleType;
import com.everytime.project.domain.user.User;
import com.everytime.project.domain.user.UserRepository;
import com.everytime.project.web.dto.CMRespDto;
import com.everytime.project.web.dto.my.OauthUpdateDto;
import com.everytime.project.web.dto.my.PasswordUpdateDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MyService {
	
	private final UserRepository userRepository;
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Transactional
	public CMRespDto<?> 대학교변경(User user) {
			User userEntity = userRepository.findByUsername(user.getUsername());
			if(bCryptPasswordEncoder.matches(user.getPassword(), userEntity.getPassword())) {
				userEntity.setUniversity(user.getUniversity());
				return new CMRespDto<>(1,"대학교가 변경되었습니다.");
			}
			else {
			return new CMRespDto<>(-1,"비밀번호가 틀렸습니다.");
			}
	}
	@Transactional
	public CMRespDto<?> 이메일변경(User user) {
		System.out.println("이메일변경 - " +user);
			User userEntity = userRepository.findByUsername(user.getUsername());
			if(bCryptPasswordEncoder.matches(user.getPassword(), userEntity.getPassword())) {
				userEntity.setEmail(user.getEmail());
				return new CMRespDto<>(1,"이메일이 변경되었습니다.");
			}
			else {
			return new CMRespDto<>(-1,"비밀번호가 틀렸습니다.");
			}
	}
	@Transactional
	public CMRespDto<?> 패스워드변경(PasswordUpdateDto user) {
			User userEntity = userRepository.findByUsername(user.getUsername());
			if(bCryptPasswordEncoder.matches(user.getNowpassword(), userEntity.getPassword())) {
				String rawPassword = user.getNewpassword(); //비밀번호를 받아온다
				String encPassword = bCryptPasswordEncoder.encode(rawPassword); //받아온 비밀번호를 해쉬암호화한다.
				userEntity.setPassword(encPassword);
				
				return new CMRespDto<>(1,"비밀번호가 변경되었습니다.");
			}
			else {
			return new CMRespDto<>(-1,"비밀번호가 틀렸습니다.");
			}
	}
	
	@Transactional
	public User oauth수정(OauthUpdateDto oauthUpdateDto) {
			User userEntity = userRepository.findByUsername(oauthUpdateDto.getUsername());
			userEntity.setNickname(oauthUpdateDto.getNickname());
			userEntity.setUniversity(oauthUpdateDto.getUniversity());
			userEntity.setEntranceYear(oauthUpdateDto.getEntranceYear());
			userEntity.setUserRole(RoleType.USER);
			return userEntity;
	}
}
