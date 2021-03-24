package com.everytime.project.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.everytime.project.config.auth.PrincipalDetails;
import com.everytime.project.service.LikesService;
import com.everytime.project.web.dto.CMRespDto;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@RestController
public class LikesController {
	
	private final LikesService likeService;
	
	@PostMapping("/likes/board/{id}")
	public  CMRespDto<?> boardLikes(@AuthenticationPrincipal PrincipalDetails principalDetails,@PathVariable Long id) {
		int result = likeService.게시판공감(principalDetails.getUser().getId() , id);
		return new CMRespDto<>(result,null);
	}
	
	@PostMapping("/likes/reply/{id}")
	public  CMRespDto<?> replyLikes(@AuthenticationPrincipal PrincipalDetails principalDetails,@PathVariable Long id) {
		int result = likeService.댓글공감(principalDetails.getUser().getId() , id);
		return new CMRespDto<>(result,null);
	}
	
	@PostMapping("/likes/rereply/{id}")
	public  CMRespDto<?> reReplyLikes(@AuthenticationPrincipal PrincipalDetails principalDetails,@PathVariable Long id) {
		int result = likeService.대댓글공감(principalDetails.getUser().getId() , id);
		return new CMRespDto<>(result,null);
	}
	


}