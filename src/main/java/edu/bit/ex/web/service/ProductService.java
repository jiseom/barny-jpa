package edu.bit.ex.web.service;

import edu.bit.ex.domain.product.Product;
import edu.bit.ex.domain.product.ProductRepository;
import edu.bit.ex.domain.product.ProductType;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Transactional
@RequiredArgsConstructor
@Service
public class ProductService {

    private final ProductRepository productRepository;

    public Page<Product> getProductsByTypeWithPageable(ProductType productType, Pageable pageable) {
        return (Page<Product>) productRepository.findAllByProductType(productType);
    }

    public Product getProductDetail(Product product) {
        Optional<Product> byId = productRepository.findById(product.getId());
        return byId.orElseThrow(IllegalArgumentException::new);
//        orElseThrow(() -> new IllegalArgumentException());
    }

    public List<Product> getProductsByType(ProductType productType) {
        return productRepository.findAllByProductType(productType);
    }
}
