package edu.bit.ex.web.service;

import com.google.gson.Gson;
import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.AccountRepository;
import edu.bit.ex.domain.account.Role;
import edu.bit.ex.domain.cart.Cart;
import edu.bit.ex.web.dto.SignUpForm;
import edu.bit.ex.web.dto.UpdateAccountForm;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Random;

@RequiredArgsConstructor
@Transactional
@Service
public class AccountService {

    private final PasswordEncoder passwordEncoder;
    private final AccountRepository accountRepository;
    private final JavaMailSender javaMailSender;
    private final ModelMapper modelMapper;

    public Account addAccount(SignUpForm signUpForm) {
        String encodedPassword = passwordEncoder.encode(signUpForm.getPassword());
        Account account = signUpForm.toEntity();
        account.setPassword(encodedPassword);
        account.setRole(Role.ROLE_USER);
        return accountRepository.save(account);
    }

    /**
     * 회원가입 이메일 인증 로직
     */
    public String checkEmail(String email) {
        Random random = new Random();
        Gson gson = new Gson();
        String key = "";

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소
        // 입력 키를 위한 코드
        for (int i = 0; i < 3; i++) {
            int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
            key += (char) index;
        }
        int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
        key += numIndex;

        message.setSubject("환영합니다! BARNY 가입 인증번호 입력을 위한 메일 전송");
        message.setText(
                "안녕하세요 BARNY 가입한 아이디 안내 관련 이메일 입니다.\n" + "인증번호 [ " + key + " ] 를 입력해주세요");
        javaMailSender.send(message);

        return gson.toJson(key);
    }

    /**
     * 회원 아이디 찾기
     */
    public String usernameRecovery(String email) {
        Gson gson = new Gson();
        String toJson = "";

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소

        Account findAccountByEmail = accountRepository.findByEmail(email);

        String accountId = findAccountByEmail.getAccountId();
        String name = findAccountByEmail.getName();

        message.setSubject(name + "님의 BARNY 🐰 가입 아이디 안내 ");
        message.setText(
                "안녕하세요 BARNY 가입한 아이디 안내 관련 이메일 입니다.\n" +
                        name + " 님의 가입 아이디는 [ " + accountId + " ] 입니다.");
        javaMailSender.send(message);

        return gson.toJson(toJson);
    }

    //회원 비밀번호 찾기
    public String passwordRecovery(String email) {
        Random random = new Random();

        Gson gson = new Gson();
        String key = "";

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소
        // 입력 키를 위한 코드
        for (int i = 0; i < 3; i++) {
            int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
            key += (char) index;
        }
        int numIndex = random.nextInt(8999) + 100000; // 4자리 정수를 생성
        key += numIndex;

        Account findAccountByEmail = accountRepository.findByEmail(email);

        message.setSubject(findAccountByEmail.getName() + "님의 BARNY 임시 비밀번호 안내 ");
        message.setText(
                "안녕하세요 BARNY 임시비밀번호 안내 관련 이메일 입니다.\n" +
                        findAccountByEmail.getName() + " 님의 임시 비밀번호는 [ " + key + " ] 입니다.");
        javaMailSender.send(message);
        System.out.println("temporary password = " + key);
        key = passwordEncoder.encode(key);

        String accountId = findAccountByEmail.getAccountId();
        Account findAccount = accountRepository.findByAccountId(accountId);
        findAccount.updatePassword(key);

        return gson.toJson(key);

    }
    //개인 정보 수정
    public void updateAccountInfo( Account account, UpdateAccountForm updateAccountForm) {
        account.updateAccountInfo(updateAccountForm);
        accountRepository.save(account);
    }
    //회원 탈퇴
    public void deleteAccount(Account account) {
        account.deleteAccount();
        accountRepository.save(account);
    }
}

