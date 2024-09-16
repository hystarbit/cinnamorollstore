package com.cinnamoroll.store.user;

import java.util.List;

public interface UserService {
	// 회원 가입
	public void insertUser(UserVO vo);

	// 개인정보 수정
	public void updateUser(UserVO vo);
	
	// 비밀번호 변경
	public void updateUserPassword(UserVO vo);
	
	// 회원 탈퇴
	public void deleteUser(UserVO vo);

	// 로그인하기, 회원 상세 보기
	public UserVO getUser(UserVO vo);

	// 관리자 로그인하기(아이디,비밀번호,등급 알아야함)
	public UserVO getUserAdminLogin(UserVO vo);

	// 회원이 관리자인지 확인하기(아이디,등급 알아야함)
	public UserVO getUserAdmin(UserVO vo);
		
	// 회원 상세 보기(아이디만 알면 됨)
	public UserVO getUserDetail(UserVO vo);

	// 회원 목록 보기
	public List<UserVO> getUserList(UserVO vo);
	
	// 회원 목록 보기(페이징)
	public List<UserVO> getUserListPage(UserVO vo);
	
	// 오늘의 회원 가입 수 알기
	public int getTodaySignupCount();
	
	// 관리자에 의한 개인정보 수정
	public void updateUserByAdmin(UserVO vo);
	
	// 특정 회원의 총 주문 금액 
	public int getUserTotalOrderPrice(UserVO vo);
	
	// 특정 회원의 총 주문 금액
	public int getUserListCount();
}
