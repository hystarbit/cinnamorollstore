package com.cinnamoroll.store.order.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cinnamoroll.store.order.OrderVO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 주문 추가
	public void insertOrder(OrderVO vo) {
		mybatis.insert("OrderDAO.insertOrder", vo);
	}

	// 배송 주소 수정
	public void updateOrderAddress(OrderVO vo) {
		mybatis.update("OrderDAO.updateOrderAddress", vo);
	}

	// 결제 상태 수정
	public void updatePaymentStatus(OrderVO vo) {
		mybatis.update("OrderDAO.updatePaymentStatus", vo);
	}

	// 주문 상태 수정
	public void updateOrderStatus(OrderVO vo) {
		mybatis.update("OrderDAO.updateOrderStatus", vo);
	}

	// 주문 삭제
	public void deleteOrder(OrderVO vo) {
		mybatis.delete("OrderDAO.deleteOrder", vo);
	}

	// 주문 보기
	public OrderVO getOrder(OrderVO vo) {
		return (OrderVO) mybatis.selectOne("OrderDAO.getOrder", vo);
	}

	// 주문 목록 보기
	public List<OrderVO> getOrderList(OrderVO vo) {
		return mybatis.selectList("OrderDAO.getOrderList", vo);
	}

	// 주문 목록 보기(페이징)
	public List<OrderVO> getOrderListPage(OrderVO vo) {
		return mybatis.selectList("OrderDAO.getOrderListPage", vo);
	}

	// 특정 회원의 주문 목록 보기
	public List<OrderVO> getMyOrderList(OrderVO vo) {
		return mybatis.selectList("OrderDAO.getMyOrderList", vo);
	}

	// 주문 상태별 주문 목록 보기
	public List<OrderVO> getOrderStatusList(OrderVO vo) {
		return mybatis.selectList("OrderDAO.getOrderStatusList", vo);
	}

	// 주문 상태별 주문 목록 보기(페이징)
	public List<OrderVO> getOrderStatusListPage(OrderVO vo) {
		return mybatis.selectList("OrderDAO.getOrderStatusListPage", vo);
	}

	// 회원별 주문 목록 보기
	public List<OrderVO> getUserOrderList(OrderVO vo) {
		return mybatis.selectList("OrderDAO.getUserOrderList", vo);
	}

	// 오늘의 주문 수 알기
	public int getTodayOrderCount() {
		return mybatis.selectOne("OrderDAO.getTodayOrderCount");
	}

	// 최대 주문 번호 알기
	public int getMaxOrderNumber() {
		return mybatis.selectOne("OrderDAO.getMaxOrderNumber");
	}

	// 모든 주문 수 알기
	public int getOrderListCount() {
		return mybatis.selectOne("OrderDAO.getOrderListCount");
	}

	// 특정 주문 상태의 주문 수 알기
	public int getOrderStatusCount(OrderVO vo) {
		return mybatis.selectOne("OrderDAO.getOrderStatusCount", vo);
	}

}
