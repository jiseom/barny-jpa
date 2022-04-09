package edu.bit.ex.service.member;


import edu.bit.ex.mapper.MemberMapper;
import edu.bit.ex.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private final PasswordEncoder passwordEncoder;
    @Autowired
    private MemberMapper memberMapper;


    @Override
    @Transactional
            (rollbackFor = Exception.class)
    public void addUser(MemberVO memberVO) {

        String rawPassword = memberVO.getPw();
        String encodedPassword = passwordEncoder.encode(rawPassword);
        memberVO.setPw(encodedPassword);
        //멤버 인서트하고나서
        memberMapper.insertUser(memberVO);
        // 디비에 저장된 해당 멤버의 인덱스 값을 가져옴.
        int memberIdx = memberMapper.getMemberIdx(memberVO);
        // 그리고나서 여기에 다시 세팅해서
        memberVO.setMember_idx(memberIdx);
        // auth 객체 인서트 할 때 사용함
        memberMapper.insertAuthorities(memberVO);


    }

    @Override
    public boolean checkValidatePw(String pw) {
        return pw.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,20}$");
    }

    @Override
    public boolean emailCheck(String email) {
        return memberMapper.checkEmail(email) == 0;
    }

    @Override
    public boolean check(String member_id) {
        return member_id.matches("^[A-Za-z0-9]{6,12}$");
    }

    @Override
    public boolean checkValidateNickname(String nickname) {
        return memberMapper.checkNickname(nickname) == 0;
    }

    //==  id 중복검사 구현 ==//
    @Override
    public boolean checkDuplicateId(String member_id) {

        return memberMapper.checkOverId(member_id) == 0;
    }

    @Override
    public MemberVO findId(String member_id) {
        return memberMapper.findId(member_id);
    }


    @Override
    public int changePw(String pw, String member_id, String email) {

        System.out.println("pw" +pw);
        System.out.println("member_id = " + member_id);
        System.out.println("email = " + email);
        return memberMapper.changePw(pw,member_id,email);
    }

    @Override
    @Transactional
            (rollbackFor = Exception.class)
	public int updateUser(MemberVO memberVO) {
		String rawPassword = memberVO.getPw();
        String encodedPassword = passwordEncoder.encode(rawPassword);
        memberVO.setPw(encodedPassword);
        
        //멤버 인서트하고나서
        memberMapper.updateUser(memberVO);
        // 디비에 저장된 해당 멤버의 인덱스 값을 가져옴.
        int memberIdx = memberMapper.getMemberIdx(memberVO);
        // 그리고나서 여기에 다시 세팅해서
        memberVO.setMember_idx(memberIdx);
        // auth 객체 인서트 할 때 사용함
//        memberMapper.updateAuthorities(memberVO);
        return memberMapper.updateUser(memberVO);
		
	}
    
    //탈퇴
	@Override
	public void deleteUser(MemberVO memberVO) {
		memberMapper.deleteUser(memberVO);
	}

	
////
//	@Override
//	public String getPw(MemberVO memberVO) {
//		return memberMapper.getPw(memberVO);
//	}
//
//	@Override
//	public boolean deleteUser(MemberVO memberVO) {
//		return memberMapper.deleteUser(memberVO)==1 ? true:false;
//	}



//	@Override
//	public MemberVO deleteUser(int member_idx) {
//		 return memberMapper.deleteUser(member_idx);
//	}



}