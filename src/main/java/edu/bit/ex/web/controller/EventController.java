package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.CurrentAccount;
import edu.bit.ex.page.Criteria;
import edu.bit.ex.web.dto.EventForm;
import edu.bit.ex.web.service.EventService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@RequiredArgsConstructor
@Controller
public class EventController {

    private final EventService eventService;

    // 게시된 이벤트 화면
    @GetMapping("/all-events")
    public String event_main() {

        return "event/m_event_list";
    }

    //카드게임
    @GetMapping("/events/cardbarny")
    public String cardGame(@CurrentAccount Account account, Model model, EventForm eventForm) {
        eventService.canParticipateEvent(account, eventForm);
        model.addAttribute("participateDate", eventForm.getParticipatedDate());
        return "event/cardBarny";
    }

    //카드게임 포인트 적립
    @PostMapping("/events/cardbarny/add-point")
    public String addCardGamePoints(@CurrentAccount Account account) {
        eventService.addCardCamePoints(account);
//        eventService.participatedCardGame(account);
        return "redirect:/events/cardbarny";
    }

    //룰렛게임
    @GetMapping("/events/roulette")
    public String roulette_game(@CurrentAccount Account account, EventForm eventForm, Model model) {
        model.addAttribute("participate_date", eventForm.getParticipatedDate());
        return "/event/roulette_game";

    }

}
