package edu.bit.ex.vo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import edu.bit.ex.service.BoardServiceDeprecated;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class BoardVOTest {
	@Autowired
	private BoardServiceDeprecated boardSerivce;

	@Test
	void test() {
		BoardVO bvo = new BoardVO();
		
		bvo.setB_content("테스트");
		java.sql.Date d = java.sql.Date.valueOf("1998-01-01");
		bvo.setB_date(d);
		bvo.setB_group(29);
		bvo.setB_hit(0);
		bvo.setB_indent(0);
		bvo.setB_step(0);
		bvo.setB_title("테스트");
		bvo.setBoard_id(29);
		bvo.setBoard_type_id(1);
		bvo.setLike_count(1);
		bvo.setMember_idx(99);
		bvo.setProduct_id(88);
		bvo.setProduct_name("테스트");
		
		boardSerivce.get(29);
		
	}

}
