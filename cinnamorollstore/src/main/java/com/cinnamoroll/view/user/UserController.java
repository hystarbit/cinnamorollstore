package com.cinnamoroll.view.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cinnamoroll.store.item.ItemService;
import com.cinnamoroll.store.item.ItemVO;
import com.cinnamoroll.store.order.OrderService;
import com.cinnamoroll.store.order.OrderVO;
import com.cinnamoroll.store.order.items.OrderItemsService;
import com.cinnamoroll.store.order.items.OrderItemsVO;
import com.cinnamoroll.store.user.UserService;
import com.cinnamoroll.store.user.UserVO;
import com.cinnamoroll.store.user.impl.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderItemsService orderItemsService;
	
	@RequestMapping(value="/TOS.do", method=RequestMethod.GET)
	public String TOSPage() {
		return "/user/join/TOS.jsp";
	}
	
//	@RequestMapping(value="/user/TOS.do", method=RequestMethod.POST)
//	public String TOS() {
//		return "/user/join.do";
//	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String getJoin() {
		return "/user/join/join.jsp";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String joinUser(UserVO vo){
		// 기존 회원에 같은 아이디가 있는지 체크하기
		UserVO existingUser = userService.getUserDetail(vo);
		// 기존 회원이 없으면 회원가입 진행
		if(existingUser == null) {
			userService.insertUser(vo);
			return "redirect:/login.do";
		}else {
			// 기존에 같은 아이디가 있는 경우
			return "redirect:/join.do?error=exists";
		}
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginPage() {
		return "/user/login/login.jsp";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(HttpSession session, UserVO vo) {
		UserVO user = userService.getUser(vo);
		if(user != null) {
			session.setAttribute("user", user);
			return "redirect:/main.do";
		}else {
			return "redirect:/login.do?error=exists";
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main.do";
	}
	
	
	@RequestMapping(value="/mypage/checkPassword.do", method=RequestMethod.GET)
	public String checkPasswordPage(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");
		
		if(user == null) {
			return "redirect:/login.do";
		}
		return "/user/mypage/checkPassword.jsp";
	}
	
	@RequestMapping(value="/mypage/checkPassword.do", method=RequestMethod.POST)
	public String checkPassword(HttpSession session, UserVO vo) {
		UserVO user = (UserVO) session.getAttribute("user");
		String user_id = user.getUser_id();
		vo.setUser_id(user_id);
		System.out.println(vo);
		UserVO checkUser = userService.getUser(vo);
		if(checkUser != null) {
			return "redirect:/mypage/editMyInfo.do";
		}else {
			return "redirect:/mypage/orderList.do?error=invalidPassword";
		}
	}
	
	@RequestMapping(value="/mypage/editMyInfo.do", method=RequestMethod.GET)
	public String editMyInfoPage(HttpSession session, UserVO vo) {
		return "/user/mypage/editMyInfo.jsp";
	}
	
	@RequestMapping(value="/mypage/editMyInfo.do", method=RequestMethod.POST)
	public String editMyInfo(UserVO vo, HttpSession session) {
		userService.updateUser(vo);
		session.setAttribute("user",vo);
		return "redirect:/mypage/orderList.do";
	}
	
	@RequestMapping(value="/mypage/changePassword.do", method=RequestMethod.GET)
	public String changePasswordPage(HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");
		
		if(user == null) {
			return "redirect:/login.do";
		}
		return "/user/mypage/changePassword.jsp";
	}
	
	
	
	@RequestMapping(value="/mypage/changePassword.do", method=RequestMethod.POST)
	public String changePassword(HttpSession session, UserVO vo,
			@RequestParam("currentPassword") String currentPassword,
			@RequestParam("newPassword") String newPassword) {
		UserVO user = (UserVO) session.getAttribute("user");
		
		// user가 로그인되지 않았을 때
		if(user == null) {
			System.out.println("세션에 사용자 정보가 없습니다. 로그인 페이지로 이동합니다.");
			return "redirect:/login.do";
		}
		
		
		UserVO existingUser = userService.getUserDetail(user);
		
		if(existingUser == null) {
			return "redirect:/mypage/changePassword.do?error=invalidUser";
		}
		
		if(!existingUser.getPassword().equals(currentPassword)) {
			return "redirect:/mypage/changePassword.do?error=invalidCurrentPassword";
		}
		// 새로운 비밀번호 업데이트 
		existingUser.setPassword(newPassword);
		userService.updateUserPassword(existingUser);
		
		return "redirect:/mypage/orderList.do";
		
	}
	
	@RequestMapping(value="/mypage/deleteAccount.do", method=RequestMethod.GET)
	public String delete(HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		if(user == null) {
			return "redirect:/login.do";
		}
		return "/user/mypage/deleteAccount.jsp";
	}
	
	@RequestMapping(value="/mypage/deleteAccount.do", method=RequestMethod.POST)
	public String delete(HttpSession session, UserVO vo) {
		UserVO user = (UserVO) session.getAttribute("user");
		vo.setUser_id(user.getUser_id());
		UserVO existingUser = userService.getUser(vo);
		if(existingUser != null) {
			session.invalidate();
			userService.deleteUser(vo);
			return "redirect:/main.do";
		}
		return "redirect:/mypage/orderList.do?error=invalidPassword";
	}
	
	@RequestMapping(value="/admin/login.do", method=RequestMethod.GET)
	public String adminlogin() {
		return "login/login.jsp";
	}
	
	@RequestMapping(value="/admin/login.do", method=RequestMethod.POST)
	public String adminlogin(HttpSession session, UserVO vo) {
		UserVO user = userService.getUserAdminLogin(vo);
		if(user != null) {
			session.setAttribute("user", user);
			return "redirect:main.do";
		}else {
			UserVO normalUser = userService.getUser(vo);
			if(normalUser != null) {
				return "redirect:login.do?error=nonAdmin";
			}else {
				return "redirect:login.do?error=nonUser";
			}
		}
	}
	
	@RequestMapping("/admin/logout.do")
	public String adminlogout(HttpSession session) {
		session.invalidate();
		return "redirect:login.do";
	}
	
	@RequestMapping("/admin/user/list.do")
	public String userlist(UserVO vo, Model model,
			HttpSession session, String pageNum) {
		UserVO adminUser = (UserVO) session.getAttribute("user");
		if(adminUser == null) {
			return "redirect:../login.do?error=nonUser";
		}
		
		String userGrade = adminUser.getGrade();
		if(!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../login.do?error=nonAdmin";
		}
		
		int totalCount = userService.getUserListCount();
		
		int pageSize = 10;

		// 전체 페이지 수 계산
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);

		// 현재 페이지 계산
		int currentPage = 1;
		if (pageNum != null && !pageNum.equals("")) {
			currentPage = Integer.parseInt(pageNum);
		}

		// 현재 페이지에 보여줄 리스트
		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;

		vo.setStart(start);
		vo.setEnd(end);

		// 전체 회원 페이지별로 보여주기
		List<UserVO> users = userService.getUserListPage(vo);
		model.addAttribute("users", users);

		// 현재 페이지 블록의 시작과 끝페이지 계산
		int pageBlock = 5; // 페이지 블록 단위
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		int endPage = Math.min(startPage + pageBlock - 1, totalPages);

		// 한 페이지의 게시물 시작과 끝
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageSize", pageSize);
		
		return "../userManagement/userManageList.jsp";
	}
	
	@RequestMapping(value="/admin/user/detail.do", method=RequestMethod.GET)
	public String userdetail(UserVO vo, OrderVO orderVO,OrderItemsVO orderItemsVO, Model model,HttpSession session) {
		UserVO adminUser = (UserVO) session.getAttribute("user");
		if(adminUser == null) {
			return "redirect:../login.do?error=nonUser";
		}
		
		String userGrade = adminUser.getGrade();
		if(!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../login.do?error=nonAdmin";
		}
		UserVO user = userService.getUserDetail(vo);
		int total_order_price = userService.getUserTotalOrderPrice(user);
		user.setTotal_order_price(total_order_price);
		model.addAttribute("user", user);
		
		orderVO.setUser_id(vo.getUser_id());
		List<OrderVO> orders = orderService.getUserOrderList(orderVO, orderItemsVO);
		model.addAttribute("orders", orders);
		return "../userManagement/userManageDetail.jsp";
	}
	
	@RequestMapping(value="/admin/user/detail.do", method=RequestMethod.POST)
	public String userdetail(UserVO vo, Model model) {
		userService.updateUserByAdmin(vo);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="/admin/user/delete1.do", method=RequestMethod.POST)
	public String deleteUserDetail(HttpSession session, UserVO vo, String selectedUser) {
		//System.out.println("삭제진행중");
		//System.out.println(vo);
		vo.setUser_id(selectedUser);
		userService.deleteUser(vo);
		return "redirect:/admin/user/list.do";
	}
	
	@RequestMapping(value="/admin/user/delete2.do", method=RequestMethod.POST)
	public String deleteUserList(HttpSession session, UserVO vo, String selectedUsers) {
		//System.out.println("상품 삭제 중");
		UserVO adminUser = (UserVO) session.getAttribute("user");
		if(adminUser == null) {
			return "redirect:../login.do?error=nonUser";
		}
		
		String userGrade = adminUser.getGrade();
		if(!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../login.do?error=nonAdmin";
		}
		
		String[] userIDs = selectedUsers.split(",");
		
		for(String userID : userIDs) {
			vo.setUser_id(userID);
			userService.deleteUser(vo);
		}
		
		return "redirect:/admin/user/list.do";
	}

}
