package com.cinnamoroll.store.cart.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinnamoroll.store.cart.CartService;
import com.cinnamoroll.store.cart.CartVO;
import com.cinnamoroll.store.cart.impl.CartDAO;

@Service("cartService")
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public void insertCart(CartVO vo) {
		// TODO Auto-generated method stub
		cartDAO.insertCart(vo);
	}

	@Override
	public void updateCart(CartVO vo) {
		// TODO Auto-generated method stub
		cartDAO.updateCart(vo);
	}

	@Override
	public void deleteCart(CartVO vo) {
		// TODO Auto-generated method stub
		cartDAO.deleteCart(vo);
	}

	@Override
	public CartVO getCart(CartVO vo) {
		// TODO Auto-generated method stub
		return cartDAO.getCart(vo);
	}
	@Override
	public CartVO getExistingCart(CartVO vo) {
		return cartDAO.getExistingCart(vo);
	}
	
	@Override
	public List<CartVO> getCartList(CartVO vo) {
		// TODO Auto-generated method stub
		return cartDAO.getCartList(vo);
	}

}
