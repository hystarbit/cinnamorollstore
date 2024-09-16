package com.cinnamoroll.store.order.returns.complete;

public interface OrderReturnCompleteService {
	// 교환/환불 처리 완료일 추가
	public void insertOrderReturnComplete(OrderReturnCompleteVO vo);
	
	// 교환/환불 처리 완료일 삭제
	public void deleteOrderReturnComplete(OrderReturnCompleteVO vo);
}
