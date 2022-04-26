package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.AccountRepository;
import edu.bit.ex.domain.account.CurrentAccount;
import edu.bit.ex.web.service.AccountService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequiredArgsConstructor
@RequestMapping("/admin")
@Controller
public class AdminController {

    private final AccountRepository accountRepository;

    private final AccountService accountService;

    //관리자페이지
    @GetMapping("/statistics")
    public String getAdminView(@CurrentAccount Account account) {
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
    public String inactiveAccount (@PathVariable Long id,
                                @CurrentAccount Account account) {
        accountService.inactiveAccount(id);
        return "redirect:/admin/{id}/detail";
    }
}
