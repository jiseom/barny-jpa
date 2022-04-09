package edu.bit.ex.controller.validator;

import edu.bit.ex.service.member.MemberService;
import edu.bit.ex.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
@RequiredArgsConstructor
public class MemberValidator implements Validator {

    private final MemberService memberService;


    @Override
    public boolean supports(Class<?> clazz) {
        return clazz.isAssignableFrom(MemberVO.class);
    }

    @Override
    public void validate(Object target, Errors errors) {
        MemberVO memberVO = (MemberVO) target;

        if (!memberService.checkDuplicateId(memberVO.getMember_id())) {
            errors.rejectValue("member_id", "duplicate.member_id", "사용중인 아이디입니다.");
        }

        if (!memberService.check(memberVO.getMember_id())) {
            errors.rejectValue("member_id", "validate.member_id", "6~12자 이내로 영문,숫자 포함");
        }

        if (!memberService.emailCheck(memberVO.getEmail())) {
            //여기는 이메일 중복 실패한 경우
            errors.rejectValue("email", "duplicate.email", "사용중인 이메일입니다.");
        }

        if (!memberService.checkValidateNickname(memberVO.getNickname())) {
            errors.rejectValue("nickname", "duplicate.nickname", "사용중인 별명입니다.");
        }

        if (!memberService.checkValidatePw(memberVO.getPw())) {
            errors.rejectValue("pw", "validate.pw", "8~20자 이내로 대소문자,숫자,특수기호 포함");
        }

    }
}
