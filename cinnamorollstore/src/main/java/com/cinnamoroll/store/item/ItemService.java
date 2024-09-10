package com.cinnamoroll.store.item;

import java.util.List;

public interface ItemService {
	
	// 상품 추가
	public void insertItem(ItemVO vo);
	// 상품 수정
	public void updateItem(ItemVO vo);
	// 상품 삭제
	public void deleteItem(ItemVO vo);
	// 상품 세부 정보 보기
	public ItemVO getItem(ItemVO vo);
	// 상품 목록 보기
	public List<ItemVO> getItemList(ItemVO vo);
	// 진열된 상품 목록 보기
	public List<ItemVO> getItemDisplayList(ItemVO vo);
	// 진열된 상품 카테고리 목록 보기
	public List<ItemVO> getItemCategoryList(ItemVO vo);
	// 오늘 등록된 상품의 개수
	public int getTodayItemCount();
}
