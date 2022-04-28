package edu.bit.ex.web.controller;

import edu.bit.ex.domain.board.Board;
import edu.bit.ex.web.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@RequiredArgsConstructor
@Controller
public class HomeController {

	private final BoardService boardService;

	// 메인 페이지
	@GetMapping("/main")
	public String main_page() {
		return "main_page";
	}

	// 취향 테스트
	@GetMapping("/drink_test")
	public String drink_test() {
		return "drink_test";
	}

	// 브랜드 스토리
	@GetMapping("/story")
	public String story() {
		return "brandstory";
	}

	// 구독
	@GetMapping("/subscribe")
	public String subscribe() {
		return "subs";
	}


	// 회원이 공지사항 확인할 수 있는 페이지
	@GetMapping("/notice")
	public String notice(Model model) {

		List<Board> list = boardService.getNotices();
		model.addAttribute("list", list);

		return "notice/main";
	}

	// 공지사항 상세 보기
	@GetMapping("/notice/{boardId}/detail") // 뒤에 보드 아이디 달아줘야 찾아감!
	public String noticeDetailView( @PathVariable Long boardId,
									Model model) {
		Board board = boardService.findBoard(boardId);
		model.addAttribute("content_view", board);

		return "notice/content-view";
	}

	// FAQ
	@GetMapping("/notice/faq")
	public String faq(Model model) {
		return "notice/faq";
	}

}
