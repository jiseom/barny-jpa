package edu.bit.ex.web.service;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.AccountRepository;
import edu.bit.ex.domain.account.Role;
import edu.bit.ex.domain.account.UserAccount;
import edu.bit.ex.web.dto.SignUpForm;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Transactional
@Service
public class AccountService {

    private final PasswordEncoder passwordEncoder;
    private final AccountRepository accountRepository;

    public Account addAccount(SignUpForm signUpForm) {
        String encodedPassword = passwordEncoder.encode(signUpForm.getPassword());
        Account account = signUpForm.toEntity();
        account.setPassword(encodedPassword);
        account.setRole(Role.ROLE_USER);
        return accountRepository.save(account);
    }

}
