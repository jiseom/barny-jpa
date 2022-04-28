package edu.bit.ex.web.dto;

import edu.bit.ex.domain.board.Board;
import edu.bit.ex.domain.board.BoardType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;
import java.time.LocalDate;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CreateReplyForm {

    @NotNull
    private String boardTitle;

    @NotNull
    private String boardContent;

    @NotNull
    private int boardGroup;

    @NotNull
    private int boardIndent;

    @NotNull
    private int boardStep;

    @NotNull
    private LocalDate createdDate;


    public Board toEntity(int boardGroup, CreateReplyForm createReplyForm) {

        return Board.builder()
                .boardTitle(createReplyForm.getBoardTitle())
                .boardContent(createReplyForm.getBoardContent())
                .boardType(BoardType.REPLY)
                .boardGroup(boardGroup)
                .boardIndent(1)
                .boardStep(1)
                .createdDate(LocalDate.now())
                .build();
    }
}
