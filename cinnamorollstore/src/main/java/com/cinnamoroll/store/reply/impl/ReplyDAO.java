package com.cinnamoroll.store.reply.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cinnamoroll.store.reply.ReplyVO;

@Repository
public class ReplyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 댓글 추가
	public void insertReply(ReplyVO vo) {
		mybatis.insert("ReplyDAO.insertReply", vo);
	}

	// 댓글 수정
	public void updateReply(ReplyVO vo) {
		mybatis.update("ReplyDAO.updateReply", vo);
	}

	// 댓글 삭제
	public void deleteReply(ReplyVO vo) {
		mybatis.delete("ReplyDAO.deleteReply", vo);
	}

	// 댓글 세부 정보 보기
	public ReplyVO getReply(ReplyVO vo) {
		return (ReplyVO) mybatis.selectOne("ReplyDAO.getReply", vo);
	}

	// 최신 댓글 세부 정보 보기
	public ReplyVO getRecentReply(ReplyVO vo) {
		return (ReplyVO) mybatis.selectOne("ReplyDAO.getRecentReply", vo);
	}

	// 게시글 내 댓글 목록 보기
	public List<ReplyVO> getReplyList(ReplyVO vo) {
		return mybatis.selectList("ReplyDAO.getReplyList", vo);
	}

	// 게시글 내 댓글 목록 보기(페이징)
	public List<ReplyVO> getReplyListPage(ReplyVO vo) {
		return mybatis.selectList("ReplyDAO.getReplyListPage", vo);
	}

	// 게시글 내 댓글 총 개수
	public int getReplyCount(ReplyVO vo) {
		return mybatis.selectOne("ReplyDAO.getReplyCount", vo);
	}
}
