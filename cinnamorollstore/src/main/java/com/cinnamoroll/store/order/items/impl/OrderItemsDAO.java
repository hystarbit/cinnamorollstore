package com.cinnamoroll.store.order.items.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cinnamoroll.store.order.items.OrderItemsVO;

@Repository
public class OrderItemsDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 주문 상품 추가
	public void insertOrderItems(OrderItemsVO vo) {
		mybatis.insert("OrderItemsDAO.insertOrderItems", vo);
	}

	// 주문 상품 수정
	public void updateOrderItems(OrderItemsVO vo) {
		mybatis.update("OrderItemsDAO.updateOrderItems", vo);
	}

	// 주문 상품 삭제
	public void deleteOrderItems(OrderItemsVO vo) {
		mybatis.delete("OrderItemsDAO.deleteOrderItems", vo);
	}

	// 특정 주문 상품 보기
	public OrderItemsVO getOrderItems(OrderItemsVO vo) {
		return (OrderItemsVO) mybatis.selectOne("OrderItemsDAO.getOrderItems", vo);
	}

	// 주문 상품 목록 보기
	public List<OrderItemsVO> getOrderItemsList(OrderItemsVO vo) {
		return mybatis.selectList("OrderItemsDAO.getOrderItemsList", vo);
	}

	// 특정 회원의 주문 상품 목록 보기
	public List<OrderItemsVO> getMyOrderItemsList(OrderItemsVO vo) {
		return mybatis.selectList("OrderItemsDAO.getMyOrderItemsList", vo);
	}

	// 특정 회원의 주문 상품 목록 보기(페이징)
	public List<OrderItemsVO> getMyOrderItemsListPage(OrderItemsVO vo) {
		return mybatis.selectList("OrderItemsDAO.getMyOrderItemsListPage", vo);
	}
	
	// 특정 회원의 특정 기간 내 주문 상품 목록 보기(페이징)
	public List<OrderItemsVO> getMyOrderItemsSearchListPage(OrderItemsVO vo) {
		return mybatis.selectList("OrderItemsDAO.getMyOrderItemsSearchListPage", vo);
	}

	// 주문 상품수 알기
	public int getOrderItemsCount(OrderItemsVO vo) {
		return mybatis.selectOne("OrderItemsDAO.getOrderItemsCount", vo);
	}

	// 특정 회원의 주문 상품 수 알기
	public int getMyOrderItemsCount(OrderItemsVO vo) {
		return mybatis.selectOne("OrderItemsDAO.getMyOrderItemsCount", vo);
	}

	// 특정 회원의 특정 기간 내 주문 상품 수 알기
	public int getMyOrderItemsSearchCount(OrderItemsVO vo) {
		return mybatis.selectOne("OrderItemsDAO.getMyOrderItemsSearchCount", vo);
	}

	// 특정 주문에서 주문상품번호가 가장 최소인 상품의 이름 보기
	public String getOrderItemsName(OrderItemsVO vo) {
		return (String) mybatis.selectOne("OrderItemsDAO.getOrderItemsName", vo);
	}
}
