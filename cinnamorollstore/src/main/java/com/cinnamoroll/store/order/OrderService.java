package com.cinnamoroll.store.order;

import java.util.List;

import com.cinnamoroll.store.order.items.OrderItemsVO;

public interface OrderService {
	// 주문 추가
	public void insertOrder(OrderVO vo);
	
	// 배송 주소 수정
	public void updateOrderAddress(OrderVO vo);
	
	// 결제 상태 수정
	public void updatePaymentStatus(OrderVO vo);

	// 주문 상태 수정
	public void updateOrderStatus(OrderVO vo);

	// 주문 삭제
	public void deleteOrder(OrderVO vo);

	// 주문 보기
	public OrderVO getOrder(OrderVO vo);

	// 주문 목록 보기
	public List<OrderVO> getOrderList(OrderVO orderVO, OrderItemsVO orderItemsVO);
	
	// 주문 목록 보기(페이징)
	public List<OrderVO> getOrderListPage(OrderVO orderVO, OrderItemsVO orderItemsVO);
	
	// 특정 회원의 주문 목록 보기
	public List<OrderVO> getMyOrderList(OrderVO vo);
	
	// 주문 상태별 주문 목록 보기
	public List<OrderVO> getOrderStatusList(OrderVO vo, OrderItemsVO orderItemsVO);
	
	// 주문 상태별 주문 목록 보기(페이징)
	public List<OrderVO> getOrderStatusListPage(OrderVO orderVO, OrderItemsVO orderItemsVO);
	
	// 회원별 주문 목록 보기
	public List<OrderVO> getUserOrderList(OrderVO orderVO, OrderItemsVO orderItemsVO);
	
	// 오늘의 주문 수 알기
	public int getTodayOrderCount();

	// 최대 주문 번호 알기
	public int getMaxOrderNumber();
	
	// 모든 주문 수 알기
	public int getOrderListCount();

	// 특정 주문 상태의 주문 수 알기
	public int getOrderStatusCount(OrderVO vo);
	
}
