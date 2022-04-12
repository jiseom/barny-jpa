package edu.bit.ex.web.service;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.account.AccountRepository;
import edu.bit.ex.domain.board.Board;
import edu.bit.ex.domain.board.BoardRepository;
import edu.bit.ex.domain.board.BoardType;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public List<Board> getBoardList(Account account) {
        Long writerId = account.getId();
        List<BoardType> boardTypes = new ArrayList<>(Arrays.asList(BoardType.ORDER_INQUIRY,BoardType.PRODUCT_INQUIRY,BoardType.SHIP_INQUIRY,BoardType.ETC_INQUIRY));
        return boardRepository.getInquiries(writerId,boardTypes);
    }



}
