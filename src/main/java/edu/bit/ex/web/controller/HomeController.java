package edu.bit.ex.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import edu.bit.ex.page.Criteria;
import edu.bit.ex.page.PageVO;
import edu.bit.ex.service.EventService;
import edu.bit.ex.service.NoticeService;
import edu.bit.ex.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Controller
public class HomeController {

	// event service
	@Autowired
	private EventService eventService;

	// notice sercie
	@Autowired
	private NoticeService noticeService;

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


	// notice list
	@GetMapping("/notice")
	public String notice(Model model, Criteria cri) {

		model.addAttribute("list", noticeService.getList(cri));

		int total = noticeService.getTotal(cri);
		model.addAttribute("pageMaker", new PageVO(cri, total));

		return "notice/m_main";
	}

	// notice list view
	@GetMapping("/notice/content/{board_id}") // 뒤에 보드 아이디 달아줘야 찾아감!
	public String notice_content_view(NoticeVO noticeVO, Model model) {

		model.addAttribute("content_view", noticeService.get(noticeVO.getBoard_id()));

		return "notice/m_content_view";
	}

	// FAQ
	@GetMapping("/notice/faq")
	public String faq(Model model) {
		return "notice/faq";
	}

}
