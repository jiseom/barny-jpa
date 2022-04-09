package edu.bit.ex.web.dto;


import edu.bit.ex.domain.account.Account;
import lombok.*;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.time.LocalDate;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SignUpForm {

    final static int ID_MIN = 6;
    final static int ID_MAX = 12;
    final static int PASSWORD_MIN = 8;
    final static int PASSWORD_MAX = 20;

    @NotBlank(message = "아이디를 입력해주세요.")
    @Size(min = ID_MIN,max = ID_MAX)
    public String accountId;

    @NotBlank(message = "이름을 입력해주세요.")
    public String name;

    @NotBlank(message = "닉네임을 입력해주세요.")
    public String nickname;

    @Email(message = "이메일 양식에 맞춰 입력해주세요.")
    @NotBlank(message = "이메일을 입력해주세요.")
    public String email;

    @Pattern(regexp = "^((?=.*\\d)(?=.*[a-zA-Z])(?=.*[\\W]).{" + PASSWORD_MIN + "," + PASSWORD_MAX + "})$",
            message = "영어,숫자,특수문자 포함하여 8 ~ 20 자 이내로 입력해주세요.")
    public String password;

    @Pattern(regexp = "^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$",
            message = "휴대폰 번호 양식에 맞게 입력해주세요.")
    public String tel;

    public String address;

    public String dateOfBirth;

    public Account toEntity() {
        String[] split = dateOfBirth.split("-");
        return Account.builder()
                .accountId(this.accountId)
                .name(this.name)
                .nickname(this.nickname)
                .email(this.email)
                .password(this.password)
                .address(this.address)
                .tel(this.tel)
                //string dateOfBirth -> split{"-") -> Integer.parseInt() -> LocalDate.of()
                .dateOfBirth(LocalDate.of(Integer.parseInt(split[0]),Integer.parseInt(split[1]),Integer.parseInt(split[2])))
                .build();
    }

}
