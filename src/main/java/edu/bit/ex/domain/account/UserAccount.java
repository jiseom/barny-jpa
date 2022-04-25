package edu.bit.ex.domain.account;

import lombok.Getter;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.List;

@Getter
public class UserAccount extends User {

    private Account account;

    public UserAccount(Account account) {
        super(account.getEmail(), account.getPassword(), List.of(new SimpleGrantedAuthority(account.getRole().name())));
        this.account = account;
    }

    //계졍 활성화 되었는지?
    @Override
    public boolean isEnabled() {
        return account.getEnabled() == 0;
    }
}
