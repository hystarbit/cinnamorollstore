package com.cinnamoroll.store.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinnamoroll.store.order.OrderService;
import com.cinnamoroll.store.order.OrderVO;
import com.cinnamoroll.store.order.items.OrderItemsVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;

	@Override
	public void insertOrder(OrderVO vo) {
		// TODO Auto-generated method stub
		orderDAO.insertOrder(vo);
	}

	@Override
	public void updateOrderAddress(OrderVO vo) {
		// TODO Auto-generated method stub
		orderDAO.updateOrderAddress(vo);
	}

	@Override
	public void updatePaymentStatus(OrderVO vo) {
		// TODO Auto-generated method stub
		orderDAO.updatePaymentStatus(vo);
	}

	@Override
	public void updateOrderStatus(OrderVO vo) {
		// TODO Auto-generated method stub
		orderDAO.updateOrderStatus(vo);
	}

	@Override
	public void deleteOrder(OrderVO vo) {
		// TODO Auto-generated method stub
		orderDAO.deleteOrder(vo);
	}

	@Override
	public OrderVO getOrder(OrderVO vo) {
		// TODO Auto-generated method stub
		return orderDAO.getOrder(vo);
	}

	public List<OrderVO> getOrderList(OrderVO vo) {
		// TODO Auto-generated method stub
		return orderDAO.getOrderList(vo);
	}

	@Override
	public List<OrderVO> getMyOrderList(OrderVO vo) {
		return orderDAO.getMyOrderList(vo);
	}
	
	@Override
	public List<OrderVO> getOrderStatusList(OrderVO vo){
		return orderDAO.getOrderStatusList(vo);
	}
	
	@Override
	public int getTodayOrderCount() {
		// TODO Auto-generated method stub
		return orderDAO.getTodayOrderCount();
	}

	@Override
	public int getMaxOrderNumber() {
		// TODO Auto-generated method stub
		return orderDAO.getMaxOrderNumber();
	}

}
