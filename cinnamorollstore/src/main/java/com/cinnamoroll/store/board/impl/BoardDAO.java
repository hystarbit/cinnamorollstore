package com.cinnamoroll.store.board.impl;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.cinnamoroll.store.board.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 게시판 추가
	public void insertBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.insertBoard", vo);
	}

	// 게시판 수정
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	// 게시판 방문수 증가
	public void updateVisitCount(BoardVO vo) {
		mybatis.update("BoardDAO.updateVisitCount", vo);
	}

	// 게시판 삭제
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}

	// 게시판 세부 정보 보기
	public BoardVO getBoard(BoardVO vo) {
		return (BoardVO) mybatis.selectOne("BoardDAO.getBoard", vo);
	}

	// 게시판 목록 보기
	public List<BoardVO> getBoardList() {
		return mybatis.selectList("BoardDAO.getBoardList");
	}

	// 게시판 목록 보기(페이징)
	public List<BoardVO> getBoardListPage(BoardVO vo) {
		return mybatis.selectList("BoardDAO.getBoardListPage", vo);
	}

	// 검색된 게시판 목록 보기(페이징)
	public List<BoardVO> getBoardSearchListPage(BoardVO vo) {
		return mybatis.selectList("BoardDAO.getBoardSearchListPage", vo);
	}
	
	// 게시판 총 개수
	public int getBoardCount() {
		return mybatis.selectOne("BoardDAO.getBoardCount");
	}

	// 검색된 게시판 총 개수
	public int getBoardSearchCount(BoardVO vo) {
		return mybatis.selectOne("BoardDAO.getBoardSearchCount", vo);
	}

}
