package com.everytime.project.web;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.everytime.project.config.auth.PrincipalDetails;
import com.everytime.project.domain.board.Board;
import com.everytime.project.service.LikesService;
import com.everytime.project.web.dto.CMRespDto;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@RestController
public class LikesController {
	private final LikesService likeService;
	
	@GetMapping("/likes/board/{id}")
	public  CMRespDto<?> boardLikes(@AuthenticationPrincipal PrincipalDetails principalDetails,@PathVariable Long id) {
		int result = likeService.게시판공감(principalDetails.getUser().getId() , id);
		return new CMRespDto<>(result,null);
	}
	
	@GetMapping("/likes/reply/{id}")
	public  CMRespDto<?> replyLikes(@AuthenticationPrincipal PrincipalDetails principalDetails,@PathVariable Long id) {
		int result = likeService.댓글공감(principalDetails.getUser().getId() , id);
		return new CMRespDto<>(result,null);
	}
	
	@GetMapping("/likes/rereply/{id}")
	public  CMRespDto<?> reReplyLikes(@AuthenticationPrincipal PrincipalDetails principalDetails,@PathVariable Long id) {
		int result = likeService.대댓글공감(principalDetails.getUser().getId() , id);
		return new CMRespDto<>(result,null);
	}
	
	@GetMapping("/likes/bestList")
	public  CMRespDto<?> bestList(@PageableDefault(sort = "id", direction = Sort.Direction.DESC  , size = 3)Pageable pageable) {
		Page<Board> boardsEntity = likeService.베스트게시글(pageable);
		return new CMRespDto<>(1,boardsEntity);
	}

}
