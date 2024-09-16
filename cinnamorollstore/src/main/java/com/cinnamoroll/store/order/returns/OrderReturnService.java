package com.cinnamoroll.store.order.returns;

import java.util.List;

public interface OrderReturnService {
	// 교환/환불 추가
	public void insertOrderReturn(OrderReturnVO vo);
	// 교환/환불 처리 상태 수정
	public void updateOrderReturnStatus(OrderReturnVO vo);
	// 교환/환불 처리 메모 수정
	public void updateProcessingMemo(OrderReturnVO vo);
	// 교환/환불 삭제
	public void deleteOrderReturn(OrderReturnVO vo);
	// 교환/환불 항목 보기
	public OrderReturnVO getOrderReturn(OrderReturnVO vo);
	// 특정 처리 상태의 교환/환불 목록 보기
	public List<OrderReturnVO> getOrderReturnStatusList(OrderReturnVO vo);
	// 특정 처리 상태의 교환/환불 목록 보기(페이징)
	public List<OrderReturnVO> getOrderReturnStatusListPage(OrderReturnVO vo);
	// 특정 회원의 교환/환불 목록 보기
	public List<OrderReturnVO> getMyOrderReturnList(OrderReturnVO vo);
	// 특정 처리 상태의 교환/환불 수
	public int getOrderReturnStatusCount(OrderReturnVO vo);
}
