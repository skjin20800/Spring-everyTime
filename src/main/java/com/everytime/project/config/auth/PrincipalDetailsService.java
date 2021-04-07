package com.everytime.project.config.auth;


import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.everytime.project.domain.user.User;
import com.everytime.project.domain.user.UserRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PrincipalDetailsService implements UserDetailsService {

	private final UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
			User principal = userRepository.findByUsername(username);
			
			if(principal == null) {
				return null;
			}else {
				return new PrincipalDetails(principal);
			}
		
	}

}
