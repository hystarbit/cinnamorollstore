package com.cinnamoroll.store.order.delivery;

public interface OrderDeliveryService {
	// 주문 배송 추가
	public void insertOrderDelivery(OrderDeliveryVO vo);
	
	// 특정 주문 배송 여부 알기 
	public int getOrderNumberDeliveryCount(OrderDeliveryVO vo);
}
