package edu.bit.ex.domain.board;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Transactional(readOnly = true)
public interface BoardRepository extends JpaRepository<Board, Long> {

    @Query("SELECT b FROM Board b " +
            "LEFT JOIN b.writer a " +
            "ON b.id =:id " +
            "AND b.boardType in (:boardTypes)")
    List<Board> getInquiries(@Param("id") Long id, List<BoardType>boardTypes);

}




