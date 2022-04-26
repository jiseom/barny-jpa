package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.CurrentAccount;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {

    //관리자페이지
    @GetMapping("/statistics")
    public String getAdminView(@CurrentAccount Account account) {
        return "/admin/statistics";
    }


    
}
