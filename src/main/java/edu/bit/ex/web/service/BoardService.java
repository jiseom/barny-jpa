package edu.bit.ex.web.service;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.Role;
import edu.bit.ex.domain.board.Board;
import edu.bit.ex.domain.board.BoardRepository;
import edu.bit.ex.domain.board.BoardType;
import edu.bit.ex.web.dto.InquiryForm;
import edu.bit.ex.web.dto.UpdateInquiryForm;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Transactional
@RequiredArgsConstructor
@Service
public class BoardService {

    private final BoardRepository boardRepository;

    /**
     * 나의 1:1 문의 내역
     */
    @Transactional(readOnly = true)
    public List<Board> getBoardList(Account account) {
        Long writerId = account.getId();
        List<BoardType> boardTypes = new ArrayList<>(Arrays.asList(BoardType.ORDER_INQUIRY, BoardType.PRODUCT_INQUIRY, BoardType.SHIP_INQUIRY, BoardType.ETC_INQUIRY));
        return boardRepository.getInquiries(writerId, boardTypes);
    }

    /**
     * 1:1 문의글 등록
     */
    public void addInquiry(Account account, InquiryForm inquiryForm) {
        Board board = inquiryForm.toEntity();
        board.setWriter(account);
        boardRepository.save(board);
    }

    /**
     * 1:1 문의글 상세 보기
     */
    public Board findAccountAndBoard(Account account) {
        return boardRepository.findWriter(account.getId());
    }

    /**
     * 1:1 문의글 수정
     */
    public void updateInquiry(Account account, UpdateInquiryForm updateInquiryForm) {
        Board board = boardRepository.findWriter(account.getId());
        board.setBoardTitle(updateInquiryForm.getBoardTitle());
        board.setBoardContent(updateInquiryForm.getBoardContent());
        boardRepository.save(board);
    }

    /**
     * 1:1 문의글 삭제
     */
    public void deleteInquiry(Account account,Board board) {
        boardRepository.findWriter(account.getId());
        boardRepository.delete(board);
    }
}



