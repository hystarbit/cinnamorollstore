package com.cinnamoroll.store.reply;

import java.util.List;

public interface ReplyService {
	// 댓글 추가
	public void insertReply(ReplyVO vo);
	// 댓글 수정
	public void updateReply(ReplyVO vo);
	// 댓글 삭제
	public void deleteReply(ReplyVO vo);
	// 댓글 세부 정보 보기
	public ReplyVO getReply(ReplyVO vo);
	// 최신 댓글 세부 정보 보기
	public ReplyVO getRecentReply(ReplyVO vo);
	// 게시글 내 댓글 목록 보기
	public List<ReplyVO> getReplyList(ReplyVO vo);
	// 게시글 내 댓글 목록 보기(페이징)
	public List<ReplyVO> getReplyListPage(ReplyVO vo);
	// 게시글 내 댓글 총 개수
	public int getReplyCount(ReplyVO vo);
}
