package edu.bit.ex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import edu.bit.ex.vo.account.MemberContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;
import lombok.extern.slf4j.Slf4j;
import edu.bit.ex.service.EventService;
import edu.bit.ex.vo.MemberVO;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller

public class EventControllerDeprecated {

    @Autowired
    private EventService eventService;

    // 카드게임 메인 페이지
    @GetMapping("/user/event/cardbarny")
    public String cardbarny(@AuthenticationPrincipal MemberContext ctx, Model model) {
        model.addAttribute("participate_date", eventService.checkPart(ctx.getMemberVO().getMember_idx()));
        return "event/cardBarny";
    }

    // 룰렛 메인 페이지
    @GetMapping("/user/event/roulette")
    public Object roulette_game(ModelAndView mav, @AuthenticationPrincipal MemberContext ctx) {
        mav.setViewName("event/roulette_game");
        mav.addObject("participate_date", eventService.checkPart(ctx.getMemberVO().getMember_idx()));
        return mav;

    }

    // 포인트 적립
    @RequestMapping(value = "/event/add_point", method = RequestMethod.POST)
    public String add_point(MemberVO memberVO) {
        log.info("event roulette start");
        eventService.updatePoint(memberVO);
        eventService.participate(memberVO.getMember_idx());
        return "redirect:/user/event/roulette";
    }

    // 카드게임 포인트 적립
    @RequestMapping(value = "/event/add_point2", method = RequestMethod.POST)
    public String add_point2(MemberVO memberVO) {
        log.info("event card start");
        eventService.updatePoint2(memberVO);
        eventService.participate2(memberVO.getMember_idx());
        return "redirect:/user/event/cardbarny";
    }



}


