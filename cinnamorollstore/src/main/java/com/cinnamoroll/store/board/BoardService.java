package com.cinnamoroll.store.board;

import java.util.List;

public interface BoardService {
	// 게시판 추가
	public void insertBoard(BoardVO vo);
	// 게시판 수정
	public void updateBoard(BoardVO vo);
	// 게시판 방문수 증가
	public void updateVisitCount(BoardVO vo);
	// 게시판 삭제
	public void deleteBoard(BoardVO vo);
	// 게시판 세부 정보 보기
	public BoardVO getBoard(BoardVO vo);
	// 게시판 목록 보기
	public List<BoardVO> getBoardList();
	// 게시판 목록 보기(페이징)
	public List<BoardVO> getBoardListPage(BoardVO vo);
	// 검색된 게시판 목록 보기(페이징)
	public List<BoardVO> getBoardSearchListPage(BoardVO vo);
	// 게시판 총 개수
	public int getBoardCount();
	// 검색된 게시판 총 개수
	public int getBoardSearchCount(BoardVO vo);
	
}
