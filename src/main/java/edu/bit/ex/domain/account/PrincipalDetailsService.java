package edu.bit.ex.domain.account;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class PrincipalDetailsService implements UserDetailsService {

    private final AccountRepository accountRepository;
    @Override
    public UserDetails loadUserByUsername(String accountIdOrEmail) throws UsernameNotFoundException {
        Account findAccount = accountRepository.findByAccountId(accountIdOrEmail);
        if (findAccount == null) {
            findAccount = accountRepository.findByEmail(accountIdOrEmail).
                    orElseThrow(IllegalArgumentException::new);
        }
        if (findAccount == null) {
            throw new UsernameNotFoundException(accountIdOrEmail + " Not Found!");
        }
        return new UserAccount(findAccount);
    }

}
