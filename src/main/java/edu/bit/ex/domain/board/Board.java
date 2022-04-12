package edu.bit.ex.domain.board;

import edu.bit.ex.domain.account.Account;
import lombok.*;
import javax.persistence.*;
import java.time.LocalDate;


@Getter @Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Board {

    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne(fetch=FetchType.LAZY)
    private Account writer;

    private String boardTitle;

    @Lob
    private String boardContent;

    @Enumerated(EnumType.STRING)
    private BoardType boardType;

    private int boardHit;

    private int boardGroup;

    private int boardIndent;

    private int boardStep;

    private LocalDate createdDate;

    private LocalDate updatedDate;


}
