package com.cinnamoroll.store.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinnamoroll.store.order.OrderService;
import com.cinnamoroll.store.order.OrderVO;
import com.cinnamoroll.store.order.items.OrderItemsVO;
import com.cinnamoroll.store.order.items.impl.OrderItemsDAO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	private OrderItemsDAO orderItemsDAO;

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

	@Override
	public List<OrderVO> getOrderList(OrderVO orderVO, OrderItemsVO orderItemsVO) {
		// TODO Auto-generated method stub
		List<OrderVO> orders = orderDAO.getOrderList(orderVO);

		for (OrderVO order : orders) {
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
	public List<OrderVO> getOrderListPage(OrderVO orderVO, OrderItemsVO orderItemsVO){
		List<OrderVO> orders = orderDAO.getOrderListPage(orderVO);

		for (OrderVO order : orders) {
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
	public List<OrderVO> getOrderSearchListPage(OrderVO orderVO, OrderItemsVO orderItemsVO){
		List<OrderVO> orders = orderDAO.getOrderSearchListPage(orderVO);

		for (OrderVO order : orders) {
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
	public List<OrderVO> getMyOrderList(OrderVO vo) {
		return orderDAO.getMyOrderList(vo);
	}

	@Override
	public List<OrderVO> getOrderStatusList(OrderVO orderVO, OrderItemsVO orderItemsVO) {
		List<OrderVO> orders = orderDAO.getOrderStatusList(orderVO);
		for (OrderVO order : orders) {
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
	public List<OrderVO> getOrderStatusListPage(OrderVO orderVO, OrderItemsVO orderItemsVO) {
		List<OrderVO> orders = orderDAO.getOrderStatusListPage(orderVO);
		for (OrderVO order : orders) {
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
	public List<OrderVO> getOrderStatusSearchListPage(OrderVO orderVO, OrderItemsVO orderItemsVO){
		List<OrderVO> orders = orderDAO.getOrderStatusSearchListPage(orderVO);
		for (OrderVO order : orders) {
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
	public List<OrderVO> getUserOrderList(OrderVO orderVO, OrderItemsVO orderItemsVO) {
		List<OrderVO> orders = orderDAO.getUserOrderList(orderVO);

		for (OrderVO order : orders) {
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
	public int getTodayOrderCount() {
		// TODO Auto-generated method stub
		return orderDAO.getTodayOrderCount();
	}

	@Override
	public int getMaxOrderNumber() {
		// TODO Auto-generated method stub
		return orderDAO.getMaxOrderNumber();
	}

	@Override
	public int getOrderListCount() {
		return orderDAO.getOrderListCount();
	}
	
	@Override
	public int getOrderStatusCount(OrderVO vo) {
		return orderDAO.getOrderStatusCount(vo);
	}
	
	@Override
	public int getOrderSearchCount(OrderVO vo) {
		return orderDAO.getOrderSearchCount(vo);
	}
	
	@Override
	public int getOrderStatusSearchCount(OrderVO vo) {
		return orderDAO.getOrderStatusSearchCount(vo);
	}

}
