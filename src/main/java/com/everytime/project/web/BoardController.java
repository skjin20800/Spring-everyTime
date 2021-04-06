package com.everytime.project.web;
import java.util.List;

import javax.validation.Valid;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.everytime.project.config.auth.PrincipalDetails;
import com.everytime.project.domain.board.Board;
import com.everytime.project.domain.board.BoardType;
import com.everytime.project.service.BoardService;
import com.everytime.project.util.BoardName;
import com.everytime.project.web.dto.CMRespDto;
import com.everytime.project.web.dto.board.BoardAllRespDto;
import com.everytime.project.web.dto.board.BoardPostReqDto;
import com.everytime.project.web.dto.board.BoardPutReqDto;
import com.everytime.project.web.dto.board.SearchReqDto;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class BoardController {
	
	private final BoardService boardService;
	
	@GetMapping({"","/","/board"})
	public String findAll(Model model) {
		List<BoardAllRespDto> types= boardService.전체타입목록();
		List<Board> boards = boardService.전체게시판목록();
		 model.addAttribute("types",types);
		 model.addAttribute("boards",boards);		 
		 return "board/boardMain";
	}
	
	@GetMapping("/board/{type}")
	public String freeFindAll(@PathVariable BoardType type,Model model,@PageableDefault(sort = "id", direction = Sort.Direction.DESC  , size = 5)Pageable pageable) {	
		Page<Board> boards = boardService.게시판목록(type,pageable);
		model.addAttribute("boards",boards);
		model.addAttribute("boardType",BoardName.boardName(type));
		model.addAttribute("type",type);
		
		return "board/boardList";
	}
	
	
	@GetMapping("/boardDetail/{id}")
	public String freeDetailFind(@PathVariable Long id,Model model) {
		Board boardEntity = boardService.게시판상세보기(id);
		model.addAttribute("board",boardEntity);
		
		return "board/boardDetail";
	}
	 
	@PostMapping("/board/post/{type}")
	@ResponseBody
	public CMRespDto<?> save(@PathVariable BoardType type,@Valid @RequestBody BoardPostReqDto boardPostReqDto,BindingResult bindingResult, @AuthenticationPrincipal PrincipalDetails principalDetails ) {
		Board board = boardPostReqDto.toEntity();
		board.setUser(principalDetails.getUser());
		board.setType(type);
		int result = boardService.글쓰기(board);

		return new CMRespDto<>(result,null);
		}
	//
	@PutMapping("/board/post/{id}")
	@ResponseBody
	public CMRespDto<?> update(@PathVariable Long id,@Valid @RequestBody BoardPutReqDto boardPutReqDto,BindingResult bindingResult, @AuthenticationPrincipal PrincipalDetails principalDetails) {
		int result = boardService.수정하기(id, boardPutReqDto.toEntity());
		return new CMRespDto<>(result,null) ;
		}
	
	
	@DeleteMapping("/board/{id}")
	@ResponseBody
	public CMRespDto<?> deleteById(@PathVariable Long id,
			@AuthenticationPrincipal PrincipalDetails principalDetails){
		int result = boardService.삭제하기(id, principalDetails.getUser().getId());
		return new CMRespDto<>(result,null);
	}
		
	@GetMapping("/board/search/{type}")
	public String search(@PathVariable BoardType type,
			 SearchReqDto searchReqDto, Model model,
			@PageableDefault(sort = "id", direction = Sort.Direction.DESC , size = 5)Pageable pageable) {
		Page<Board> boards = boardService.검색하기(type,searchReqDto, pageable);
		model.addAttribute("boards",boards);
		model.addAttribute("boardType",BoardName.boardName(type));
		model.addAttribute("type",type);
		return "board/boardList";
	}

	
	}


	

