package edu.bit.ex.web.dto;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.board.Board;
import edu.bit.ex.domain.board.BoardType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Lob;
import java.time.LocalDate;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class InquiryForm {

    private String boardTitle;

    @Lob
    private String boardContent;

    @Enumerated(EnumType.STRING)
    private BoardType boardType;

    public Board toEntity() {
        return Board.builder()
                .boardTitle(this.getBoardTitle())
                .boardContent(this.getBoardContent())
                .boardType(this.boardType)
                .createdDate(LocalDate.now())
                .build();
    }

}
