package com.cinnamoroll.store.order.returns.complete.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinnamoroll.store.order.returns.complete.OrderReturnCompleteService;
import com.cinnamoroll.store.order.returns.complete.OrderReturnCompleteVO;

@Service
public class OrderReturnCompleteServiceImpl implements OrderReturnCompleteService {
	
	@Autowired
	private OrderReturnCompleteDAO orderReturnCompleteDAO;
	
	@Override
	public void insertOrderReturnComplete(OrderReturnCompleteVO vo) {
		// TODO Auto-generated method stub
		orderReturnCompleteDAO.insertOrderReturnComplete(vo);
	}
	@Override
	public void deleteOrderReturnComplete(OrderReturnCompleteVO vo) {
		orderReturnCompleteDAO.deleteOrderReturnComplete(vo);
	}
}
