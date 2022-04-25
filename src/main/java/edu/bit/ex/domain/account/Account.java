package edu.bit.ex.domain.account;

import javax.persistence.Entity;

import edu.bit.ex.web.dto.UpdateAccountForm;
import lombok.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.LocalDate;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
public class Account {

    @Id
    @GeneratedValue
    public Long id;

    @Column(nullable = false)
    private String accountId;

    @Column(nullable = false)
    public String name;

    @Column(nullable = false)
    public String nickname;

    @Column(unique = true, nullable = false)
    public String email;

    @Size(min = 8, max = 100)
    public String password;

    public String payment;

    @Column(nullable = false)
    public String tel;

    @Column(nullable = false)
    public String address;

    @Column(nullable = false)
    public LocalDate dateOfBirth;

    private int point;

    private int subscribe;

    @Enumerated(EnumType.STRING)
    private Role role;

    public void updatePassword(String password) {
        this.password = password;
    }

    public void updateCardGamePoint() {
        this.point += 100;
    }

    public void updateAccountInfo(UpdateAccountForm updateAccountForm) {
        this.setPassword(passwordEncoder().encode(updateAccountForm.getPassword()));
        this.setAddress(updateAccountForm.getAddress());
        this.setTel(updateAccountForm.getTel());
    }

    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
