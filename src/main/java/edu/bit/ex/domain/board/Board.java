package edu.bit.ex.domain.board;

import edu.bit.ex.domain.account.Account;
import edu.bit.ex.domain.product.Product;
import edu.bit.ex.web.dto.InquiryForm;
import edu.bit.ex.web.dto.UpdateNoticeForm;
import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;


@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Board {

    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    private Account writer;

    @ManyToOne(fetch = FetchType.LAZY)
    private Product purchaseItems;

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


    public void update(InquiryForm inquiryForm) {
        this.boardTitle = inquiryForm.getBoardTitle();
        this.boardContent = inquiryForm.getBoardContent();
        this.boardType = inquiryForm.getBoardType();
    }

    public void updateNotice(UpdateNoticeForm updateNoticeForm) {
        this.boardTitle = updateNoticeForm.getBoardTitle();
        this.boardContent = updateNoticeForm.getBoardContent();
        this.updatedDate = LocalDate.now();
    }
}
