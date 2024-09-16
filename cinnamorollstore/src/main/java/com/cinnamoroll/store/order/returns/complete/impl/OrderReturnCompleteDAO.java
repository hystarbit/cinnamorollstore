package com.cinnamoroll.store.order.returns.complete.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cinnamoroll.store.order.returns.complete.OrderReturnCompleteVO;

@Repository
public class OrderReturnCompleteDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 교환/환불 처리 완료일 추가
	public void insertOrderReturnComplete(OrderReturnCompleteVO vo) {
		mybatis.insert("OrderReturnCompleteDAO.insertOrderReturnComplete", vo);
	}
	
	// 교환/환불 처리 완료일 삭제
	public void deleteOrderReturnComplete(OrderReturnCompleteVO vo) {
		mybatis.insert("OrderReturnCompleteDAO.deleteOrderReturnComplete", vo);
	}
}
