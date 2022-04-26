package edu.bit.ex.domain.board;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface BoardRepository extends JpaRepository<Board, Long> {

    @Query("SELECT b " +
            "FROM Board b " +
            "LEFT JOIN b.writer a " +
            "WHERE b.writer.id =:id " +
            "AND b.boardType in (:boardTypes)")
    List<Board> getInquiries(@Param("id") Long id, List<BoardType> boardTypes);

    @Query("SELECT b " +
            "FROM Board b " +
            "LEFT JOIN b.writer a " +
            "WHERE b.writer.id=:id ")
    Board findWriter(@Param("id") Long id);

    List<Board> findByBoardType(BoardType boardType);

    List<Board> findAllByBoardType(BoardType boardType);

//    @Query("SELECT b " +
//            "FROM Board b " +
//            "JOIN b.writer a JOIN b.purchaseItems p " +
//            "WHERE b.writer.id =:aid AND b.purchaseItems.id=:pid " +
//            "AND b.boardType =:boardType")
//    List<Board> findByIdAndBoardType(@Param("id") Long aid,@Param("id") Long pid, @Param("boardType") BoardType boardType);

}




