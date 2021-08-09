package edu.bit.ex.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.bit.ex.service.ProductMainService;
import edu.bit.ex.service.SelectHitService;
import edu.bit.ex.vo.FileVO;
import edu.bit.ex.vo.ProductMainVO;
import edu.bit.ex.vo.account.MemberContext;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {

    // 상품보기
    @Autowired
    private ProductMainService productMainService;

    // select hit
    @Autowired
    private SelectHitService selectHitService;

    // update hit
    @ResponseBody
    @PutMapping("/product_view/updateHit")
    public ResponseEntity<String> updateHit(@RequestBody ProductMainVO productMainVO) {

        log.info("ProductMainVO:" + productMainVO);
        ResponseEntity<String> entity = null;

        try {

            productMainService.updateHit(productMainVO);

            int b_hit = selectHitService.getHit(productMainVO.getBoard_id());
            entity = new ResponseEntity<String>(String.valueOf(b_hit), HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    // update like
    @ResponseBody
    @PutMapping("/product_view/updateLike")
    public ResponseEntity<String> updateLike(@RequestBody ProductMainVO productMainVO) {

        ResponseEntity<String> entity = null;

        try {

            selectHitService.updateLike(productMainVO);

            int b_like = selectHitService.getLike(productMainVO.getBoard_id());
            entity = new ResponseEntity<String>(String.valueOf(b_like), HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    // 후기 write
    @PostMapping("/review/write")
    public String writeReview(ProductMainVO productMainVO, FileVO fileVO,
            @RequestParam("file") MultipartFile[] uploadFile) throws IOException {

        productMainService.writeReview(productMainVO);

        String uploadFolder = "C:\\Users\\devyun\\Workspace\\project_barny\\src\\main\\webapp\\WEB-INF\\upload";

        for (MultipartFile multipartFile : uploadFile) {
            log.info("===================================");
            log.info("upload File Name: " + multipartFile.getOriginalFilename());
            log.info("upload File Size: " + multipartFile.getSize());

            String fileExtension = multipartFile.getOriginalFilename()
                    .substring(multipartFile.getOriginalFilename().lastIndexOf("."));
            // lastIndexOf(".") = 14(index는 0번부터)
            // substring(14) = .doc
            String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + fileExtension;
            // UUID클래스 - (특수문자를 포함한)문자를 랜덤으로 생성 "-"라면 생략으로 대체

            log.info("upload File SaveName: " + storedFileName);

            File saveFile = new File(uploadFolder, storedFileName);

            try {
                multipartFile.transferTo(saveFile);
            } catch (Exception e) {
                log.error(e.getMessage());
            } // end catch
            log.info("===================================");

        }
        String redirect = "redirect:/product_view?product_id=" + productMainVO.getProduct_id();
        // http://localhost:8282/product_view?product_id=6
        return redirect; // 다이렉트로 특정 상품 리스트로 가게
    }

    @GetMapping("/user/review/write_view/**")
    public String write_view(Model model, ProductMainVO productMainVO, Principal principal,
            @AuthenticationPrincipal MemberContext ctx) {

        log.info("Principal" + principal.getName());
        log.info("Principal" + ctx.getMemberVO().getMember_idx());

        log.info("write_view()..");
        model.addAttribute("member_idx", ctx.getMemberVO().getMember_idx()); // 회원 번호를 jsp에 쓸때
        model.addAttribute("product_view", productMainService.get(productMainVO.getProduct_id()));
        return "user/write_view";
    }

}