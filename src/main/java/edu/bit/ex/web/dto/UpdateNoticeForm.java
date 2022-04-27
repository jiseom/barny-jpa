package edu.bit.ex.web.dto;

import edu.bit.ex.domain.board.BoardType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class UpdateNoticeForm {

    @NotBlank
    @NotNull
    private String boardTitle;

    @NotBlank
    @NotNull
    private String boardContent;

    private LocalDate updatedDate;


}
