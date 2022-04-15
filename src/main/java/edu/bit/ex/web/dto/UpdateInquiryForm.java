package edu.bit.ex.web.dto;

import edu.bit.ex.domain.board.Board;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import javax.persistence.Lob;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UpdateInquiryForm {

    private String boardTitle;
    @Lob
    private String boardContent;

}
