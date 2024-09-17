package com.cinnamoroll.store.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinnamoroll.store.user.UserService;
import com.cinnamoroll.store.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Override
	public void insertUser(UserVO vo) {
		// TODO Auto-generated method stub
		userDAO.insertUser(vo);
	}

	@Override
	public void updateUser(UserVO vo) {
		// TODO Auto-generated method stub
		userDAO.updateUser(vo);
	}

	@Override
	public void updateUserPassword(UserVO vo) {
		userDAO.updateUserPassword(vo);
	}

	@Override
	public void deleteUser(UserVO vo) {
		// TODO Auto-generated method stub
		userDAO.deleteUser(vo);
	}

	@Override
	public UserVO getUser(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.getUser(vo);
	}

	@Override
	public UserVO getUserAdminLogin(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.getUserAdminLogin(vo);
	}

	@Override
	public UserVO getUserAdmin(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.getUserAdmin(vo);
	}

	@Override
	public UserVO getUserDetail(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.getUserDetail(vo);
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		// TODO Auto-generated method stub
		return userDAO.getUserList(vo);
	}
	
	@Override
	public List<UserVO> getUserListPage(UserVO vo) {
		List<UserVO> users = userDAO.getUserListPage(vo);
		for(UserVO user: users) {
			int total_order_price = userDAO.getUserTotalOrderPrice(user);
			user.setTotal_order_price(total_order_price);
		}
		return users;
	}
	
	@Override
	public List<UserVO> getUserSearchListPage(UserVO vo) {
		List<UserVO> users = userDAO.getUserSearchListPage(vo);
		for(UserVO user: users) {
			int total_order_price = userDAO.getUserTotalOrderPrice(user);
			user.setTotal_order_price(total_order_price);
		}
		return users;
	}
	
	@Override
	public int getTodaySignupCount() {
		return userDAO.getTodaySignupCount();
	}
	
	@Override
	public void updateUserByAdmin(UserVO vo) {
		userDAO.updateUserByAdmin(vo);
	}
	
	@Override
	public int getUserTotalOrderPrice(UserVO vo) {
		return userDAO.getUserTotalOrderPrice(vo);
	}
	
	@Override
	public int getUserListCount() {
		return userDAO.getUserListCount();
	}
	
	@Override
	public int getUserSearchCount(UserVO vo) {
		return userDAO.getUserSearchCount(vo);
	}
}
