package edu.bit.ex.web.controller;

import com.google.gson.Gson;
import edu.bit.ex.web.dto.SignUpForm;
import edu.bit.ex.web.service.AccountService;
import edu.bit.ex.web.validator.SignUpFormValidator;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Random;

@Controller
@RequiredArgsConstructor
public class AccountController {

    private final AccountService accountService;
    private final SignUpFormValidator signUpFormValidator;

    /**
     * 회원 가입
     */
    //==  회원가입 유효성 검사  ==//
    @InitBinder("signUpForm")
    public void memberValidatorInitBinder(WebDataBinder binder) {
        binder.addValidators(signUpFormValidator);
    }

    //==  회원 가입 폼 보여주는 페이지  ==//
    @GetMapping("/account/new")
    public String signUpForm(Model model) {
        SignUpForm signUpForm = new SignUpForm();
        model.addAttribute("signUpForm", signUpForm);
        return "account/sign-up-form";
    }

    //==  회원 가입 로직  ==//
    @PostMapping("/account/new")
    public String signUp(@ModelAttribute @Validated SignUpForm signUpForm, Errors errors, Model model) {
        if (errors.hasErrors()) {
            return "account/sign-up-form";
        }
        accountService.addAccount(signUpForm);
        return "redirect:/success-sign-up";
    }

    //==  회원가입 성공 후 리다이렉트 되는 페이지  ==//
    @GetMapping("/success-sign-up")
    public String successAddAccount() {
        return "account/success-sign-up";
    }

    /**
     * 로그인 로직
     */
    @GetMapping("/login")
    public String login() {
        return "account/login-form";
    }


    /**
     * 아이디 /비밀번호 찾기 뷰
     */
    @GetMapping("/username-recovery")
    public String findId() {
        return "account/username-recovery";
    }

    @GetMapping("/password-recovery")
    public String password() {
        return "account/password-recovery";
    }

    /**
     * 인증 메일 관련 로직
     */
    //==  회원가입 인증 메일  ==//
    @PostMapping("/check-email")
    @ResponseBody
    public String checkEmail(@RequestParam("email") String email) {
        return accountService.checkEmail(email);
    }

    //==   아이디 찾기  ==//
    @PostMapping("/username-recovery")
    @ResponseBody
    public String usernameRecovery(@RequestParam("email") String email) {
        return accountService.usernameRecovery(email);
    }

    //==   비번 찾기  ==//
    @PostMapping("/password-recovery")
    @ResponseBody
    public String passwordRecovery(@RequestParam("email") String email) {
        return accountService.passwordRecovery(email);
    }
}


