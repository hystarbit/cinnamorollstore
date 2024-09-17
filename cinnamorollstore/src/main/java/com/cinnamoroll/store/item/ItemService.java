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
	// 상품 목록 보기(페이징)
	public List<ItemVO> getItemListPage(ItemVO vo);
	// 검색된 상품 목록 보기(페이징)
	public List<ItemVO> getItemSearchListPage(ItemVO vo);
	
	// 진열된 상품 목록 보기
	public List<ItemVO> getItemDisplayList(ItemVO vo);
	
	// 진열된 상품 카테고리 목록 보기
	public List<ItemVO> getItemCategoryList(ItemVO vo);
	
	// 검색한 상품 카테고리별 목록 보기
	public List<ItemVO> getItemSearchCategoryList(ItemVO vo);
	// 검색한 상품 카테고리별 목록 보기(페이징)
	public List<ItemVO> getItemSearchCategoryListPage(ItemVO vo);
	
	// 진열된 상품된 목록 보기(페이징)
	public List<ItemVO> getItemDisplayListPage(ItemVO vo);
	// 해당 카테고리별 진열된 상품 목록 보기(페이징)
	public List<ItemVO> getItemDisplayCategoryListPage(ItemVO vo);		
		
	// 오늘 등록된 상품의 개수
	public int getTodayItemCount();
	// 상품 총 개수 
	public int getItemCount();
	// 검색된 상품 총 개수
	public int getItemSearchCount(ItemVO vo);
	
	// 진열된 상품 총 개수
	public int getItemDisplayCount();
	// 해당 카테고리별 진열된 상품 총 개수
	public int getItemDisplayCategoryCount(ItemVO vo);
	// 해당 카테고리별 검색된 상품 총 개수
	public int getItemSearchCategoryCount(ItemVO vo);
	
}
