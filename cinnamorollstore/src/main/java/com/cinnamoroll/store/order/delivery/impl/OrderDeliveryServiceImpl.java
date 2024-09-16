package com.cinnamoroll.store.order.delivery.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinnamoroll.store.order.delivery.OrderDeliveryService;
import com.cinnamoroll.store.order.delivery.OrderDeliveryVO;

@Service
public class OrderDeliveryServiceImpl implements OrderDeliveryService {

	@Autowired
	private OrderDeliveryDAO orderDeliveryDAO;
	@Override
	public void insertOrderDelivery(OrderDeliveryVO vo) {
		// TODO Auto-generated method stub
		orderDeliveryDAO.insertOrderDelivery(vo);
	}
	@Override
	public int getOrderNumberDeliveryCount(OrderDeliveryVO vo) {
		return orderDeliveryDAO.getOrderNumberDeliveryCount(vo);
	}

}
