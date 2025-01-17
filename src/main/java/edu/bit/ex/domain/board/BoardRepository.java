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
            "WHERE b.writer.id=:id " )
    Board findByWriter(@Param("id") Long id);

    @Query("SELECT b " +
            "FROM Board b " +
            "LEFT JOIN b.writer a " +
            "WHERE b.writer.id=:aid " +
            "AND b.id =:bid")
    Board findByWriterAndBoardId(@Param("aid") Long aid,@Param("bid")Long bid);


//    List<Board> findAllByWriter(Long id);

    List<Board> findByBoardType(BoardType boardType);

    //보드타입 리스트 조회
    List<Board> findAllByBoardType(BoardType boardType);

    List<Board> findAllByBoardTypeIn(List<BoardType> boardTypes);

    //체크 박스 선택 삭제
    void deleteAllByIdIn(List<Long> ids);

    @Query("SELECT b " +
            "FROM Board b " +
            "WHERE  b.boardType in (:boardTypes) " +
            "ORDER BY b.boardGroup DESC ,b.id")
    List<Board> findAllByBoardTypeInOrderByBoardGroup(List<BoardType> boardTypes);


//    @Query("SELECT b " +
//            "FROM Board b " +
//            "JOIN b.writer a JOIN b.purchaseItems p " +
//            "WHERE b.writer.id =:aid AND b.purchaseItems.id=:pid " +
//            "AND b.boardType =:boardType")
//    List<Board> findByIdAndBoardType(@Param("id") Long aid,@Param("id") Long pid, @Param("boardType") BoardType boardType);

}




