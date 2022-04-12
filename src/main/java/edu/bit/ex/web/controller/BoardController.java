package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.CurrentAccount;
import edu.bit.ex.domain.board.Board;
import edu.bit.ex.web.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Controller
public class BoardController {

    private final BoardService boardService;

    // 마이페이지 뷰
    @GetMapping("/board/my_page")
    public String my_page(@CurrentAccount Account account, Model model) {
        log.info("User name ======= " + account.getName());
        return "/board/my_page";
    }

    // 마이페이지 1:1문의내역 리스트
    @GetMapping("/board/my_view")
    public String my_view(@CurrentAccount Account account, Model model) {
        List<Board> boardList = boardService.getBoardList(account);
        model.addAttribute("myInquiries", boardList);
        return "/board/my_view";
    }




}
