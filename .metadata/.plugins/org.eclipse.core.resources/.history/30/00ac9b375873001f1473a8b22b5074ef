package com.cinnamoroll.store.order.items;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface OrderItemsService {
	// 주문 상품 추가
	public void insertOrderItems(OrderItemsVO vo);

	// 주문 상품 수정
	public void updateOrderItems(OrderItemsVO vo);

	// 주문 상품 삭제
	public void deleteOrderItems(OrderItemsVO vo);

	// 특정 주문 상품 보기
	public OrderItemsVO getOrderItems(OrderItemsVO vo);

	// 주문 상품 목록 보기
	public List<OrderItemsVO> getOrderItemsList(OrderItemsVO vo);
	
	// 특정 회원의 주문 상품 목록 보기
	public List<OrderItemsVO> getMyOrderItemsList(OrderItemsVO vo);
		
	// 주문 상품수 알기
	public int getOrderItemsCount(OrderItemsVO vo);
	
	// 특정 주문에서 주문상품번호가 가장 최소인 상품의 이름 보기
	public String getOrderItemsName(OrderItemsVO vo);

}
