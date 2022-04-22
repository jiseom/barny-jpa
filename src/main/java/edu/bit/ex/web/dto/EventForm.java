package edu.bit.ex.web.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Setter
@Getter
@Data
public class EventForm {

    private LocalDate participatedDate;


}
