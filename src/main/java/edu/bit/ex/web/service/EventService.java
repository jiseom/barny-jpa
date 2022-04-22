package edu.bit.ex.web.service;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.board.Board;
import edu.bit.ex.domain.board.BoardRepository;
import edu.bit.ex.domain.board.BoardType;
import edu.bit.ex.web.dto.EventForm;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@RequiredArgsConstructor
@Service
public class EventService {

    private final BoardRepository boardRepository;

    public List<Board> getList() {

       return boardRepository.findByBoardType(BoardType.EVENT);

    }

    /**
     * 이벤트 참여여부 체크
     */
    public void canParticipateEvent(Account account, EventForm eventForm) {

        eventForm.setParticipatedDate(eventForm.getParticipatedDate());

//         <![CDATA[
//                select to_char(participate_date, 'yyyymmdd') from b_event
//        where member_idx = #{member_idx}
//        and (to_char(participate_date, 'yyyymmdd') = to_char(sysdate, 'yyyymmdd'))
//        ]]>
//    </select>


    }

    public void addCardCamePoints(Account account) {
        account.updateCardGamePoint();

    }

//    public void participatedCardGame(Account account) {
//        account.updatePaticipatedCardGame();
//    }
}
