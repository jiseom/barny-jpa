package edu.bit.ex.service;

import java.util.List;

import edu.bit.ex.page.Criteria;
import edu.bit.ex.vo.BoardVO;
import edu.bit.ex.vo.MemberVO;
import edu.bit.ex.vo.OrderDetailVO;
import edu.bit.ex.vo.OrderVO;
import edu.bit.ex.vo.ProductMainVO;

public interface BoardServiceDeprecated {
	// 관리자리스트
	public List<BoardVO> getAdminList(Criteria cri);
	// 관리자주문내역읽기
	public BoardVO get(int board_id);

	// 관리자주문내역 수정
	public void modify(BoardVO boardVO);

	// 관리자주문내역삭제
	public void remove(int board_id);

	// 관리자주문내역글쓰기
	public void writeBoard(BoardVO boardVO);
	
	
	int getTotal2(Criteria cri);
	
	
	

	// 1:1게시판 회원 마이페이지
	public List<BoardVO> getMemberList(int member_idx);

	// 1:1 회원 글쓰기
	public void writeBoard1(BoardVO boardVO);

	// 1:1 회원 내글 상세보기
	public BoardVO get1(int board_id);

	// 1:1회원 글수정
	public void my_modify(BoardVO boardVO);

	// 1:1회원 글 삭제
	public void my_remove(int board_id);
	
	

	// 후기게시판 회원 마이페이지
	public List<BoardVO> getReviewList(int member_idx);

	// 후기 회원 글쓰기
	public void writeBoard2(BoardVO boardVO);
	
	// 후기 회원 내글 상세보기
	public BoardVO get2(int board_id);
	
	// 후기 회원 글수정
	public void review_modify(BoardVO boardVO);
	
	// 후기 회원 글 삭제
	public void review_remove(int board_id);
	

	//주문내역/구매내역
	public List<OrderVO> getOrderList(int member_idx);
	// 주문내역 회원 내글 상세보기
	public List<OrderDetailVO> getOrder(int order_id);

	// 구독리스트
	public List<ProductMainVO> getPressList(int product_id);

	public void review_remove2(int board_id);

	public List<BoardVO> getReply(int board_id);


	//구독삭제
	public void update_modify(BoardVO boardVO);
	
	//리스트삭제
	public void ship_remove(int ship_id);
	//포인트
	public List<MemberVO> getPointList(int member_idx);
	
	
	//페이징
	public int getTotal(Criteria cri);

	List<BoardVO> getReviewList(Criteria criteria);
	List<BoardVO> getAdminList();




	
	


	
	

}
