package edu.bit.ex.web.controller;


import edu.bit.ex.domain.product.Product;
import edu.bit.ex.domain.product.ProductRepository;
import edu.bit.ex.domain.product.ProductType;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

@Transactional
@AutoConfigureMockMvc
@SpringBootTest
class ProductControllerTest {

    @Autowired
    MockMvc mockMvc;

    @MockBean
    JavaMailSender javaMailSender;

    @Autowired
    ProductRepository productRepository;

    @AfterEach
    void AfterEach() {
        productRepository.deleteAll();
    }


    @DisplayName("상품 리스트 조회")
    @Test
    void getProduct() throws Exception {
        mockMvc.perform(get("/products/main"))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(view().name("product/product_main"));
    }

    @DisplayName("상품 상세페이지 조회")
    @Test
    void getProductDetail() throws Exception {
        Product product = new Product();
        product.setId(1L);
        product.setProductName("안주100");
        product.setPrice(10000);
        product.setStock(10);
        product.setProductType(ProductType.FOOD);
        productRepository.save(product);

        mockMvc.perform(get("/products/{id}/detail", product.getId()))
                .andExpect(status().isOk())
                .andExpect(view().name("product/product_view"));


    }
}