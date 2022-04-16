package edu.bit.ex.web.controller;

import edu.bit.ex.domain.product.Product;
import edu.bit.ex.domain.product.ProductType;
import edu.bit.ex.web.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequiredArgsConstructor
@RequestMapping("/products")
@Controller
public class ProductController {

    private final ProductService productService;

    /**
     * 패키지 및 메인 상품 리스트 조회
     */
    @GetMapping("/main")
    public String getMainProducts(Model model) {
        List<Product> products = productService.getProductsByType(ProductType.PACKAGE);
        model.addAttribute("products", products);
        return "product/product_main";
    }

    /**
     * 주류 상품 리스트 조회
     */
    @GetMapping("/drink")
    public String getDrinkList(Model model) {
        List<Product> products = productService.getProductsByType(ProductType.DRINK);
        model.addAttribute("products", products);
        return "product/product_main_liquor";
    }

    /**
     * 음식 상품 리스트 조회
     */
    @GetMapping("/food")
    public String getFoodList(Model model) {
        List<Product> products = productService.getProductsByType(ProductType.FOOD);
        model.addAttribute("products", products);
        return "product/product_main_food";
    }

    /**
     * 상품 상세 페이지 조회
     */
    @GetMapping("/{productId}/detail")
    public String getProductDetail(@PathVariable("productId") Product product,
                                   Model model) {
        Product productDetail = productService.getProductDetail(product);
        model.addAttribute("productDetail", productDetail);
        return "product/product_view";
    }
}
