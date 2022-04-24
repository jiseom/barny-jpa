package edu.bit.ex.domain.account;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public enum Role {

    ROLE_USER("USER", "회원"),
    ROLE_ADMIN("ADMIN", "관리자");

    private final String key;
    private final String title;

}
