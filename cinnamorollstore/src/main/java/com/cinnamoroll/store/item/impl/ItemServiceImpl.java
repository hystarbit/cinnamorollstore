package com.cinnamoroll.store.item.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinnamoroll.store.item.ItemService;
import com.cinnamoroll.store.item.ItemVO;

@Service("itemService")
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemDAO itemDAO;

	@Override
	public void insertItem(ItemVO vo) {
		// TODO Auto-generated method stub
		itemDAO.insertItem(vo);
	}

	@Override
	public void updateItem(ItemVO vo) {
		// TODO Auto-generated method stub
		itemDAO.updateItem(vo);
	}

	@Override
	public void deleteItem(ItemVO vo) {
		// TODO Auto-generated method stub
		itemDAO.deleteItem(vo);
	}

	@Override
	public ItemVO getItem(ItemVO vo) {
		// TODO Auto-generated method stub
		return itemDAO.getItem(vo);
	}

	@Override
	public List<ItemVO> getItemList(ItemVO vo) {
		// TODO Auto-generated method stub
		return itemDAO.getItemList(vo);
	}
	
	@Override
	public List<ItemVO> getItemListPage(ItemVO vo){
		// TODO Auto-generated method stub
		return itemDAO.getItemListPage(vo);
	}
	
	@Override
	public List<ItemVO> getItemSearchListPage(ItemVO vo){
		// TODO Auto-generated method stub
		return itemDAO.getItemSearchListPage(vo);
	}
	
	@Override
	public List<ItemVO> getItemDisplayList(ItemVO vo) {
		return itemDAO.getItemDisplayList(vo);
	}

	@Override
	public List<ItemVO> getItemCategoryList(ItemVO vo) {
		// TODO Auto-generated method stub
		return itemDAO.getItemCategoryList(vo);
	}
	@Override
	public List<ItemVO> getItemSearchCategoryList(ItemVO vo){
		return itemDAO.getItemSearchCategoryList(vo);
	}
	
	@Override
	public List<ItemVO> getItemSearchCategoryListPage(ItemVO vo){
		return itemDAO.getItemSearchCategoryListPage(vo);
	}
	@Override
	public List<ItemVO> getItemDisplayListPage(ItemVO vo){
		return itemDAO.getItemDisplayListPage(vo);
	}
	
	@Override
	public List<ItemVO> getItemDisplayCategoryListPage(ItemVO vo){
		return itemDAO.getItemDisplayCategoryListPage(vo);
	}

	@Override
	public int getTodayItemCount() {
		return itemDAO.getTodayItemCount();
	}
	
	@Override
	public int getItemCount() {
		return itemDAO.getItemCount();
	}
	
	@Override
	public int getItemSearchCount(ItemVO vo) {
		return itemDAO.getItemSearchCount(vo);
	}
	
	@Override
	public int getItemDisplayCount(){
		return itemDAO.getItemDisplayCount();
	}
	
	@Override
	public int getItemDisplayCategoryCount(ItemVO vo) {
		return itemDAO.getItemDisplayCategoryCount(vo);
	}
	
	@Override
	public int getItemSearchCategoryCount(ItemVO vo){
		return itemDAO.getItemSearchCategoryCount(vo);
	}
	
}
