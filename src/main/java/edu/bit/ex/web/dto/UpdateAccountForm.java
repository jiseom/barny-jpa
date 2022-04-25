package edu.bit.ex.web.dto;

import edu.bit.ex.domain.account.Account;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UpdateAccountForm {

    final static int PASSWORD_MIN = 8;
    final static int PASSWORD_MAX = 20;

    @Pattern(regexp = "^((?=.*\\d)(?=.*[a-zA-Z])(?=.*[\\W]).{" + PASSWORD_MIN + "," + PASSWORD_MAX + "})$",
            message = "영어,숫자,특수문자 포함하여 8 ~ 20 자 이내로 입력해주세요.")
    private String password;

    private String address;

    @Pattern(regexp = "^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$",
            message = "휴대폰 번호 양식에 맞게 입력해주세요.")
    private String tel;


}
