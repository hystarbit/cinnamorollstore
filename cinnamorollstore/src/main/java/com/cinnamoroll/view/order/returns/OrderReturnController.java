package com.cinnamoroll.view.order.returns;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cinnamoroll.store.order.OrderService;
import com.cinnamoroll.store.order.OrderVO;
import com.cinnamoroll.store.order.cancel.OrderCancelVO;
import com.cinnamoroll.store.order.items.OrderItemsService;
import com.cinnamoroll.store.order.items.OrderItemsVO;
import com.cinnamoroll.store.order.returns.OrderReturnService;
import com.cinnamoroll.store.order.returns.OrderReturnVO;
import com.cinnamoroll.store.order.returns.complete.OrderReturnCompleteService;
import com.cinnamoroll.store.order.returns.complete.OrderReturnCompleteVO;
import com.cinnamoroll.store.user.UserVO;

@Controller
public class OrderReturnController {
	
	@Autowired
	private OrderItemsService orderItemsService;
	
	@Autowired
	private OrderReturnService orderReturnService;
	
	@Autowired
	private OrderReturnCompleteService orderReturnCompleteService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="mypage/return/request.do", method=RequestMethod.GET)
	public String requestReturn(HttpSession session, OrderItemsVO vo, Model model){
		UserVO user = (UserVO) session.getAttribute("user");
		
		if(user == null) {
			return "redirect:/login.do";
		}
		
		OrderItemsVO orderItem = orderItemsService.getOrderItems(vo);
		String loginUserId = user.getUser_id();
		String orderUserId = orderItem.getUser_id();
		if (!loginUserId.equals(orderUserId)){
			return "redirect:/login.do?error=notEqualUser";
		}
		
		model.addAttribute("orderItem", orderItem);
		return "/user/mypage/requestReturn.jsp";
	}
	
	@RequestMapping(value="mypage/return/request.do", method=RequestMethod.POST)
	public String requestReturnApplication(HttpSession session, 
			OrderReturnVO orderReturnVO, Model model){
		UserVO user = (UserVO) session.getAttribute("user");
		
		if(user == null) {
			return "redirect:/login.do";
		}
		System.out.println(orderReturnVO);
		orderReturnService.insertOrderReturn(orderReturnVO);
		
		return "redirect:/mypage/orderList.do";
	}
	
	@RequestMapping(value="/mypage/return/detail.do", method=RequestMethod.GET)
	public String requestReturnDetail(HttpSession session, OrderItemsVO orderItemsVO, 
			OrderReturnVO orderReturnVO, Model model){
		UserVO user = (UserVO) session.getAttribute("user");
		
		if(user == null) {
			return "redirect:/login.do";
		}
		
		OrderReturnVO orderReturn = orderReturnService.getOrderReturn(orderReturnVO);
		
		int orderItemNumber = orderReturn.getOrder_item_number();
		System.out.println(orderItemNumber);
		orderItemsVO.setOrder_item_number(orderItemNumber);
		
		OrderItemsVO orderItem = orderItemsService.getOrderItems(orderItemsVO);
		
		String loginUserId = user.getUser_id();
		String orderUserId = orderItem.getUser_id();
		if (!loginUserId.equals(orderUserId)){
			return "redirect:/login.do?error=notEqualUser";
		}
		
		model.addAttribute("orderReturn", orderReturn);
		model.addAttribute("orderItem", orderItem);
		
		return "/user/mypage/returnDetail.jsp";
	}
	
	@RequestMapping("/admin/order/return/list.do")
	public String adminOrderCancelList(HttpSession session, Model model, 
			OrderItemsVO orderItemsVO, OrderReturnVO orderReturnVO,
			String tab, String pageNum) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../../login.do?error=nonAdmin";
		}
		int pageSize = 10;

		// 현재 페이지 계산
		int currentPage = 1;
		if (pageNum != null && !pageNum.equals("")) {
			currentPage = Integer.parseInt(pageNum);
		}

		// 현재 페이지에 보여줄 리스트
		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;

		orderReturnVO.setStart(start);
		orderReturnVO.setEnd(end);

		if (tab == null || tab.isEmpty()) {
			tab = "beforeReturn";
		}
		
		model.addAttribute("activeTab", tab);

		List<OrderReturnVO> orderReturns = new ArrayList<OrderReturnVO>();
		int totalCount = 0;
		
		if (tab.equals("beforeReturn")) {
			orderReturnVO.setOrder_return_status("처리 전");
		} else if (tab.equals("afterReturn")) {
			orderReturnVO.setOrder_return_status("처리 완료");
		}
		
		totalCount = orderReturnService.getOrderReturnStatusCount(orderReturnVO);
		orderReturns = orderReturnService.getOrderReturnStatusListPage(orderReturnVO);
		
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);
		int pageBlock = 5;
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1; 
		int endPage = Math.min(startPage + pageBlock - 1, totalPages);
		
		model.addAttribute("orderReturns", orderReturns);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages); 
		model.addAttribute("startPage", startPage); 
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageSize", pageSize);
		/*
		vo.setOrder_return_status("처리 전");
		List<OrderReturnVO> beforeReturnOrders = orderReturnService.getOrderReturnStatusList(vo);
		model.addAttribute("beforeReturnOrders", beforeReturnOrders);

		vo.setOrder_return_status("처리 완료");
		List<OrderReturnVO> afterReturnOrders = orderReturnService.getOrderReturnStatusList(vo);
		model.addAttribute("afterReturnOrders", afterReturnOrders);
		*/
		return "../../orderManagement/orderReturnList.jsp";
	}
	
	@RequestMapping("/admin/order/return/detail.do")
	public String adminOrderReturnDetail(HttpSession session, Model model, 
			OrderReturnVO vo) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../../login.do?error=nonAdmin";
		}
		OrderReturnVO orderReturn = orderReturnService.getOrderReturn(vo);

		model.addAttribute("orderReturn", orderReturn);
		return "../../orderManagement/orderReturnDetail.jsp";
	}
	
	// 처리 상태 변경, 교환일 시 교환 진행
	@RequestMapping(value = "/admin/order/return/detail/edit.do", method = RequestMethod.POST)
	public String orderReturnDetailChange(HttpSession session, Model model,
			OrderVO orderVO, OrderItemsVO orderItemsVO, OrderReturnVO orderReturnVO, 
			OrderReturnCompleteVO orderReturnCompleteVO) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../../../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../../../login.do?error=nonAdmin";
		}
		System.out.println(orderReturnVO);
		
		// 처리 메모는 언제나 업데이트 가능
		orderReturnService.updateProcessingMemo(orderReturnVO);
		
		// 아직 처리 전이면 교환/환불 리스트 보기
		String orderReturnStatus = orderReturnVO.getOrder_return_status();
		//System.out.println(orderReturnStatus);
		
		if (orderReturnStatus.equals("처리 전")){
			return "redirect:/admin/order/return/list.do";
		}
		
		// 교환 시 재주문하기
		OrderReturnVO orderReturn = orderReturnService.getOrderReturn(orderReturnVO);
		String returnType = orderReturn.getReturn_type();
		if(returnType.equals("교환")) {
			// orderVO에 항목넣기
			// order_type
			orderVO.setOrder_type("교환");
			
			// order_price
			orderVO.setOrder_price(0);
			
			// payment_type
			String paymentType = orderReturn.getPayment_type();
			orderVO.setPayment_type(paymentType);
			
			// payment_status
			if (paymentType.equals("무통장입금")) {
				orderVO.setPayment_status("입금 전");
			} else {
				orderVO.setPayment_status("결제 완료");
			}
			
			// order_status
			orderVO.setOrder_status("주문 확인 전");
			
			// user_id
			String userId = orderReturn.getUser_id();
			orderVO.setUser_id(userId);
			
			// order_address
			String orderAddress = orderReturn.getOrder_address();
			orderVO.setOrder_address(orderAddress);
			
			// 주문 진행하기
			orderService.insertOrder(orderVO);
			
			// 주문 번호 구하기 
			int maxOrderNumber = orderService.getMaxOrderNumber();
			int nowOrderNumber = maxOrderNumber;
			
			// 기존 주문 상품 정보 가져오기 
			orderVO.setOrder_number(nowOrderNumber);
			
			int orderItemNumber = orderReturn.getOrder_item_number();
			orderItemsVO.setOrder_item_number(orderItemNumber);
			OrderItemsVO orderItem = orderItemsService.getOrderItems(orderItemsVO);
			
			// 기존 주문 상품 정보에 현재 주문 번호 넣기 
			orderItem.setOrder_number(nowOrderNumber);
			
			// 주문 상품 추가하기
			orderItemsService.insertOrderItems(orderItem);
			
		}
		
		// 처리 전 -> 처리 완료 시 업데이트 
		int applicationNumber = orderReturnVO.getApplication_number();
		//System.out.println(applicationNumber);
		
		orderReturnCompleteVO.setApplication_number(applicationNumber);
		
		orderReturnCompleteService.insertOrderReturnComplete(orderReturnCompleteVO);
		
		orderReturnService.updateOrderReturnStatus(orderReturnVO);
		
		return "redirect:/admin/order/return/list.do";
	}
	
	// 교환/환불 신청서 삭제 
	@RequestMapping(value = "/admin/order/return/detail/delete.do", method = RequestMethod.POST)
	public String orderReturnDetailDelete(HttpSession session, Model model,
			OrderReturnVO orderReturnVO, OrderReturnCompleteVO orderReturnCompleteVO) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../../../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../../../login.do?error=nonAdmin";
		}
		
		orderReturnCompleteService.deleteOrderReturnComplete(orderReturnCompleteVO);
		orderReturnService.deleteOrderReturn(orderReturnVO);
		
		return "redirect:/admin/order/return/list.do";
	}
	
	// 교환/환불 처리 완료 리스트로 이동
	@RequestMapping(value = "/admin/order/return/list/edit.do", method = RequestMethod.POST)
	public String orderReturnListChange(HttpSession session, Model model, 
			String selectedOrderReturns,
			OrderVO orderVO, OrderItemsVO orderItemsVO, OrderReturnVO orderReturnVO, 
			OrderReturnCompleteVO orderReturnCompleteVO) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../../../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../../../login.do?error=nonAdmin";
		}

		String[] applicationNumbers = selectedOrderReturns.split(",");

		for (String applicationNumberStr : applicationNumbers) {
			int applicationNumber = Integer.parseInt(applicationNumberStr);
			orderReturnVO.setApplication_number(applicationNumber);
			OrderReturnVO orderReturn = orderReturnService.getOrderReturn(orderReturnVO);
			System.out.println(orderReturn);
			
			String returnType = orderReturn.getReturn_type();
			if(returnType.equals("교환")) {
				// orderVO에 항목넣기
				// order_type
				orderVO.setOrder_type("교환");
				
				// order_price
				orderVO.setOrder_price(0);
				
				// payment_type
				String paymentType = orderReturn.getPayment_type();
				orderVO.setPayment_type(paymentType);
				
				// payment_status
				if (paymentType.equals("무통장입금")) {
					orderVO.setPayment_status("입금 전");
				} else {
					orderVO.setPayment_status("결제 완료");
				}
				
				// order_status
				orderVO.setOrder_status("주문 확인 전");
				
				// user_id
				String userId = orderReturn.getUser_id();
				orderVO.setUser_id(userId);
				
				// order_address
				String orderAddress = orderReturn.getOrder_address();
				orderVO.setOrder_address(orderAddress);
				
				// 주문 진행하기
				orderService.insertOrder(orderVO);
				
				// 주문 번호 구하기 
				int maxOrderNumber = orderService.getMaxOrderNumber();
				int nowOrderNumber = maxOrderNumber;
				
				// 기존 주문 상품 정보 가져오기 
				orderVO.setOrder_number(nowOrderNumber);
				
				int orderItemNumber = orderReturn.getOrder_item_number();
				orderItemsVO.setOrder_item_number(orderItemNumber);
				OrderItemsVO orderItem = orderItemsService.getOrderItems(orderItemsVO);
				
				// 기존 주문 상품 정보에 현재 주문 번호 넣기 
				orderItem.setOrder_number(nowOrderNumber);
				
				// 주문 상품 추가하기
				orderItemsService.insertOrderItems(orderItem);
			}
			
			// 처리 전 -> 처리 완료 시 업데이트 
			
			orderReturnCompleteVO.setApplication_number(applicationNumber);
			
			orderReturnCompleteService.insertOrderReturnComplete(orderReturnCompleteVO);
			
			orderReturnService.updateOrderReturnStatus(orderReturnVO);
			
		}

		return "redirect:/admin/order/return/list.do";
	}
	
	@RequestMapping(value="/admin/order/return/request.do", method=RequestMethod.GET)
	public String adminRequestReturn(HttpSession session, OrderItemsVO vo, Model model){
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../../login.do?error=nonAdmin";
		}
		
		OrderItemsVO orderItem = orderItemsService.getOrderItems(vo);
		model.addAttribute("orderItem", orderItem);
		return "../../orderManagement/orderReturnRequest.jsp";
	}
	
	@RequestMapping(value="/admin/order/return/request.do", method=RequestMethod.POST)
	public String adminRequestReturnApplication(HttpSession session, 
			OrderReturnVO orderReturnVO, Model model){
		UserVO user = (UserVO) session.getAttribute("user");
		
		if(user == null) {
			return "redirect:/login.do";
		}
		System.out.println(orderReturnVO);
		orderReturnService.insertOrderReturn(orderReturnVO);
		
		return "redirect:/admin/order/return/list.do";
	}
	
	
}
