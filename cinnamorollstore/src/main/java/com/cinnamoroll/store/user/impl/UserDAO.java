package com.cinnamoroll.store.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cinnamoroll.store.user.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 회원 가입
	public void insertUser(UserVO vo) {
		mybatis.insert("UserDAO.insertUser", vo);
	}

	// 로그인하기(아이디,비밀번호 알아야함)
	public UserVO getUser(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.getUser", vo);
	}

	// 사용자가 개인정보 수정
	public void updateUser(UserVO vo) {
		mybatis.update("UserDAO.updateUser", vo);
	}

	// 비밀번호 수정
	public void updateUserPassword(UserVO vo) {
		mybatis.update("UserDAO.updateUserPassword", vo);
	}

	// 관리자에 의한 개인정보 수정
	public void updateUserByAdmin(UserVO vo) {
		mybatis.update("UserDAO.updateUserByAdmin", vo);
	}

	// 회원 탈퇴
	public void deleteUser(UserVO vo) {
		mybatis.delete("UserDAO.deleteUser", vo);
	}

	// 관리자 로그인하기(아이디,비밀번호,등급 알아야함)
	public UserVO getUserAdminLogin(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.getUserAdminLogin", vo);
	}

	// 회원이 관리자인지 확인하기(아이디,등급 알아야함)
	public UserVO getUserAdmin(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.getUserAdmin", vo);
	}

	// 회원 상세 보기(아이디만 알면 됨)
	public UserVO getUserDetail(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.getUserDetail", vo);
	}

	// 회원 목록 보기
	public List<UserVO> getUserList(UserVO vo) {
		return mybatis.selectList("UserDAO.getUserList", vo);
	}

	// 회원 목록 보기(페이징)
	public List<UserVO> getUserListPage(UserVO vo) {
		return mybatis.selectList("UserDAO.getUserListPage", vo);
	}

	// 검색된 회원 목록 보기(페이징)
	public List<UserVO> getUserSearchListPage(UserVO vo) {
		return mybatis.selectList("UserDAO.getUserSearchListPage", vo);
	}

	// 오늘의 회원 가입 수 알기
	public int getTodaySignupCount() {
		return mybatis.selectOne("UserDAO.getTodaySignupCount");
	}

	// 특정 회원의 총 주문 금액
	public int getUserTotalOrderPrice(UserVO vo) {
		return mybatis.selectOne("UserDAO.getUserTotalOrderPrice", vo);
	}

	// 전체 회원 목록의 수
	public int getUserListCount() {
		return mybatis.selectOne("UserDAO.getUserListCount");
	}

	// 검색된 회원 목록의 수
	public int getUserSearchCount(UserVO vo) {
		return mybatis.selectOne("UserDAO.getUserSearchCount", vo);
	}

}
