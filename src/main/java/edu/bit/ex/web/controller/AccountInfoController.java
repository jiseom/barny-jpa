package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.CurrentAccount;
import edu.bit.ex.web.dto.UpdateAccountForm;
import edu.bit.ex.web.service.AccountService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequiredArgsConstructor
@RequestMapping("/my-page")
@Controller
public class AccountInfoController {

    private final AccountService accountService;

    //회원 수정 뷰
    @GetMapping("/edit")
    public String accountEditView(@CurrentAccount Account account, Model model) {
        model.addAttribute(account);
        return "/user/edit";
    }

    //회원 수정
    @PostMapping("/update")
    public String accountInfoUpdate(@CurrentAccount Account account,
                                    UpdateAccountForm updateAccountForm,
                                    Model model) {
        model.addAttribute("updateAccountForm", updateAccountForm);
        accountService.updateAccountInfo(account, updateAccountForm);
        return "redirect:/login";
    }

    
}

