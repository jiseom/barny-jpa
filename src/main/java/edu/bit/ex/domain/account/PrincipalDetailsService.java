package edu.bit.ex.domain.account;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.AccountRepository;
import edu.bit.ex.domain.account.UserAccount;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@Service
public class PrincipalDetailsService implements UserDetailsService {

    private final AccountRepository accountRepository;

    @Override
    public UserDetails loadUserByUsername(String accountIdOrEmail) throws UsernameNotFoundException {
        Account findAccount = accountRepository.findByAccountId(accountIdOrEmail);
        if (findAccount == null) {
             findAccount = accountRepository.findByEmail(accountIdOrEmail);
        }
        if (findAccount == null) {
            throw new UsernameNotFoundException(accountIdOrEmail + " Not Found!");
        }
        return new UserAccount(findAccount);
    }
}
