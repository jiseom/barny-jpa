package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.CurrentAccount;
import edu.bit.ex.domain.account.Role;
import edu.bit.ex.domain.board.Board;
import edu.bit.ex.web.dto.CreateNoticeForm;
import edu.bit.ex.web.dto.DeleteMultipleForm;
import edu.bit.ex.web.dto.UpdateNoticeForm;
import edu.bit.ex.web.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RequiredArgsConstructor
@RequestMapping("/admin/notices")
@Controller
public class NoticeController {
    private final BoardService boardService;

    //관리자 공지사항 목록 조회
    @GetMapping("")
    public String getNotices(@CurrentAccount Account account,
                             Model model) {

        List<Board> notices = boardService.getNotices();
        model.addAttribute("list", notices);

        return "/notice/admin-main";
    }

    //공지사항 폼
    @GetMapping("/new")
    public String noticeForm(@CurrentAccount Account account,
                             CreateNoticeForm createNoticeForm,
                             Model model) {
        model.addAttribute("createNoticeForm", createNoticeForm);
        return "/notice/write_view";
    }

    //공지사항 글쓰기
    @PostMapping("/new")
    public String addNotice(@CurrentAccount Account account,
                            CreateNoticeForm createNoticeForm,
                            Errors errors,
                            Model model) {
        if (errors.hasErrors()) {
            model.addAttribute("createNoticeForm", createNoticeForm);
            return "/notice/write_view";
        }
        boardService.addNotice(account, createNoticeForm);
        return "redirect:/admin/notices";

    }

    //공지사항 상세보기 뷰
    @GetMapping("/{boardId}/detail")
    public String noticeDetail(@CurrentAccount Account account,
                               @PathVariable Long boardId,
                               Model model) {
        Board board = boardService.findBoard(boardId);
        model.addAttribute("board", board);
        return "/notice/admin-content-view";
    }

    //공지사항 수정
    @PostMapping("/{boardId}/update")
    public String updateNotice(@CurrentAccount Account account, UpdateNoticeForm updateNoticeForm,
                               @PathVariable Long boardId, Model model,Errors errors) {

        if (errors.hasErrors()) {
                    model.addAttribute("updateNoticeForm", updateNoticeForm);
            return "/notice/admin-content-view";
        }
        boardService.updateNotice(account,boardId, updateNoticeForm);
        return "redirect:/admin/notices";
    }

    //공지사항 선택 삭제
    @ResponseBody
    @PostMapping("/delete")
    public String deleteByCheckbox(@CurrentAccount Account account,
                                   @RequestBody DeleteMultipleForm deleteMultipleForm) {
        if (isAdmin(account)) {
            boardService.deleteByCheckBox(deleteMultipleForm);
            return "success";
        }
        throw new IllegalArgumentException();
    }

    private boolean isAdmin(Account account) {
        return account.getRole() == Role.ROLE_ADMIN;
    }

}
