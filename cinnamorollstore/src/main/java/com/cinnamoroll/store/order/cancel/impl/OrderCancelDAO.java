package com.cinnamoroll.store.order.cancel.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cinnamoroll.store.order.cancel.OrderCancelVO;

@Repository
public class OrderCancelDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 주문 취소 추가
	public void insertOrderCancel(OrderCancelVO vo) {
		mybatis.insert("OrderCancelDAO.insertOrderCancel", vo);
	}

	// 주문 취소 상태 수정
	public void updateOrderCancelStatus(OrderCancelVO vo) {
		mybatis.insert("OrderCancelDAO.updateOrderCancelStatus", vo);
	}

	// 주문 취소 삭제
	public void deleteOrderCancel(OrderCancelVO vo) {
		mybatis.delete("OrderCancelDAO.deleteOrderCancel", vo);
	}

	// 주문 취소 항목 보기
	public OrderCancelVO getOrderCancel(OrderCancelVO vo) {
		return (OrderCancelVO) mybatis.selectOne("OrderCancelDAO.getOrderCancel", vo);
	}

	// 특정 주문 취소 처리 상태의 주문 취소 목록 보기
	public List<OrderCancelVO> getOrderCancelStatusList(OrderCancelVO vo) {
		return mybatis.selectList("OrderCancelDAO.getOrderCancelStatusList", vo);
	}

	// 특정 주문 취소 처리 상태의 주문 취소 목록 보기(페이징)
	public List<OrderCancelVO> getOrderCancelStatusListPage(OrderCancelVO vo) {
		return mybatis.selectList("OrderCancelDAO.getOrderCancelStatusListPage", vo);
	}

	// 검색된 특정 주문 취소 처리 상태의 주문 취소 목록 보기(페이징)
	public List<OrderCancelVO> getOrderCancelStatusSearchListPage(OrderCancelVO vo) {
		return mybatis.selectList("OrderCancelDAO.getOrderCancelStatusSearchListPage", vo);
	}

	// 특정 회원의 주문 취소 목록 보기
	public List<OrderCancelVO> getMyOrderCancelList(OrderCancelVO vo) {
		return mybatis.selectList("OrderCancelDAO.getMyOrderCancelList", vo);
	}

	// 오늘의 주문 취소 수 알기
	public int getTodayOrderCancelCount() {
		return mybatis.selectOne("OrderCancelDAO.getTodayOrderCancelCount");
	}

	// 특정 주문 취소 처리 상태의 주문 취소 수 알기
	public int getOrderCancelStatusCount(OrderCancelVO vo) {
		return mybatis.selectOne("OrderCancelDAO.getOrderCancelStatusCount", vo);
	}

	// 검색된 특정 주문 취소 처리 상태의 주문 취소 수 알기
	public int getOrderCancelStatusSearchCount(OrderCancelVO vo) {
		return mybatis.selectOne("OrderCancelDAO.getOrderCancelStatusSearchCount", vo);
	}
}
