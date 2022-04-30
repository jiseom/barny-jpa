package edu.bit.ex.config;

import edu.bit.ex.config.dto.OAuthAttributes;
import edu.bit.ex.config.dto.SessionUser;
import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.AccountRepository;
import edu.bit.ex.domain.account.UserAccount;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpSession;
import java.util.Collections;

@RequiredArgsConstructor
@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {
    //구글 로그인 이후 가져온 사용자의 정보 들을 기반으로 가입 및 정보수정,세션 저장등의 기능을 지원

    private final AccountRepository accountRepository;
    private final HttpSession httpSession;
    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        /*DefaultOAuth2UserService -> OAuth2UserService 의 구현체로
        표준 OAuth 2.0 공급자를 지원하는 클래스*/
        OAuth2UserService<OAuth2UserRequest, OAuth2User> delegate = new DefaultOAuth2UserService();

        //UserInfoEndPoint ,getUserNameAttributeName() 이 필요하다.
        //왜? 사용자의 이름에 엑세스하는 데 사용되는 속성 이름이 필요하기 때문
        OAuth2User oAuth2User = delegate.loadUser(userRequest);

        //로그인 진행 중인 서비스를 구분하는 코드 , 구글인지 ? 네이버인지?
        String registrationId = userRequest.getClientRegistration().getRegistrationId();

        //userNameAttribute -> pk 와 같음 , 네이버로그인과 구글로그인을 동시 지원할 떄 사용
        String userNameAttributeName = userRequest.getClientRegistration().getProviderDetails().getUserInfoEndpoint().getUserNameAttributeName();

        //OAuthAttributes: OAuth2UserService 를 통해 가져온 OAuth2User 의 attribute 를 담을 dto 같은 클래스
        //of () OAuth2User 에서 반환하는 사용자 번호는 Map 이기 떄문에 값 하나하나를 변환해야 함.
        OAuthAttributes attributes = OAuthAttributes.of(registrationId, userNameAttributeName, oAuth2User.getAttributes());

        Account account = saveOrUpdate(attributes);

        //sessionUser : 세션에 사용자 정보를 저장하기 위한 dto 클래스
        httpSession.setAttribute("account", new SessionUser(account));
        SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(account,account.getPassword(), Collections.singleton(new SimpleGrantedAuthority(account.getRoleKey()))));
        return new UserAccount(account);
    }

    private Account saveOrUpdate(OAuthAttributes attributes) {
        Account account = accountRepository.findByEmail(attributes.getEmail())
                .map(entity -> entity.update(attributes.getName(), attributes.getPicture()))
                .orElse(attributes.toEntity());
        return accountRepository.save(account);


    }

}
