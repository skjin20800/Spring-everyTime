package com.everytime.project.web;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.everytime.project.config.auth.PrincipalDetails;
import com.everytime.project.domain.board.reply.rereply.ReReply;
import com.everytime.project.service.ReReplyService;
import com.everytime.project.web.dto.CMRespDto;
import com.everytime.project.web.dto.rereply.ReReplyReqDto;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ReReplyController {
	
	private final ReReplyService rereReplyService;
	
	@PostMapping("/rereply/{id}")
	public CMRespDto<?> save(Model model,@PathVariable Long id , @RequestBody ReReplyReqDto rereplyReqDto,
			@AuthenticationPrincipal PrincipalDetails principalDetails) {
		
		ReReply rereply = rereplyReqDto.toEntity();
		rereply.setUser(principalDetails.getUser());
		int result = rereReplyService.대댓글쓰기(rereply,id);

		return new CMRespDto<>(result,null) ;
		}
	
	@DeleteMapping("/rereply/{id}")
	public CMRespDto<?> deleteById(@PathVariable Long id,
			@AuthenticationPrincipal PrincipalDetails principalDetails){
		
		//모든 컨트롤러에 삭제하기, 수정하기는 무조건 동일 인물이 로그인 했는지 확인!!!
		int result = rereReplyService.삭제하기(id, principalDetails.getUser().getId());
		return new CMRespDto<>(result,null);
	}
	

}
