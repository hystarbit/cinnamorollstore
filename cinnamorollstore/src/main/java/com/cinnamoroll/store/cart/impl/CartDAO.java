package com.cinnamoroll.store.cart.impl;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.cinnamoroll.store.cart.CartVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// 장바구니 추가
	public void insertCart(CartVO vo) {
		mybatis.insert("CartDAO.insertCart", vo);
	}

	// 장바구니 수정
	public void updateCart(CartVO vo) {
		mybatis.update("CartDAO.updateCart", vo);
	}

	// 장바구니 삭제
	public void deleteCart(CartVO vo) {
		mybatis.delete("CartDAO.deleteCart", vo);
	}

	// 장바구니 상품 보기
	public CartVO getCart(CartVO vo) {
		return (CartVO) mybatis.selectOne("CartDAO.getCart", vo);
	}
	
	// 기존에 장바구니에 있는 같은 상품 구하기
	public CartVO getExistingCart(CartVO vo) {
		return (CartVO) mybatis.selectOne("CartDAO.getExistingCart", vo);
	}

	// 장바구니 목록 보기
	public List<CartVO> getCartList(CartVO vo) {
		return mybatis.selectList("CartDAO.getCartList", vo);
	}
	
	

}
