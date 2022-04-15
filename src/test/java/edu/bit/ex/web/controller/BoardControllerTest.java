package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.AccountRepository;
import edu.bit.ex.domain.account.Role;
import edu.bit.ex.domain.account.UserAccount;
import edu.bit.ex.domain.board.Board;
import edu.bit.ex.domain.board.BoardRepository;
import edu.bit.ex.domain.board.BoardType;
import edu.bit.ex.web.dto.InquiryForm;
import edu.bit.ex.web.service.AccountService;
import edu.bit.ex.web.service.BoardService;
import org.junit.jupiter.api.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDate;
import java.util.List;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;


@AutoConfigureMockMvc
@Transactional
@SpringBootTest
class BoardControllerTest {

    @Autowired
    MockMvc mockMvc;
    @MockBean
    JavaMailSender javaMailSender;
    @Autowired
    BoardRepository boardRepository;
    @Autowired
    BoardService boardService;
    @Autowired
    AccountRepository accountRepository;
    @Autowired
    AccountService accountService;

    @BeforeEach
    void beforeEach() {
      addAccount("wltjs123", "지선", "wltjs", "jiseon@email.com", "wltjs123!", "서울", "010-1000-1000", toLocalDate("2020-06-22"), Role.ROLE_USER);
    }

    public void addAccount(String accountId, String name, String nickname, String email, String password, String address, String tel, LocalDate dateOfBirth, Role role) {
        Account account = new Account();
        account.setAccountId(accountId);
        account.setName(name);
        account.setNickname(nickname);
        account.setEmail(email);
        account.setPassword(password);
        account.setAddress(address);
        account.setTel(tel);
        account.setDateOfBirth(dateOfBirth);
        account.setRole(role);
        accountRepository.save(account);

        UserAccount userAccount = new UserAccount(account);
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(userAccount, userAccount.getPassword(), userAccount.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(token);

    }

    public LocalDate toLocalDate(String dateOfBirth) {
        String[] split = dateOfBirth.split("-");
        return LocalDate.of(Integer.parseInt(split[0]), Integer.parseInt(split[1]), Integer.parseInt(split[2]));
    }


    @AfterEach
    void AfterEach() {
        accountRepository.deleteAll();
        boardRepository.deleteAll();
    }

    @DisplayName("1:1 문의 폼")
    @Test
    void inquiryForm() throws Exception {
        mockMvc.perform(get("/inquiries/new"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(view().name("/board/my_view_write"))
                .andExpect(model().attributeExists("inquiryForm"))
                .andExpect(authenticated());
    }


    @DisplayName("1:1문의 등록")
    @Test
    void addInquiry() throws Exception {
        mockMvc.perform(post("/inquiries/new")
                        .param("boardTitle", "주문 문의")
                        .param("boardContent", "주문 문의 합니다.")
                        .param("boardType", String.valueOf(BoardType.ORDER_INQUIRY))
                        .with(csrf()))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/inquiries"));
    }

    @DisplayName("1:1 문의 수정")
    @Test
    void updateInquiry() throws Exception {
        InquiryForm inquiryForm = new InquiryForm();
        inquiryForm.setBoardTitle("주문");
        inquiryForm.setBoardContent("주문");
        inquiryForm.setBoardType(BoardType.ORDER_INQUIRY);
        Board board = inquiryForm.toEntity();
        Account account = accountRepository.findByAccountId("wltjs");
        board.setWriter(account);
        boardRepository.save(board);

        mockMvc.perform(post("/inquiries/{boardId}/update",board.getId())
                .param("boardTitle", "주문 123")
                .param("boardContent", "주문 123")
                .with(csrf()))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/inquiries"));
            }


        @DisplayName("1:1 문의 삭제")
        @Test
            void deleteInquiry() throws Exception {
            InquiryForm inquiryForm = new InquiryForm();
            inquiryForm.setBoardTitle("주문");
            inquiryForm.setBoardContent("주문");
            inquiryForm.setBoardType(BoardType.ORDER_INQUIRY);
            Board board = inquiryForm.toEntity();
            Account account = accountRepository.findByAccountId("wltjs");
            board.setWriter(account);
            boardRepository.save(board);

            mockMvc.perform(get("/inquiries/{id}/delete", board.getId()))
                    .andExpect(status().is3xxRedirection())
                    .andExpect(redirectedUrl("/inquiries"));
            List<Board> all = boardRepository.findAll();
            System.out.println(all);
        }


}