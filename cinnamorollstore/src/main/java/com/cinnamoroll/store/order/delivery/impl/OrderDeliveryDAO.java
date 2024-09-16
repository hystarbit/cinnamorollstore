package com.cinnamoroll.store.order.delivery.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cinnamoroll.store.order.delivery.OrderDeliveryVO;

@Repository
public class OrderDeliveryDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 주문 배송 추가하기 
	public void insertOrderDelivery(OrderDeliveryVO vo) {
		mybatis.insert("OrderDeliveryDAO.insertOrderDelivery", vo);
	}
	
	// 특정 주문 배송 여부 알기 
	public int getOrderNumberDeliveryCount(OrderDeliveryVO vo) {
		return mybatis.insert("OrderDeliveryDAO.getOrderNumberDeliveryCount", vo);
	}
}
