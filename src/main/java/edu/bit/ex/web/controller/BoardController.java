package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.CurrentAccount;
import edu.bit.ex.domain.board.Board;
import edu.bit.ex.domain.order.Order;
import edu.bit.ex.domain.product.Product;
import edu.bit.ex.vo.ProductMainVO;
import edu.bit.ex.web.dto.InquiryForm;
import edu.bit.ex.web.dto.UpdateInquiryForm;
import edu.bit.ex.web.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Controller
public class BoardController {

    private final BoardService boardService;

    // 마이페이지 뷰
    @GetMapping("/my-page")
    public String myPageView(@CurrentAccount Account account) {
        log.info("User name ======= " + account.getName());
        return "/board/my_page";
    }

    // 마이페이지 1:1문의내역 리스트
    @GetMapping("/inquiries")
    public String getInquiries(@CurrentAccount Account account, Model model) {
        List<Board> boardList = boardService.getBoardList(account);
        model.addAttribute("myInquiries", boardList);
        return "/board/my_view";
    }

    // 회원 마이페이지 1:1문의 글쓰기 입력폼
    @GetMapping("/inquiries/new")
    public String InquiryForm(Model model) {
        InquiryForm inquiryForm = new InquiryForm();
        model.addAttribute("inquiryForm", inquiryForm);
        model.addAttribute("BoardType", inquiryForm.getBoardType());
        return "/board/my_view_write";
    }

    // 회원 마이페이지 1:1문의 글 등록
    @PostMapping("/inquiries/new")
    public String submitInquiry(InquiryForm inquiryForm,
                                @CurrentAccount Account account,
                                Errors errors,
                                Model model) {
        if (errors.hasErrors()) {
            model.addAttribute("inquiryForm", inquiryForm);
            return "/board/write_my_view";
        }
        boardService.addInquiry(account, inquiryForm);
        return "redirect:/inquiries";

    }

    // 1:1 문의 글 상세보기 뷰
    @GetMapping("/inquiries/{boardId}/detail")
    public String inquiryDetailView(@PathVariable Long boardId, @CurrentAccount Account account, Model model) {
       Board board = boardService.findByAccount(account,boardId);
        if (board != null) {
            model.addAttribute("my_content_view", board);
            return "/board/my_content_view";
        }
        throw new IllegalArgumentException();
    }

    //1:1 문의글 수정
    @PostMapping("/inquiries/{boardId}/update")
    public String updateInquiry(@PathVariable Long boardId,
                                UpdateInquiryForm updateInquiryForm,
                                @CurrentAccount Account account,
                                Model model,
                                Errors errors) {
        if (errors.hasErrors()) {
            model.addAttribute("updateInquiryForm", updateInquiryForm);
            return "/board/my_content_view";
        }
        boardService.updateInquiry(account,boardId, updateInquiryForm);
        return "redirect:/inquiries";
    }

    //1:1 문의글 삭제
    @GetMapping("/inquiries/{id}/delete")
    public String deleteInquiry(@PathVariable("id") Long boardId,
                                @CurrentAccount Account account) {
        boardService.deleteInquiry(account, boardId);
        return "redirect:/inquiries";
    }

    //구독 내역 목록
    @GetMapping("/my-page/press")
    public String getPressItem(@CurrentAccount Account account,
                               Model model) {
        List<Product> pressList = boardService.getPressItem(account);
        model.addAttribute("press", pressList);
        return "/board/press";
    }

//    //구독 내역 수정
//    @PostMapping("/press/update")
//    public String updatePress(@CurrentAccount Account account) {
//
//        return "redirect:/board/press";
//    }

    //구매내역 목록
    @GetMapping("/my-page/purchase-list")
    public String getPurchaseList(@CurrentAccount Account account,
                                  Model model) {
        List<Order> purchaseList = boardService.getPurchaseList(account);
        model.addAttribute("purchase_list", purchaseList);
        return "/board/purchase_list";
    }

    //포인트 내역
    @GetMapping("/my-page/point")
    public String getPointList(@CurrentAccount Account account,
                               Model model) {
        List<Account> pointList = boardService.getPointList(account);
        model.addAttribute("point", pointList);
        return "/board/point";

    }
}

