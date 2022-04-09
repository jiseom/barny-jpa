package edu.bit.ex.service.member;


import java.util.List;

import edu.bit.ex.vo.MemberVO;

public interface MemberService {

    boolean checkDuplicateId(String member_id);

    void addUser(MemberVO memberVO);


    boolean checkValidatePw(String pw);

    boolean emailCheck(String email);

    boolean check(String member_id);

    boolean checkValidateNickname(String nickname);

    MemberVO findId(String email);

    int changePw(String pw, String member_id, String email);
    
    
    //회원정보수정
	int updateUser(MemberVO memberVO);

	//회원정보탈퇴
	void deleteUser(MemberVO memberVO);





}
