package com.cinnamoroll.store.order.returns.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cinnamoroll.store.order.returns.OrderReturnVO;

@Repository
public class OrderReturnDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 교환/환불 추가
	public void insertOrderReturn(OrderReturnVO vo) {
		mybatis.insert("OrderReturnDAO.insertOrderReturn", vo);
	}

	// 교환/환불 처리 상태 수정
	public void updateOrderReturnStatus(OrderReturnVO vo) {
		mybatis.insert("OrderReturnDAO.updateOrderReturnStatus", vo);
	}

	// 교환/환불 처리 메모 수정
	public void updateProcessingMemo(OrderReturnVO vo) {
		mybatis.insert("OrderReturnDAO.updateProcessingMemo", vo);
	}

	// 교환/환불 삭제
	public void deleteOrderReturn(OrderReturnVO vo) {
		mybatis.delete("OrderReturnDAO.deleteOrderReturn", vo);
	}

	// 교환/환불 항목 보기
	public OrderReturnVO getOrderReturn(OrderReturnVO vo) {
		return (OrderReturnVO) mybatis.selectOne("OrderReturnDAO.getOrderReturn", vo);
	}

	// 특정 처리 상태의 교환/환불 목록 보기
	public List<OrderReturnVO> getOrderReturnStatusList(OrderReturnVO vo) {
		return mybatis.selectList("OrderReturnDAO.getOrderReturnStatusList", vo);
	}

	// 특정 처리 상태의 교환/환불 목록 보기(페이징)
	public List<OrderReturnVO> getOrderReturnStatusListPage(OrderReturnVO vo) {
		return mybatis.selectList("OrderReturnDAO.getOrderReturnStatusListPage", vo);
	}

	// 검색된 특정 처리 상태의 교환/환불 목록 보기(페이징)
	public List<OrderReturnVO> getOrderReturnStatusSearchListPage(OrderReturnVO vo) {
		return mybatis.selectList("OrderReturnDAO.getOrderReturnStatusSearchListPage", vo);
	}

	// 특정 회원의 교환/환불 목록 보기
	public List<OrderReturnVO> getMyOrderReturnList(OrderReturnVO vo) {
		return mybatis.selectList("OrderReturnDAO.getMyOrderReturnList", vo);
	}

	// 특정 처리 상태의 교환/환불 수
	public int getOrderReturnStatusCount(OrderReturnVO vo) {
		return mybatis.selectOne("OrderReturnDAO.getOrderReturnStatusCount", vo);
	}

	// 특정 처리 상태의 교환/환불 수
	public int getOrderReturnStatusSearchCount(OrderReturnVO vo) {
		return mybatis.selectOne("OrderReturnDAO.getOrderReturnStatusSearchCount", vo);
	}
}
