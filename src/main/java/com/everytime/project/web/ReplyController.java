package com.everytime.project.web;

import javax.validation.Valid;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.everytime.project.config.auth.PrincipalDetails;
import com.everytime.project.domain.board.reply.Reply;
import com.everytime.project.service.ReplyService;
import com.everytime.project.web.dto.CMRespDto;
import com.everytime.project.web.dto.reply.ReplyReqDto;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ReplyController {
	
	private final ReplyService replyService;
	
	@PostMapping("/reply/{id}")
	public CMRespDto<?> save(Model model,@PathVariable Long id ,@Valid @RequestBody ReplyReqDto replyReqDto, BindingResult bindingResult, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		
		Reply reply = replyReqDto.toEntity();
		reply.setUser(principalDetails.getUser());
		int result = replyService.댓글쓰기(reply,id);

		return new CMRespDto<>(result,null) ;
		}
	
	@DeleteMapping("/reply/{id}")
	public CMRespDto<?> deleteById(@PathVariable Long id,
			@AuthenticationPrincipal PrincipalDetails principalDetails){
		//모든 컨트롤러에 삭제하기, 수정하기는 무조건 동일 인물이 로그인 했는지 확인!!!
		int result = replyService.삭제하기(id, principalDetails.getUser().getId());
		return new CMRespDto<>(result,null);
	}
	//

}
