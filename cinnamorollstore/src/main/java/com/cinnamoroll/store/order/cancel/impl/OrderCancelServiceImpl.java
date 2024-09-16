package com.cinnamoroll.store.order.cancel.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinnamoroll.store.order.cancel.OrderCancelService;
import com.cinnamoroll.store.order.cancel.OrderCancelVO;
import com.cinnamoroll.store.order.items.OrderItemsVO;
import com.cinnamoroll.store.order.items.impl.OrderItemsDAO;

@Service
public class OrderCancelServiceImpl implements OrderCancelService {

	@Autowired
	private OrderCancelDAO orderCancelDAO;
	
	@Autowired
	private OrderItemsDAO orderItemsDAO;

	@Override
	public void insertOrderCancel(OrderCancelVO vo) {
		// TODO Auto-generated method stub
		orderCancelDAO.insertOrderCancel(vo);
	}
	
	@Override
	public void updateOrderCancelStatus(OrderCancelVO vo) {
		orderCancelDAO.updateOrderCancelStatus(vo);
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
	public List<OrderCancelVO> getOrderCancelStatusList(OrderCancelVO vo, OrderItemsVO orderItemsVO) {
		List<OrderCancelVO> orders = orderCancelDAO.getOrderCancelStatusList(vo);
		for (OrderCancelVO order : orders) {
			int orderNumber = order.getOrder_number();
			orderItemsVO.setOrder_number(orderNumber);
			int orderItemsCount = orderItemsDAO.getOrderItemsCount(orderItemsVO);
			String orderItemsName = orderItemsDAO.getOrderItemsName(orderItemsVO);
			order.setOrder_items_count(orderItemsCount);
			order.setOrder_items_name(orderItemsName);
		}
		return orders;
	}
	
	@Override
	public List<OrderCancelVO> getOrderCancelStatusListPage(OrderCancelVO vo, OrderItemsVO orderItemsVO){
		List<OrderCancelVO> orders = orderCancelDAO.getOrderCancelStatusListPage(vo);
		for (OrderCancelVO order : orders) {
			int orderNumber = order.getOrder_number();
			orderItemsVO.setOrder_number(orderNumber);
			int orderItemsCount = orderItemsDAO.getOrderItemsCount(orderItemsVO);
			String orderItemsName = orderItemsDAO.getOrderItemsName(orderItemsVO);
			order.setOrder_items_count(orderItemsCount);
			order.setOrder_items_name(orderItemsName);
		}
		return orders;
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
	
	@Override
	public int getOrderCancelStatusCount(OrderCancelVO vo){
		// TODO Auto-generated method stub
		return orderCancelDAO.getOrderCancelStatusCount(vo);
	}
}
