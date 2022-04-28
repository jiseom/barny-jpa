package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.AccountRepository;
import edu.bit.ex.domain.account.CurrentAccount;
import edu.bit.ex.domain.account.Role;
import edu.bit.ex.domain.board.Board;
import edu.bit.ex.page.Criteria;
import edu.bit.ex.page.PageVO;
import edu.bit.ex.web.dto.CreateReplyForm;
import edu.bit.ex.web.service.AccountService;
import edu.bit.ex.web.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.util.List;

@RequiredArgsConstructor
@RequestMapping("/admin")
@Controller
public class AdminController {

    private final AccountRepository accountRepository;
    private final AccountService accountService;

    private final BoardService boardService;

    //관리자페이지
    @GetMapping("/statistics")
    public String getAdminView(@CurrentAccount Account account) {
////        List<OrderVO> orders = dashBoardService.getOrders();
////        //월별 일별 객체
////        Map<Integer, Integer> monthTotalPrice = dashBoardService.extractMonthTotalPrice(orders);
////        Map<Integer, Integer> dayTotalPrice = dashBoardService.extractDayTotalPrice(orders);
////        model.addAttribute("monthTotalPrice", monthTotalPrice);
////        model.addAttribute("dayTotalPrice", dayTotalPrice);
        return "/admin/statistics";
    }

    //전체 회원 조회
    @GetMapping("/account-list")
    public String getAccountList(@CurrentAccount Account account,
                                 Model model) {
        List<Account> accountList = accountService.getAccountList();
        model.addAttribute("accountList", accountList);
        return "/admin/admin_member";
    }

    //회원 상세보기
    @GetMapping("/{id}/detail")
    public String getAccountListDetail(@PathVariable Long id,
                                       @CurrentAccount Account account,
                                       Model model) {
        Account findAccount = accountService.getAccountDetail(id);
        model.addAttribute("content_view", findAccount);

        return "/admin/content_view";
    }

    //회원 비활성화
    @PostMapping("/{id}/delete")
    public String inactiveAccount(@PathVariable Long id,
                                  @CurrentAccount Account account) {
        accountService.inactiveAccount(id);
        return "redirect:/admin/{id}/detail";
    }

    //1:1 문의 관리 게시판 뷰


    // 관리자 문의내역 리스트
    @GetMapping("/inquiries")
    public String accountInquiries(@CurrentAccount Account account,
                            Model model) {
        if (isAdmin(account)) {
            List<Board> accountInquiries = boardService.getAccountInquiries();
            model.addAttribute("accountInquiries", accountInquiries);
            return "/board/adminList";
        }
        throw new IllegalArgumentException();
    }
    //관리자가 회원의 문의내역을 상세보기 하는 뷰
    @GetMapping("/inquiries/{boardId}/detail")
    public String accountInquiriesDetail(@CurrentAccount Account account,
                                         @PathVariable Long boardId,
                                         Model model) {
        if (isAdmin(account)) {
            Board board = boardService.getAccountInquiriesDetail(boardId);
            model.addAttribute("content_view", board);
            return "/board/content_view";
        }
        throw new IllegalArgumentException();
    }

    //답변 폼
    @GetMapping("/inquiries/{boardId}/reply")
    public String createReplyForm(@CurrentAccount Account account,
                                  CreateReplyForm createReplyForm,
                                  Model model) {
        if (isAdmin(account)) {
            model.addAttribute("createReplyForm", createReplyForm);
            return "/board/reply_view";
        }
        throw new IllegalArgumentException();

    }

    //답변 등록
    @PostMapping("/inquiries/{boardId}/reply")
    public String submitReplyForm(@CurrentAccount Account account,
                           @PathVariable Long boardId,
                           CreateReplyForm createReplyForm,
                           Model model) {
        if (isAdmin(account)) {
            boardService.addReply(boardId,createReplyForm);
            return "redirect:/admin/inquiries";
        }
        throw new IllegalArgumentException();
    }
    //관리자인지 확인하는 메서드
    private boolean isAdmin(Account account) {

        return account.getRole() == Role.ROLE_ADMIN;
    }


    //    //답글
//    @GetMapping("/answers")
//    public String getAnswers() {
//
//
//
//    }
//
//	<select id="getReply" resultType="edu.bit.ex.vo.BoardVO">
//	<![CDATA[
//    select*from barny_board where board_type_id=#{board_type_id} and b_group=#{b_group}
//	]]>
//	</select>
//
//    @GetMapping("/board/reply_view")
//    public String reply_view(BoardVO boardVO, Model model) {
//        log.info("reply_view()");
//        model.addAttribute("reply_view", boardService.getReply(boardVO.getBoard_id()));
//
//        return "/board/reply_view";
//    }


}


