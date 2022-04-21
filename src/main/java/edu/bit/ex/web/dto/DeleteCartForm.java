package edu.bit.ex.web.dto;

import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DeleteCartForm {
    private List<Long> ids = new ArrayList<>();
}
