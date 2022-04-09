package edu.bit.ex.web.controller;

import edu.bit.ex.web.dto.SignUpForm;
import edu.bit.ex.web.service.AccountService;
import edu.bit.ex.web.validator.SignUpFormValidator;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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


}


