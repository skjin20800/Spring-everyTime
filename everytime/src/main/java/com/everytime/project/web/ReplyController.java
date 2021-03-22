package com.everytime.project.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.everytime.project.config.auth.PrincipalDetails;
import com.everytime.project.domain.board.reply.Reply;
import com.everytime.project.service.ReplyService;
import com.everytime.project.web.dto.CMRespDto;
import com.everytime.project.web.reply.dto.ReplyReqDto;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ReplyController {
	
	private final ReplyService replyService;
	
	@PostMapping("/reply/{id}")
	public CMRespDto<?> save(Model model,@PathVariable Long id , @RequestBody ReplyReqDto replyReqDto, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		
		Reply reply = replyReqDto.toEntity();
		reply.setUser(principalDetails.getUser());
		int result = replyService.댓글쓰기(reply,id);

		return new CMRespDto<>(result,null) ;
		}
}
