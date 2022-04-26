package edu.bit.ex.web.dto;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.board.Board;
import edu.bit.ex.domain.board.BoardType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.validation.constraints.NotBlank;
import java.time.LocalDate;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class CreateNoticeForm {

    @NotBlank
    private String boardTitle;

    @NotBlank
    private String boardContent;

    private LocalDate createDateTime;

    @Enumerated(EnumType.STRING)
    private BoardType boardType;


    private Account admin;

    public Board toEntity(CreateNoticeForm createNoticeForm) {
        return Board.builder()
                .boardTitle(createNoticeForm.getBoardTitle())
                .boardContent(createNoticeForm.getBoardContent())
                .createdDate(LocalDate.now())
                .boardType(BoardType.NOTICE)
                .writer(admin)
                .build();

    }

}
