package com.cinnamoroll.store.order.items.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinnamoroll.store.order.items.OrderItemsService;
import com.cinnamoroll.store.order.items.OrderItemsVO;

@Service
public class OrderItemsServiceImpl implements OrderItemsService {

	@Autowired
	private OrderItemsDAO orderItemsDAO;

	public void insertOrderItems(OrderItemsVO vo) {
		// TODO Auto-generated method stub
		orderItemsDAO.insertOrderItems(vo);
	}

	@Override
	public void updateOrderItems(OrderItemsVO vo) {
		// TODO Auto-generated method stub
		orderItemsDAO.updateOrderItems(vo);
	}

	@Override
	public void deleteOrderItems(OrderItemsVO vo) {
		// TODO Auto-generated method stub
		orderItemsDAO.deleteOrderItems(vo);
	}

	@Override
	public OrderItemsVO getOrderItems(OrderItemsVO vo) {
		// TODO Auto-generated method stub
		return orderItemsDAO.getOrderItems(vo);
	}

	@Override
	public List<OrderItemsVO> getOrderItemsList(OrderItemsVO vo) {
		// TODO Auto-generated method stub
		return orderItemsDAO.getOrderItemsList(vo);
	}

	@Override
	public List<OrderItemsVO> getMyOrderItemsList(OrderItemsVO vo) {
		// TODO Auto-generated method stub
		return orderItemsDAO.getMyOrderItemsList(vo);
	}
	
	@Override
	public List<OrderItemsVO> getMyOrderItemsListPage(OrderItemsVO vo) {
		// TODO Auto-generated method stub
		return orderItemsDAO.getMyOrderItemsListPage(vo);
	}
	
	@Override
	public List<OrderItemsVO> getMyOrderItemsSearchListPage(OrderItemsVO vo){
		return orderItemsDAO.getMyOrderItemsSearchListPage(vo);
	}
	@Override
	public int getOrderItemsCount(OrderItemsVO vo) {
		// TODO Auto-generated method stub
		return orderItemsDAO.getOrderItemsCount(vo);
	}
	@Override
	public int getMyOrderItemsCount(OrderItemsVO vo) {
		return orderItemsDAO.getMyOrderItemsCount(vo);
	}
	@Override
	public int getMyOrderItemsSearchCount(OrderItemsVO vo) {
		return orderItemsDAO.getMyOrderItemsSearchCount(vo);
	}
	@Override
	public String getOrderItemsName(OrderItemsVO vo) {
		return orderItemsDAO.getOrderItemsName(vo);
	}
}
