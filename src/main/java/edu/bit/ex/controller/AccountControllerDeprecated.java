package edu.bit.ex.controller;


import edu.bit.ex.controller.validator.MemberValidator;
import edu.bit.ex.service.member.MemberService;
import edu.bit.ex.vo.MemberVO;
import edu.bit.ex.vo.ProductMainVO;
import edu.bit.ex.vo.account.MemberContext;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;



@Controller
@Slf4j
@RequiredArgsConstructor
public class AccountController {

    private final MemberService memberService;
    private final MemberValidator memberValidator;

    @InitBinder("memberVO")
    public void memberValidatorInitBinder(WebDataBinder binder) {
        binder.addValidators(memberValidator);
    }

    @GetMapping("/user")
    public @ResponseBody
    String user() {
        return "user";
    }

    @GetMapping("/admin")
    public @ResponseBody
    String admin() {
        return "admin";
    }

    @GetMapping("/loginForm")
    public String login() {
        return "account/loginForm";
    }

    @GetMapping("/success_join_page")
    public String success_join_page() {

        return "account/success_join_page";
    }

    @PostMapping("/join")
    public String join(@ModelAttribute @Validated MemberVO memberVO, Errors errors, Model model) {

        if (errors.hasErrors()) {
            return "account/joinForm";
        }

        memberService.addUser(memberVO);
        return "redirect:/success_join_page";
    }


    @GetMapping("/joinForm")
    public String joinForm(Model model) {
        MemberVO memberVO = new MemberVO();
        model.addAttribute("memberVO", memberVO);
        return "account/joinForm";
    }



    @GetMapping("/findId")
    public String findId() {
        return "account/findId";
    }


    @GetMapping("/findPw")
    public String findPw() {
        return "account/findPw";
    }



    
//    @GetMapping
//    public String getMyinfo(Principal principal) {
//    	
//        return principal.toString();
//    }
//    


}
