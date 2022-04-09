package edu.bit.ex.web.validator;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.AccountRepository;
import edu.bit.ex.web.dto.SignUpForm;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
@RequiredArgsConstructor
public class SignUpFormValidator implements Validator {

    private final AccountRepository accountRepository;

    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.isAssignableFrom(SignUpForm.class);
    }

    final static int ACCOUNT_ID_MIN = 6;
    final static int ACCOUNT_ID_MAX = 12;
    final static int PASSWORD_MIN = 8;
    final static int PASSWORD_MAX = 20;

    @Override
    public void validate(Object target, Errors errors) {
        SignUpForm signUpForm = (SignUpForm) target;

        Account findAccountById = accountRepository.findByAccountId(signUpForm.getAccountId());
        if (findAccountById != null) {
            errors.rejectValue("accountId", "duplicate.accountId", "사용중인 아이디입니다.");
        }
        Account findAccountByEmail = accountRepository.findByEmail(signUpForm.getEmail());
        if (findAccountByEmail != null) {
            errors.rejectValue("email", "duplicate.email", "사용중인 이메일입니다.");
        }
        Account findAccountByNickname = accountRepository.findByNickname(signUpForm.getNickname());
        if (findAccountByNickname != null) {
            errors.rejectValue("nickname", "duplicate.nickname", "사용중인 닉네임입니다.");
        }
        if (!checkValidateId(signUpForm.getAccountId())) {
            errors.rejectValue("accountId", "validate.accountId", "6~12자 이내로 영문,숫자 포함");
        }
        if (!checkValidatePassword(signUpForm.getPassword())){
            errors.rejectValue("password","validatePassword","8~20자 이내로 대소문자, 숫자, 특수기호 포함");
        }

    }

    public boolean checkValidateId(String accountId) {
         return accountId.matches("^[A-Za-z0-9]{"+ACCOUNT_ID_MIN+ ","+ACCOUNT_ID_MAX +"}$");
    }

    public boolean checkValidatePassword(String password) {
        return password.matches( "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{"+PASSWORD_MIN+","+ PASSWORD_MAX +"}$");
    }

}
