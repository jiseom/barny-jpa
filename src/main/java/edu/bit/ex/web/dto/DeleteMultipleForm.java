package edu.bit.ex.web.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class DeleteMultipleForm {

    public List<Long> ids = new ArrayList<>();

}
