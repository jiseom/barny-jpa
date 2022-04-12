package edu.bit.ex.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import edu.bit.ex.page.Criteria;
import edu.bit.ex.page.PageVO;
import edu.bit.ex.service.BoardServiceDeprecated;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MemberVO;
import edu.bit.ex.vo.OrderVO;
import edu.bit.ex.vo.ProductMainVO;
import edu.bit.ex.vo.account.MemberContext;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardControllerDeprecated {

	@Autowired
	private BoardServiceDeprecated boardService;

//	// 마이페이지
//	@GetMapping("/board/my_page")
//	public String my_page(Model model, Principal principal, @AuthenticationPrincipal MemberContext ctx) {
//
//		log.info("User name=======" + principal.getName());
//
//		return "/board/my_page";
//	}

	// 마이페이지 (구독)
	@GetMapping("/board/press")
	public String press(Model model, Principal principal, @AuthenticationPrincipal MemberContext ctx) {

		log.info("press Principal.." + principal.getName());
		log.info("press..: Principal" + ctx.getMemberVO().getMember_idx());

		log.info("press" + ctx.getMemberVO().getMember_idx());

		List<ProductMainVO> pressList = boardService.getPressList(ctx.getMemberVO().getMember_idx());

		model.addAttribute("press", pressList);

		log.info("List<ProductMainVO> pressList" + pressList);

		return "/board/press";
	}

	// 구독ㄴ 내역 게시판 수정
	@GetMapping("/board/update_modify")
	public String update_modify(BoardVO boardVO, Model model, @AuthenticationPrincipal MemberContext ctx) {
		log.info("update_modify..");

		boardVO.setMember_idx(ctx.getMemberVO().getMember_idx());

		boardService.update_modify(boardVO);

		return "redirect:/board/press";
	}

	// 마이페이지 (구매내역)리스트
	@GetMapping("/board/purchase_list")
	public String purchase_list(Model model, Principal principal, @AuthenticationPrincipal MemberContext ctx) {

		log.info("purchase_list Principal.." + principal.getName());
		log.info("purchase_list..: Principal" + ctx.getMemberVO().getMember_idx());

		log.info("Principal" + ctx.getMemberVO().getMember_idx());

		List<OrderVO> orderList = boardService.getOrderList(ctx.getMemberVO().getMember_idx());

		model.addAttribute("purchase_list", orderList);

		log.info("List<orderVO> orderList" + orderList);

		return "/board/purchase_list";
	}

	// 구매내역 삭제
	@GetMapping("/board/ship_delete")
	public String ship_delete(OrderVO orderVO, Model model) {
		log.info("ship_delete().." + orderVO);

		boardService.ship_remove(orderVO.getShip_id());

		return "redirect:/board/purchase_list";
	}

	// 마이페이지 (1:1문의내역)리스트
//	@GetMapping("/board/my_view")
//	public String my_view(Model model, Principal principal, @AuthenticationPrincipal MemberContext ctx) {
//
//		log.info("my_view() Principal.." + principal.getName());
//		log.info("my_view()..: Principal" + ctx.getMemberVO().getMember_idx());
//
//		log.info("Principal" + ctx.getMemberVO().getMember_idx());
//
//		List<BoardVO> boardList = boardService.getMemberList(ctx.getMemberVO().getMember_idx());
//
//		model.addAttribute("my_view", boardList);
//
//		log.info("List<boardVO> boardList" + boardList);
//
//		return "/board/my_view";
//	}

	// 1:1문의상세보기
	@GetMapping("/board/my_content_view")
	public String my_content_view(BoardVO boardVO, Model model) {
		log.info("my_content_view()..");
		log.info("my_content_view()..boardVO" + boardVO);

		model.addAttribute("my_content_view", boardService.get(boardVO.getBoard_id()));

		log.info("my_content_view boardVO_Get " + boardService.get(boardVO.getBoard_id()));

		return "/board/my_content_view";
	}

	// 답글
	@GetMapping("/board/reply_view")
	public String reply_view(BoardVO boardVO, Model model) {
		log.info("reply_view()");
		model.addAttribute("reply_view", boardService.getReply(boardVO.getBoard_id()));

		return "/board/reply_view";
	}

	// 답글상세보기
	@GetMapping("/board/reply_content_view")
	public String reply_content_view(BoardVO boardVO, Model model) {
		log.info("reply_content_view..");
		log.info("reply_content_view..boardVO" + boardVO);

		model.addAttribute("reply_content_view", boardService.get(boardVO.getBoard_id()));

		log.info("reply_content_viewboardVO_Get " + boardService.get(boardVO.getBoard_id()));

		return "/board/reply_content_view";
	}

	// 회원 마이페이지 1:1문의 글쓰기 입력폼
	@GetMapping("/board/my_view_write")
	public String my_view_write() {
		log.info("my_view_write");

		return "/board/my_view_write";
	}

	// 회원 마이페이지 1:1문의 글작성 후 입력누르면 넘어가는 입력버튼
	@PostMapping("/board/write_my_view")
	public String write_my_view(BoardVO boardVO, @AuthenticationPrincipal MemberContext ctx) {
		log.info("write_my_view()");

		boardVO.setMember_idx(ctx.getMemberVO().getMember_idx());

		log.info("boardVO :" + boardVO);

		boardService.writeBoard1(boardVO);

		return "redirect:/board/my_view";

	}

	// 회원 1:1문의 내역 게시판 수정
	@PostMapping("/board/my_modify")
	public String my_modify(BoardVO boardVO, Model model) {
		log.info("my_modify()..");

		boardService.my_modify(boardVO);

		return "redirect:/board/my_view";
	}

	// 회원 1:1문의 내역 게시판 삭제
	@GetMapping("/board/my_delete")
	public String my_delete(BoardVO boardVO, Model model) {
		log.info("my_delete()..");

		boardService.my_remove(boardVO.getBoard_id());

		return "redirect:/board/my_view";
	}

	// 마이페이지 (후기)리스트
	@GetMapping("/board/my_review")
	public String my_review(Criteria cri, Model model, Principal principal,
			@AuthenticationPrincipal MemberContext ctx) {

		log.info("my_review() Principal.." + principal.getName());
		log.info("my_review()..: Principal" + ctx.getMemberVO().getMember_idx());

		log.info("Principal" + ctx.getMemberVO().getMember_idx());
		List<BoardVO> reviewList = boardService.getReviewList(ctx.getMemberVO().getMember_idx());

//		log.info(cri);
		// model.addAttribute("my_review", reviewList);
		cri.setMember_idx(ctx.getMemberVO().getMember_idx());
		// 페이징
		model.addAttribute("my_review", boardService.getReviewList(cri));

		int total = boardService.getTotal(cri);
		log.info("cri == " + cri);

		log.info("total : == " + total + ":: List:" + boardService.getReviewList(cri));

		model.addAttribute("pageMaker", new PageVO(cri, total));

		log.info("List<boardVO> reviewList" + reviewList);

		return "/board/my_review";
	}

	// 회원후기상세보기
	@GetMapping("/board/review_content_view")
	public String review_content_view(BoardVO boardVO, Model model) {
		log.info("review_content_view()..");

		model.addAttribute("review_content_view", boardService.get(boardVO.getBoard_id()));
		return "/board/review_content_view";
	}

	// 회원 마이페이지 후기 글쓰기 입력폼
	@GetMapping("/board/my_review_write")
	public String my_review_write() {
		log.info("my_review_write");

		return "/board/my_review_write";
	}

	// 회원 마이페이지 후기 글작성 후 입력누르면 넘어가는 입력버튼
	@PostMapping("/board/write_my_review")
	public String write_my_review(BoardVO boardVO, @AuthenticationPrincipal MemberContext ctx) {
		log.info("write_my_review()");

		boardVO.setMember_idx(ctx.getMemberVO().getMember_idx());

		log.info("boardVO :" + boardVO);

		boardService.writeBoard2(boardVO);

		return "redirect:/board/my_review";
	}

	// 회원 후기 수정
	@PostMapping("/board/review_modify")
	public String review_modify(BoardVO boardVO, Model model) {
		log.info("review_modify()..");

		boardService.review_modify(boardVO);

		return "redirect:/board/my_review";
	}

	// 회원 후기 게시판 삭제
	@GetMapping("/board/review_delete")
	public String review_delete(BoardVO boardVO, Model model) {
		log.info("review_delete()..");
		// 먼저 like 지우고
		boardService.review_remove2(boardVO.getBoard_id());
		// 두번째 보드 지우고
		boardService.review_remove(boardVO.getBoard_id());

		return "redirect:/board/my_review";
	}

	// 관리자 주문내역 리스트
	@GetMapping("/board/adminList")
	public String adminList(Criteria cri, Model model, Principal principal) {

		log.info("adminList");
		// 페이징
		model.addAttribute("adminList", boardService.getAdminList(cri));

		int total2 = boardService.getTotal2(cri);
		log.info("cri == " + cri);

		log.info("total : == " + total2 + ":: List:" + boardService.getAdminList(cri));

		model.addAttribute("pageMaker", new PageVO(cri, total2));


		return "/board/adminList";
	}

	// 관리자주문내역읽기
	@GetMapping("/board/content_view")
	public String content_view(BoardVO boardVO, Model model) {
		log.info("content_view()..");

		model.addAttribute("content_view", boardService.get(boardVO.getBoard_id()));
		return "/board/content_view";
	}

	// 관리자 주문내역 게시판 수정
	@PostMapping("/board/modify")
	public String modify(BoardVO boardVO, Model model) {
		log.info("modify()..");

		boardService.modify(boardVO);

		return "redirect:/board/list";
	}

	// 관리자 주문내역 게시판 삭제
	@GetMapping("/board/delete")
	public String delete(BoardVO boardVO, Model model) {
		log.info("delete()..");

		boardService.remove(boardVO.getBoard_id());

		return "redirect:/board/adminList";
	}

	// 관리자 주문내역 게시판 글쓰기폼
	@GetMapping("/board/write_view")
	public String write_view() {
		log.info("write_view");

		return "/board/write_view";
	}

	// 관리자 주문내역 게시판 글쓰기 입력버튼 누르는거
	@PostMapping("/board/write")
	public String write(BoardVO boardVO) {
		log.info("write()");

		boardService.writeBoard(boardVO);

		return "redirect:/board/list";
	}

	// 마이페이지 (1:1문의내역)리스트
	@GetMapping("/board/point")
	public String point(Model model, Principal principal, @AuthenticationPrincipal MemberContext ctx) {

		log.info("point() Principal.." + principal.getName());
		log.info("point()..: Principal" + ctx.getMemberVO().getMember_idx());

		log.info("Principal" + ctx.getMemberVO().getMember_idx());

		List<MemberVO> pointList = boardService.getPointList(ctx.getMemberVO().getMember_idx());

		model.addAttribute("point", pointList);

		log.info("List<MemberVO> boardList" + pointList);

		return "/board/point";
	}

}
