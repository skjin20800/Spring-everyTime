package com.everytime.project.web;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.everytime.project.config.auth.PrincipalDetails;
import com.everytime.project.domain.board.Board;
import com.everytime.project.domain.board.reply.Reply;
import com.everytime.project.domain.user.scrap.Scrap;
import com.everytime.project.service.MyBoardService;
import com.everytime.project.web.dto.CMRespDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MyBoardController {
	
	private final MyBoardService myBoardService;

	@GetMapping("/myboard/scrap/{id}")
	@ResponseBody
	public CMRespDto<?> saveScrap(@AuthenticationPrincipal PrincipalDetails principalDetails, 
			@PathVariable Long id) {
		int result = myBoardService.스크랩(principalDetails.getUser().getId() , id);
		return new CMRespDto<>(result,null);
		}
	
	@GetMapping("/myboard/scrap")
	public String myScrap(@AuthenticationPrincipal PrincipalDetails principalDetails,Model model,@PageableDefault(sort = "id", direction = Sort.Direction.DESC , size = 5)Pageable pageable) {
		Page<Scrap> scraps = myBoardService.스크랩목록(principalDetails.getUser().getId(),pageable);
		model.addAttribute("scraps",scraps);
		
		return "board/myboard/scrapMain";
		}
	
	
	@GetMapping("/myboard/myreply")
	public String myReply(@AuthenticationPrincipal PrincipalDetails principalDetails,Model model,@PageableDefault(sort = "id", direction = Sort.Direction.DESC , size = 5)Pageable pageable) {
		Page<Reply> replys = myBoardService.내댓글목록(principalDetails.getUser().getId(),pageable);
		model.addAttribute("replys",replys);
		
		return "board/myboard/myReply";
		}
	
	@GetMapping("/myboard")
	public String myboard(@AuthenticationPrincipal PrincipalDetails principalDetails,Model model,@PageableDefault(sort = "id", direction = Sort.Direction.DESC , size = 5)Pageable pageable) {
		Page<Board> boards = myBoardService.내게시글목록(principalDetails.getUser().getId(), pageable);
		model.addAttribute("boards",boards);
		
		return "board/myboard/myBoard";
		}

}

