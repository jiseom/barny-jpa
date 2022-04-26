package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.CurrentAccount;
import edu.bit.ex.domain.board.Board;
import edu.bit.ex.web.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

        return "/notice/main";
    }



}
