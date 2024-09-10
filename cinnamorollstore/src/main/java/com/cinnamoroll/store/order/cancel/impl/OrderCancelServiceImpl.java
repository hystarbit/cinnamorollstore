package com.cinnamoroll.store.order.cancel.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinnamoroll.store.order.cancel.OrderCancelService;
import com.cinnamoroll.store.order.cancel.OrderCancelVO;

@Service
public class OrderCancelServiceImpl implements OrderCancelService {
	
	@Autowired
	private OrderCancelDAO orderCancelDAO;
	@Override
	public void insertOrderCancel(OrderCancelVO vo) {
		// TODO Auto-generated method stub
		orderCancelDAO.insertOrderCancel(vo);
	}

	@Override
	public void deleteOrderCancel(OrderCancelVO vo) {
		// TODO Auto-generated method stub
		orderCancelDAO.deleteOrderCancel(vo);
	}

	@Override
	public OrderCancelVO getOrderCancel(OrderCancelVO vo) {
		// TODO Auto-generated method stub
		return orderCancelDAO.getOrderCancel(vo);
	}

	@Override
	public List<OrderCancelVO> getOrderCancelStatusList(OrderCancelVO vo) {
		// TODO Auto-generated method stub
		return orderCancelDAO.getOrderCancelStatusList(vo);
	}

	@Override
	public List<OrderCancelVO> getMyOrderCancelList(OrderCancelVO vo) {
		// TODO Auto-generated method stub
		return orderCancelDAO.getMyOrderCancelList(vo);
	}

	@Override
	public int getTodayOrderCancelCount() {
		// TODO Auto-generated method stub
		return orderCancelDAO.getTodayOrderCancelCount();
	}

}
