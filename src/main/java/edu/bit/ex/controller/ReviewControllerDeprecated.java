package edu.bit.ex.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
public class ReviewControllerDeprecated {

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
    public ResponseEntity<String> updateLike(@RequestBody ProductMainVO productMainVO, HttpServletResponse response,
            Principal principal, HttpServletRequest request) throws Exception {

        ResponseEntity<String> entity = null;

        Cookie[] cookies = request.getCookies(); // 쿠키 불러오기

        Cookie lCookie = null; // 비교하기 위해 새로운 쿠키

        if (cookies != null && cookies.length > 0) {
            // 쿠키 배열이 null이 아님

            for (Cookie c : cookies) {
                // 쿠키 배열을 돌려서 같은 쿠키가 있느냐
                if (c.getName().equals("board_id" + productMainVO.getBoard_id())) {

                    if (c.getValue().contains(principal.getName())) {
                        log.info("생성된 쿠키 있음");

                        // 찾은 쿠키를 비교하는 쿠키에 저장
                        lCookie = c;
                    }

                }
            }

        } else {
            log.info("만들어진 쿠키가 없습니다.");

        }
        if (lCookie == null) {
            log.info("찾은 쿠키도 없다.");
            try {
                // 여기에 왔다는 증거 쿠키
                Cookie setCookie = new Cookie("board_id" + productMainVO.getBoard_id(), principal.getName());
                setCookie.setMaxAge(60 * 60 * 24 * 30);
                response.addCookie(setCookie);

                // 좋아요 로직

                try {

                    selectHitService.updateLike(productMainVO);

                    int b_like = selectHitService.getLike(productMainVO.getBoard_id());
                    entity = new ResponseEntity<String>(String.valueOf(b_like), HttpStatus.OK);

                } catch (Exception e) {
                    e.printStackTrace();
                    entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
                }

                return entity;

            } catch (Exception e) {
                // 오류

                log.info("쿠키 넣을때 오류 나나? : " + e.getMessage());
                e.getStackTrace();

            }
        } else {
            // 만들어진 lCookie가 있음
            System.out.println("viewCookie 확인 로직 : 쿠키 있당");
            String value = lCookie.getValue();
            System.out.println("viewCookie 확인 로직 : 쿠키 value : " + value);

            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println(selectHitService.getLike(productMainVO.getBoard_id()));

        }

        return null;

    }

    // make folder
    private String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String str = sdf.format(date);
        return str.replace("-", File.separator);
    }

    // 후기 write
    @PostMapping("/review/write")
    public String writeReview(ProductMainVO productMainVO, @RequestParam("file") MultipartFile[] uploadFile)
            throws IOException {

        List<FileVO> fileList = new ArrayList<>();

        String uploadFolder = "C:\\Users\\devyun\\Workspace\\project_barny\\src\\main\\resources\\static\\upload";

        String uploadFolderPath = getFolder();

        // make folder
        File uploadPath = new File(uploadFolder, uploadFolderPath);

        if (uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }

        for (MultipartFile multipartFile : uploadFile) {

            log.info("===================================");
            log.info("upload File Name: " + multipartFile.getOriginalFilename());
            log.info("upload File Size: " + multipartFile.getSize());
            log.info("upload File Path: " + uploadPath);

            if (multipartFile.getSize() == 0) {
                continue;
            }
            FileVO fileVO = new FileVO();

            fileVO.setImage_name(multipartFile.getOriginalFilename());

            String fileExtension = multipartFile.getOriginalFilename()
                    .substring(multipartFile.getOriginalFilename().lastIndexOf("."));
            // lastIndexOf(".") = 14(index는 0번부터)
            // substring(14) = .doc
            fileVO.setImage_extension(fileExtension);
            String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + fileExtension;
            // UUID클래스 - (특수문자를 포함한)문자를 랜덤으로 생성 "-"라면 생략으로 대체

            log.info("upload File SaveName: " + storedFileName);
            log.info("upload File Extension: " + fileExtension);

            // 이미지 저장 주소 자르기
            String path = uploadPath.getAbsolutePath() + "\\" + storedFileName;
            String result = path.substring(path.indexOf("\\static"));
            String result2 = result.replace("\\", "/");
            // String result3 = "http://localhost:8282" + result2;

            log.info("실제로 불러올 주소: " + result2);

            try {
                File saveFile = new File(uploadPath, storedFileName);
                multipartFile.transferTo(saveFile);
                fileVO.setImage_uuid(storedFileName);
                fileVO.setImage_route(result2);
                fileVO.setProduct_id(productMainVO.getProduct_id());

                fileList.add(fileVO);

            } catch (Exception e) {
                log.error(e.getMessage());
            } // end catch
            log.info("===================================");

        }

        productMainVO.setFileList(fileList);
        log.info("productMainVO.getFileList()" + productMainVO.getFileList());
        productMainService.writeReview(productMainVO);

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
