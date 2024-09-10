package com.cinnamoroll.store.order.cancel;

import java.util.List;

public interface OrderCancelService {
	// 주문 취소 추가
	public void insertOrderCancel(OrderCancelVO vo);

	// 주문 취소 삭제
	public void deleteOrderCancel(OrderCancelVO vo);

	// 주문 취소 항목 보기
	public OrderCancelVO getOrderCancel(OrderCancelVO vo);

	// 특정 주문 취소 처리 상태의 주문 취소 목록 보기
	public List<OrderCancelVO> getOrderCancelStatusList(OrderCancelVO vo);

	// 특정 회원의 주문 취소 목록 보기
	public List<OrderCancelVO> getMyOrderCancelList(OrderCancelVO vo);

	// 오늘의 주문 취소 수 알기
	public int getTodayOrderCancelCount();

}
