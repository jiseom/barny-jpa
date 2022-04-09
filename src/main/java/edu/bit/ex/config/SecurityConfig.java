package edu.bit.ex.config;

//import edu.bit.ex.oauth2.PrincipalOauth2UserService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
@EnableWebSecurity
@RequiredArgsConstructor

public class SecurityConfig extends WebSecurityConfigurerAdapter {

    public static final String ROLE_USER = "USER";
    public static final String ROLE_ADMIN = "ADMIN";
    private final UserDetailsService userDetailsService;
//    private final PrincipalOauth2UserService principalOauth2UserService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {


        http.csrf().disable();

        http.authorizeRequests()
                .antMatchers("/user/**", "/css/**").authenticated()
                .antMatchers("/admin/**").hasRole(ROLE_ADMIN)
                .anyRequest().permitAll()

                .and()
                .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/main")

                .and()
                .logout()
                .logoutSuccessUrl("/main") // 로그아웃 성공시 리다이렉트 주소
                .invalidateHttpSession(true) // 로그아웃 이후 세션 전체 삭제 여부
                .permitAll();

//                .and()
//                .oauth2Login()
//                .loginPage("/login")
//                .userInfoEndpoint() // OAuth2 로그인 성공 이후 사용자 정보를 가져올 때의 설정
//                .userService(principalOauth2UserService)
//                .and()
//                .defaultSuccessUrl("/main");
//                .and()
//                .oauth2Login()
//                .loginPage("/loginForm")
//                .loginPage("/login")
//                // 소셜로그인이 완료되면 후처리가 필요함 1.코드받기(인증) 2.엑세스토큰(권한) 3.사용자프로필 가져오기 4. 가져온 정보를 토대로
//                // 회원가입을 자동으로 진행
//                .userInfoEndpoint() // OAuth2 로그인 성공 이후 사용자 정보를 가져올 때의 설정
//                .userService(principalOauth2UserService)
//                // 로그인 성공 시 수행 할 UserService 구현체 지정, 엑세스토큰 + 사용자프로필정보 같이 받음
//                .and()
//                .defaultSuccessUrl("/main"); // 소셜 로그인이 성공하면 이동할 주소

        http

                .rememberMe()
                .userDetailsService(userDetailsService);


    }


    @Override
    public void configure(WebSecurity web) throws Exception {
        //== css 같은 리소스 파일 허가할때는 configure(WebSecurity web) 메소드 쓰세요. ==//
        web.ignoring().antMatchers("/css/**", "/script/**", "/image/**", "/fonts/**", "/lib/**","/static/**");
        web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations());
    }

    @Bean
    public PasswordEncoder passwordEncoder() {

        return new BCryptPasswordEncoder();
    }


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);

    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }
}
