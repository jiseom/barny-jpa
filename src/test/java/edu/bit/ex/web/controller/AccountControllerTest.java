package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.AccountRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;
import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.unauthenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@AutoConfigureMockMvc
@Transactional
@SpringBootTest
class AccountControllerTest {

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    MockMvc mockMvc;

    @BeforeEach
    void deleteAll() {
        accountRepository.deleteAll();
    }

    @DisplayName("회원 가입 뷰 ")
    @Test
    void signUpForm() throws Exception {
        mockMvc.perform(get("/account/new"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(view().name("account/sign-up-form"))
                .andExpect(model().attributeExists("signUpForm"))
                .andExpect(unauthenticated());
    }

    @DisplayName("회원 가입_입력값 오류")
    @Test
    void addAccountFail() throws Exception {
        mockMvc.perform(post("/account/new")
                        .param("accountId", "j")
                        .param("name", "지선")
                        .param("nickname", "wltkjs")
                        .param("email", "emailcom")
                        .param("password", "wltjs123!")
                        .param("address", "서울")
                        .param("tel", "010-1000-1000")
                        .param("dateOfBirth", "2020-06-22")
                        .with(csrf()))
                .andExpect(view().name("account/sign-up-form"))
                .andExpect(status().isOk());
    }

    @DisplayName("회원 가입_성공")
    @Test
    void addAccountSuccess() throws Exception {

        mockMvc.perform(post("/account/new")
                        .param("accountId", "jiseon")
                        .param("name", "지선")
                        .param("nickname", "wltkjs")
                        .param("email", "email@com")
                        .param("password", "Wltjs123!")
                        .param("address", "서울")
                        .param("tel", "010-1000-1000")
                        .param("dateOfBirth", "2020-06-22")
                        .with(csrf()))
                .andExpect(status().is3xxRedirection())
                .andExpect(view().name("redirect:/success-sign-up"));
        Account account = accountRepository.findByAccountId("jiseon");
        assertNotNull(account);
        assertNotEquals(account.getPassword(),"Wltjs123!");
    }
}