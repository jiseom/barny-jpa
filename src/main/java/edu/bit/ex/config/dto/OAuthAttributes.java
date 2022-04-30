package edu.bit.ex.config.dto;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.Role;
import lombok.Builder;
import lombok.Getter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDate;
import java.util.Map;
import java.util.UUID;

@Getter
public class OAuthAttributes {

    private Map<String, Object> attributes;

    private String nameAttributeKey;

    private String name;

    private String picture;
    private String email;


    @Builder
    public OAuthAttributes(Map<String, Object> attributes, String nameAttributeKey, String name, String email,String picture) {
        this.attributes = attributes;
        this.nameAttributeKey = nameAttributeKey;
        this.name = name;
        this.email = email;
        this.picture = picture;

    }

    //of () OAuth2User 에서 반환하는 사용자 번호는 Map 이기 떄문에 값 하나하나를 변환해야 함.
    public static OAuthAttributes of(String registrationId, String userNameAttributeName, Map<String, Object> attributes) {
        return ofGoogle(userNameAttributeName, attributes);
    }

    private static OAuthAttributes ofGoogle(String userNameAttributeName, Map<String, Object> attributes) {
//        Map<String, Object> response = (Map<String, Object>) attributes.get("reponse");
        return OAuthAttributes.builder()
                .name((String) attributes.get("name"))
                .email((String) attributes.get("email"))
                .picture((String)attributes.get("picture"))
                .attributes(attributes)
                .nameAttributeKey(userNameAttributeName)
                .build();
    }

    public Account toEntity() {
        String password = UUID.randomUUID().toString();
        return Account.builder()
                .name(name)
                .email(email)
                .picture(picture)
                .role(Role.ROLE_USER)
                .accountId(email)
                .nickname(email)
                .address("ddd")
                .dateOfBirth(LocalDate.now())
                .password(passwordEncoder().encode(password)) //uuid
                .tel("010-0000-0000")
                .build();
    }

    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


}
