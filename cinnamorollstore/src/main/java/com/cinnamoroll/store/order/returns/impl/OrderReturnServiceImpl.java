package com.cinnamoroll.store.order.returns.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinnamoroll.store.order.returns.OrderReturnService;
import com.cinnamoroll.store.order.returns.OrderReturnVO;

@Service
public class OrderReturnServiceImpl implements OrderReturnService {
	
	@Autowired
	private OrderReturnDAO orderReturnDAO;
	
	@Override
	public void insertOrderReturn(OrderReturnVO vo) {
		// TODO Auto-generated method stub
		orderReturnDAO.insertOrderReturn(vo);
	}

	@Override
	public void updateOrderReturnStatus(OrderReturnVO vo) {
		// TODO Auto-generated method stub
		orderReturnDAO.updateOrderReturnStatus(vo);
	}
	
	@Override
	public void updateProcessingMemo(OrderReturnVO vo) {
		// TODO Auto-generated method stub
		orderReturnDAO.updateProcessingMemo(vo);
	}
	
	@Override
	public void deleteOrderReturn(OrderReturnVO vo) {
		// TODO Auto-generated method stub
		orderReturnDAO.deleteOrderReturn(vo);
	}

	@Override
	public OrderReturnVO getOrderReturn(OrderReturnVO vo) {
		// TODO Auto-generated method stub
		return orderReturnDAO.getOrderReturn(vo);
	}

	@Override
	public List<OrderReturnVO> getOrderReturnStatusList(OrderReturnVO vo) {
		// TODO Auto-generated method stub
		return orderReturnDAO.getOrderReturnStatusList(vo);
	}
	@Override
	public List<OrderReturnVO> getOrderReturnStatusListPage(OrderReturnVO vo) {
		// TODO Auto-generated method stub
		return orderReturnDAO.getOrderReturnStatusListPage(vo);
	}
	
	@Override
	public List<OrderReturnVO> getOrderReturnStatusSearchListPage(OrderReturnVO vo) {
		// TODO Auto-generated method stub
		return orderReturnDAO.getOrderReturnStatusSearchListPage(vo);
	}

	@Override
	public List<OrderReturnVO> getMyOrderReturnList(OrderReturnVO vo) {
		// TODO Auto-generated method stub
		return orderReturnDAO.getMyOrderReturnList(vo);
	}
	
	@Override
	public int getOrderReturnStatusCount(OrderReturnVO vo) {
		// TODO Auto-generated method stub
		return orderReturnDAO.getOrderReturnStatusCount(vo);
	}
	
	@Override
	public int getOrderReturnStatusSearchCount(OrderReturnVO vo) {
		// TODO Auto-generated method stub
		return orderReturnDAO.getOrderReturnStatusCount(vo);
	}

}
