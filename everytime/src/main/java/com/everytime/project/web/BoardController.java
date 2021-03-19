package com.everytime.project.web;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.everytime.project.config.auth.PrincipalDetails;
import com.everytime.project.domain.board.Board;
import com.everytime.project.domain.board.BoardType;
import com.everytime.project.service.BoardService;
import com.everytime.project.web.board.dto.BoardPostReqDto;
import com.everytime.project.web.dto.CMRespDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class BoardController {
	
	private final BoardService boardService;
	
	@GetMapping({"","/","/board"})
	public String findAll() {
		return "board/boardMain";
	}
	
	@GetMapping("/board/free")
	public String freeFindAll(Model model) {
		List<Board> boards = boardService.자유게시판목록();
		model.addAttribute("boards",boards);
		return "board/free/freeMain";
	}
	
	
	@GetMapping("/board/freeDetail/{id}")
	public String freeDetailFind(@PathVariable int id) {
		return "board/free/freeDetail";
	}
	
	@PostMapping("/board/post")
	@ResponseBody
	public CMRespDto<?> save(@RequestBody BoardPostReqDto boardPostReqDto, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		System.out.println("boardPostReqDto : "+ boardPostReqDto);
		Board board = boardPostReqDto.toEntity();
		board.setUser(principalDetails.getUser());
		board.setType(BoardType.FREE);
		Board boardEntity = boardService.글쓰기(board);
		

		return new CMRespDto<>(1,null) ;
		}
	}


	

