package com.cinnamoroll.store.cart;

import java.util.List;

import com.cinnamoroll.store.user.UserVO;

public interface CartService {

	// 장바구니 추가
	public void insertCart(CartVO vo);

	// 장바구니 수정
	public void updateCart(CartVO vo);

	// 장바구니 삭제
	public void deleteCart(CartVO vo);

	// 장바구니 상품 보기
	public CartVO getCart(CartVO vo);
	
	// 기존에 장바구니에 있는 같은 상품 구하기
	public CartVO getExistingCart(CartVO vo);
	
	// 장바구니 목록 보기
	public List<CartVO> getCartList(CartVO vo);
}
