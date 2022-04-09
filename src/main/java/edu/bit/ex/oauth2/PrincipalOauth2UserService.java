//package edu.bit.ex.oauth2;
//
//import java.util.Map;
//
//import edu.bit.ex.mapper.MemberMapper;
//import edu.bit.ex.vo.MemberVO;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
//import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
//import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
//import org.springframework.security.oauth2.core.user.OAuth2User;
//import org.springframework.stereotype.Service;
//
//
//import lombok.extern.slf4j.Slf4j;
//
//@Service
//@Slf4j
//public class PrincipalOauth2UserService extends DefaultOAuth2UserService {
//    // DefaultOAuth2UserService는 OAuth2UserService의 구현체
//
//    @Autowired
//    private MemberMapper memberMapper;
//
//    @Override // userRequest는 code를 받아서 accessToken을 응답받은 객체
//    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
//        log.info("Login for OAuth2Service =======================");
//
//        OAuth2User oauth2User = super.loadUser(userRequest);
//        OAuth2UserInfo userInfo = null;
//
//        log.info(userRequest.getClientRegistration().toString());
//        log.info(userRequest.getAccessToken().toString());
//        log.info(oauth2User.getAttributes().toString());
//
//        if (userRequest.getClientRegistration().getRegistrationId().equals("kakao")) {
//            userInfo = new KakaoUserInfo((Map) oauth2User.getAttributes());
//        }else if (userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
//            userInfo = new NaverUserInfo((Map) oauth2User.getAttributes().get("response"));
//        }
//
////        if (userRequest.getClientRegistration().getRegistrationId().equals("naver")) {
////            // getRegistrationId로 어떤 oauth로 로그인했는지 확인 가능
////
////            userInfo = new NaverUserInfo((Map) oauth2User.getAttributes().get("response"));
////
////        } else if (userRequest.getClientRegistration().getRegistrationId().equals("kakao")) {
////
////            userInfo = new KakaoUserInfo(oauth2User.getAttributes());
////        }
//
//
//
//        log.info("userInfo" + userInfo);
//
//        log.info("Reqeust.. Access Token num" + userRequest.getAccessToken());
//
//        MemberVO memberVO = memberMapper.getMember(userInfo.getEmail()); // 이미 가입이 되어있는지 조회
//
//        if (memberVO == null) {// 가입되어 있지 않다면 가입진행
//            memberVO = new MemberVO();
//            memberVO.setMember_id(userInfo.getEmail());
//            // 소셜은 로그인창에 아이디와 비밀번호를 입력하여 로그인하지 않기때문에 아이디 컬럼에 고유식별자 삽입
//            memberVO.setPw(userInfo.getProvider() + "_" + userInfo.getProviderId()); // 비밀번호를 임의로 provider+providerId 로 생성
//            //memberVO.setSignuppath(userInfo.getProvider());
//            memberVO.setMember_name(userInfo.getName());
//            memberVO.setNickname(userInfo.getName());
//            memberVO.setEmail(userInfo.getEmail());
//            memberVO.setTel("입력예정");
//            memberVO.setAddress("입력예정");
//            java.sql.Date d = java.sql.Date.valueOf("1998-01-01");
//            memberVO.setDate_of_birth(d);
//
//            memberMapper.insertUser(memberVO); //가입정보 디비에 입력
//            int memberIdx = memberMapper.getMemberIdx(memberVO);
//            memberVO.setMember_idx(memberIdx);
//            memberMapper.insertAuthorities(memberVO);// 권한 db에 입력
//
//            memberVO.setAuthList(memberMapper.getAuthList(memberVO));
//
//            // memberVO = memberMapper.getMember(userInfo.getEmail());
//
//
//        }
//
//        return new MemberDetails(memberVO, oauth2User.getAttributes());
//
//    }
//
//}