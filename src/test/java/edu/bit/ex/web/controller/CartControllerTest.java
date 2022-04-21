package edu.bit.ex.web.controller;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.AccountRepository;
import edu.bit.ex.domain.account.Role;
import edu.bit.ex.domain.account.UserAccount;
import edu.bit.ex.domain.cart.Cart;
import edu.bit.ex.domain.cart.CartRepository;
import edu.bit.ex.domain.product.Product;
import edu.bit.ex.domain.product.ProductRepository;
import edu.bit.ex.domain.product.ProductType;
import edu.bit.ex.web.dto.CreateCartForm;
import edu.bit.ex.web.service.CartService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.DataSource;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@AutoConfigureMockMvc
@Transactional
@SpringBootTest
class CartControllerTest {


    @Autowired
    CartRepository cartRepository;

    @Autowired
    AccountRepository accountRepository;
    @Autowired
    ProductRepository productRepository;

    @Autowired
    CartService cartService;

    @Autowired
    MockMvc mockMvc;

    @MockBean
    private JavaMailSender javaMailSender;

    @Autowired
    DataSource dataSource;

    @BeforeEach
    void beforeEach() {
//        addAccount("wltjs123", "지선", "wltjs", "jiseon@email.com", "wltjs123!", "서울", "010-1000-1000", toLocalDate("2020-06-22"), Role.ROLE_USER);
        addProduct();
    }

    public Account addAccount(String accountId, String name, String nickname, String email, String password, String address, String tel, LocalDate dateOfBirth, Role role) {
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
        return accountRepository.save(account);

    }

    public LocalDate toLocalDate(String dateOfBirth) {
        String[] split = dateOfBirth.split("-");
        return LocalDate.of(Integer.parseInt(split[0]), Integer.parseInt(split[1]), Integer.parseInt(split[2]));
    }

    public Product addProduct() {
        Product product = new Product();
        product.setId(1L);
        product.setProductName("안주100");
        product.setPrice(10000);
        product.setStock(10);
        product.setProductType(ProductType.FOOD);
        return productRepository.save(product);
    }
    public Product addProduct1() {
        Product product = new Product();
        product.setId(2L);
        product.setProductName("안주200");
        product.setPrice(20000);
        product.setStock(10);
        product.setProductType(ProductType.DRINK);
        return productRepository.save(product);
    }



    @BeforeEach
    void deleteAll() {
        cartRepository.deleteAll();
        accountRepository.deleteAll();
    }


    @DisplayName("장바구니 담기 테스트")
    @Test
    public void addCart() throws Exception {
        Product product = addProduct();
        Product product1 = addProduct1();
        Account account = addAccount("wltjs123", "지선", "wltjs", "jiseon@email.com", "wltjs123!", "서울", "010-1000-1000", toLocalDate("2020-06-22"), Role.ROLE_USER);
        UserAccount userAccount = new UserAccount(account);
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(userAccount, userAccount.getPassword(), userAccount.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(token);

        CreateCartForm createCartForm = new CreateCartForm();
        createCartForm.setCartCustomer(account);
        createCartForm.setSelectedItem(product);
        createCartForm.setQuantity(1);
        Cart cart = cartService.addCart(product, account, createCartForm);

        mockMvc.perform(get("/cart/addCart"))
                .andExpect(status().isOk());

        Assertions.assertEquals(cart.getCartCustomer().id, createCartForm.getCartCustomer().id);
        
    }
    @DisplayName("장바구니 조회")
    @Test
    public void getCartList() throws Exception {

        Account account = addAccount("wltjs123", "지선", "wltjs", "jiseon@email.com", "wltjs123!", "서울", "010-1000-1000", toLocalDate("2020-06-22"), Role.ROLE_USER);
        UserAccount userAccount = new UserAccount(account);
        UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(userAccount, userAccount.getPassword(), userAccount.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(token);

        List<Product> cartList = new ArrayList<>();
        cartList.add(addProduct());
        cartList.add(addProduct1());

        mockMvc.perform(get("/cart"))
                .andExpect(model().attributeExists("cartList"))
                .andExpect(status().isOk())
                .andExpect(view().name("/cart/cart"));
    }

}