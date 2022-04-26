package edu.bit.ex.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import edu.bit.ex.page.Criteria;
import edu.bit.ex.page.PageVO;
import edu.bit.ex.service.NoticeService;
import edu.bit.ex.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/admin/notice/**")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    // list
    @GetMapping("/main")
    public ModelAndView list(Criteria cri, ModelAndView mav) {
        mav.setViewName("notice/main"); // notice/main.jsp
        mav.addObject("list", noticeService.getList(cri)); // 여기서 정한게 jsp items

        int total = noticeService.getTotal(cri);
        mav.addObject("pageMaker", new PageVO(cri, total)); // 1,10 넘어가서 여기에 만들어짐

        return mav;
    }

    // write
    @PostMapping("/write")
    public void write(NoticeVO noticeVO, HttpServletResponse response) throws IOException {

        noticeService.write(noticeVO);
        String redirect_uri = "http://localhost:8282/admin/notice/main";
        response.sendRedirect(redirect_uri);

    }

    @GetMapping("/write_view")
    public ModelAndView write_view(ModelAndView mav) {
        mav.setViewName("notice/write_view"); // notice/write_view.jsp
        return mav;
    }

    // update
    @PutMapping("/content/{board_id}")
    public ResponseEntity<String> update(@RequestBody NoticeVO noticeVO, ModelAndView mav) {

        ResponseEntity<String> entity = null;

        try {

            noticeService.modify(noticeVO);
            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    // delete
    @DeleteMapping("/content/{board_id}")
    public ResponseEntity<String> delete(@PathVariable("board_id") int board_id) {
        ResponseEntity<String> entity = null;

        log.info("board_id..:" + board_id);
        try {
            int re = noticeService.remove(board_id);
            log.info("delete result:" + re);
            // 삭제가 성공하면 성공 상태메시지 저장
            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            // 삭제가 실패하면 실패 상태메시지 저장
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        // 삭제 처리 HTTP 상태 메시지 리턴
        return entity;
    }

    // content view
    @GetMapping("/content/{board_id}")
    public ModelAndView content_view(NoticeVO noticeVO, ModelAndView mav) {
        mav.setViewName("notice/content_view");
        mav.addObject("content_view", noticeService.get(noticeVO.getBoard_id()));

        return mav;
    }

    // delete by checkbox
    @RequestMapping(value = "/delete_")
    public String deleteByCheckbox(HttpServletRequest request) throws Exception {
        String[] deleteByCheckbox = request.getParameterValues("valueArr");
        int size = deleteByCheckbox.length;
        log.info("deleted notice number: " + size);
        for(int i=0; i<size; i++) {
            noticeService.delete2(deleteByCheckbox[i]);
        }
        return "redirect:/main";
    }
}