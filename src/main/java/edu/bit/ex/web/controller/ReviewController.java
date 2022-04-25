package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.CurrentAccount;
import edu.bit.ex.domain.board.Board;
import edu.bit.ex.domain.order.Order;
import edu.bit.ex.domain.product.Product;
import edu.bit.ex.web.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequiredArgsConstructor
@RequestMapping("/reviews")
@Controller
public class ReviewController {

    private final BoardService boardService;

//    @GetMapping()
//    private String getReviewList(@CurrentAccount Account account, Order order,
//                                 Model model) {
//
//        List<Board> reviewList = boardService.getReviewList(account,order);
//        model.addAttribute("my_review", reviewList);
//        return ("/board/my_review");
//
//    }



}
