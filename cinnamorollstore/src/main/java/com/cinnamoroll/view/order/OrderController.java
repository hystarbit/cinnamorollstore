package com.cinnamoroll.view.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cinnamoroll.store.cart.CartService;
import com.cinnamoroll.store.cart.CartVO;
import com.cinnamoroll.store.item.ItemService;
import com.cinnamoroll.store.item.ItemVO;
import com.cinnamoroll.store.order.OrderService;
import com.cinnamoroll.store.order.OrderVO;
import com.cinnamoroll.store.order.cancel.OrderCancelService;
import com.cinnamoroll.store.order.delivery.OrderDeliveryService;
import com.cinnamoroll.store.order.delivery.OrderDeliveryVO;
import com.cinnamoroll.store.order.items.OrderItemsService;
import com.cinnamoroll.store.order.items.OrderItemsVO;
import com.cinnamoroll.store.user.UserService;
import com.cinnamoroll.store.user.UserVO;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderItemsService orderItemsService;

	@Autowired
	private CartService cartService;

	@Autowired
	private ItemService itemService;

	@Autowired
	private UserService userService;

	@Autowired
	private OrderCancelService orderCancelService;

	@Autowired
	private OrderDeliveryService orderDeliveryService;

	// 아이템 or 장바구니 -> 주문 처리 페이지 이동
	@RequestMapping(value="myOrderProcess.do")
	public String myOrderProcess(ItemVO itemVO, CartVO cartVO, String quantity, String selectedCarts,
			HttpSession session, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");

		if (user == null) {
			return "redirect:/login.do";
		}

		List<CartVO> carts = new ArrayList<CartVO>();

		// 선택한 장바구니 항복이 있는 경우
		if (selectedCarts != null && !selectedCarts.isEmpty()) {
			String[] cartNumbers = selectedCarts.split(",");
			for (String cartNumberStr : cartNumbers) {
				int cartNumber = Integer.parseInt(cartNumberStr);
				cartVO.setCart_number(cartNumber);
				CartVO cart = cartService.getCart(cartVO);
				carts.add(cart);
			}
		}
		// 상품 리스트에서 바로 주문하는 경우
		else if (itemVO != null && quantity != null) {
			ItemVO item = itemService.getItem(itemVO);
			cartVO.setCart_number(0);
			cartVO.setUser_id(user.getUser_id());
			cartVO.setItem_number(item.getItem_number());
			cartVO.setImage(item.getImage());
			cartVO.setName(item.getName());
			cartVO.setSale_price(item.getSale_price());
			cartVO.setQuantity(Integer.parseInt(quantity));
			cartVO.setDelivery_price(item.getDelivery_price());
			carts.add(cartVO);
		}

		session.setAttribute("carts", carts);
		model.addAttribute("carts", carts);

		return "user/orderProcess/myorder.jsp";
	}

	// 주문 처리 후 주문 완료 페이지 이동
	@RequestMapping(value="myOrderComplete.do")
	public String myOrderComplete(HttpSession session, 
			OrderVO orderVO, OrderItemsVO orderItemsVO, String phone,
			String address, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");

		if (user == null) {
			return "redirect:/login.do";
		}
		
		List<CartVO> carts = (List<CartVO>) session.getAttribute("carts");
		if(carts == null) {
			return "redirect:/main.do";
		}
		orderVO.setOrder_address(address);
		orderVO.setOrder_type("신규");
		String paymentType = orderVO.getPayment_type();
		if (paymentType.equals("무통장입금")) {
			orderVO.setPayment_status("입금 전");
		} else {
			orderVO.setPayment_status("결제 완료");
		}
		orderVO.setOrder_status("주문 확인 전");
		orderVO.setUser_id(user.getUser_id());

		orderService.insertOrder(orderVO);

		int maxOrderNumber = orderService.getMaxOrderNumber();
		int nowOrderNumber = maxOrderNumber;

		orderVO.setOrder_number(nowOrderNumber);
		

		for (CartVO cart : carts) {
			orderItemsVO.setOrder_number(nowOrderNumber);
			orderItemsVO.setItem_number(cart.getItem_number());
			orderItemsVO.setQuantity(cart.getQuantity());
			orderItemsVO.setItem_price(cart.getSale_price());
			orderItemsVO.setDelivery_price(cart.getDelivery_price());
			orderItemsVO.setItem_number(cart.getItem_number());
			orderItemsService.insertOrderItems(orderItemsVO);
			cartService.deleteCart(cart);
		}

		List<OrderItemsVO> orderItems = orderItemsService.getOrderItemsList(orderItemsVO);

		model.addAttribute("order", orderVO);
		model.addAttribute("orderItems", orderItems);
		return "user/orderProcess/orderComplete.jsp";
	}

	// 주문 상세 페이지 이동
	@RequestMapping("/mypage/orderDetail.do")
	public String myOrderDetail(HttpSession session, OrderVO orderVO, OrderItemsVO orderItemsVO, String phone,
			String address, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");

		if (user == null) {
			return "redirect:/login.do";
		}

		OrderVO order = orderService.getOrder(orderVO);

		String loginUserId = user.getUser_id();
		String orderUserId = order.getUser_id();
		if (!loginUserId.equals(orderUserId)) {
			return "redirect:/login.do?error=notEqualUser";
		}

		orderItemsVO.setOrder_number(orderVO.getOrder_number());
		List<OrderItemsVO> orderItems = orderItemsService.getOrderItemsList(orderItemsVO);

		model.addAttribute("order", order);
		model.addAttribute("orderItems", orderItems);
		return "../user/mypage/orderDetail.jsp";
	}

	// 주문 상세 페이지 이동
	@RequestMapping(value = "saveAddress.do", method = RequestMethod.POST)
	public String saveAddress(HttpSession session, OrderVO vo, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");

		if (user == null) {
			return "redirect:/login.do";
		}

		orderService.updateOrderAddress(vo);
		int order_number = vo.getOrder_number();
		return "redirect:/mypage/orderDetail.do?order_number=" + order_number;
	}
	// 관리자 메인페이지
	@RequestMapping(value = "/admin/main.do", method = RequestMethod.GET)
	public String adminMain(HttpSession session, UserVO vo, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:login.do?error=nonAdmin";
		}

		int todayUser = userService.getTodaySignupCount();
		int todayItem = itemService.getTodayItemCount();
		int todayOrder = orderService.getTodayOrderCount();
		int todayOrderCancel = orderCancelService.getTodayOrderCancelCount();

		model.addAttribute("todayUser", todayUser);
		model.addAttribute("todayItem", todayItem);
		model.addAttribute("todayOrder", todayOrder);
		model.addAttribute("todayOrderCancel", todayOrderCancel);
		return "main/adminMain.jsp";
	}
	
	@RequestMapping(value = "/admin/order/list.do")
	public String orderlist(OrderVO orderVO, OrderItemsVO orderItemsVO, Model model, HttpSession session,
			String pageNum, String tab, 
			String period_start, String period_end,
			String searchField, String searchWord) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../login.do?error=nonAdmin";
		}
		
		

		boolean search = true;
		if(period_start == null && period_end == null
				&& searchField == null && searchWord == null) {
			search = false;
		}
		
		
		orderVO.setPeriod_start(period_start);
		orderVO.setPeriod_end(period_end);
		
		
		int pageSize = 10;

		// 현재 페이지 계산
		int currentPage = 1;
		if (pageNum != null && !pageNum.equals("")) {
			currentPage = Integer.parseInt(pageNum);
		}

		// 현재 페이지에 보여줄 리스트
		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;

		orderVO.setStart(start);
		orderVO.setEnd(end);

		if (tab == null || tab.isEmpty()) {
			tab = "beforeCheck";
		}

		model.addAttribute("activeTab", tab);

		List<OrderVO> orders = new ArrayList<OrderVO>();
		int totalCount = 0;
		
		if (tab.equals("all")) {
			if(search) {
				totalCount = orderService.getOrderSearchCount(orderVO);
				orders = orderService.getOrderSearchListPage(orderVO, orderItemsVO);
			}else {
				totalCount = orderService.getOrderListCount();
				orders = orderService.getOrderListPage(orderVO, orderItemsVO);
			}
		} else {
			if (tab.equals("beforeCheck")) {
				orderVO.setOrder_status("주문 확인 전");
			} else if (tab.equals("check")) {
				orderVO.setOrder_status("주문 확인");
			} else if (tab.equals("preparingDelivery")) {
				orderVO.setOrder_status("배송 준비 중");
			} else if (tab.equals("delivering")) {
				orderVO.setOrder_status("배송 중");
			} else if (tab.equals("deliveryComplete")) {
				orderVO.setOrder_status("배송 완료");
			}
			if(search) {
				totalCount = orderService.getOrderStatusSearchCount(orderVO);
				orders = orderService.getOrderStatusSearchListPage(orderVO, orderItemsVO);
				
			}else {
				totalCount = orderService.getOrderStatusCount(orderVO);
				orders = orderService.getOrderStatusListPage(orderVO, orderItemsVO);
			}
		}
		
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);
		int pageBlock = 5;
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1; 
		int endPage = Math.min(startPage + pageBlock - 1, totalPages);
		
		model.addAttribute("orders", orders);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages); 
		model.addAttribute("startPage", startPage); 
		model.addAttribute("endPage", endPage);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageSize", pageSize);
		
		model.addAttribute("period_start", period_start);
		model.addAttribute("period_end", period_end);
		model.addAttribute("searchField", searchField);
		model.addAttribute("searchWord", searchWord);
		return "../orderManagement/orderManageList.jsp";
	}
	
	@RequestMapping(value = "/admin/order/detail.do", method = RequestMethod.GET)
	public String orderDetail(OrderVO orderVO, OrderItemsVO orderItemsVO, Model model, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../login.do?error=nonAdmin";
		}

		OrderVO order = orderService.getOrder(orderVO);

		orderItemsVO.setOrder_number(orderVO.getOrder_number());
		List<OrderItemsVO> orderItems = orderItemsService.getOrderItemsList(orderItemsVO);

		model.addAttribute("order", order);
		model.addAttribute("orderItems", orderItems);
		return "../orderManagement/orderManageDetail.jsp";
	}

	// 사용자 주소 수정
	@RequestMapping(value = "saveAddress2.do", method = RequestMethod.POST)
	public String saveAddress2(HttpSession session, OrderVO vo, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../login.do?error=nonAdmin";
		}

		orderService.updateOrderAddress(vo);
		int order_number = vo.getOrder_number();
		return "redirect:/admin/order/detail.do?order_number=" + order_number;
	}

	// 개별 주문 결제 상태, 주문 상태, 배송 정보 변경
	@RequestMapping(value = "/admin/order/detail/edit.do", method = RequestMethod.POST)
	public String orderDetailChange(HttpSession session, OrderVO vo, OrderDeliveryVO orderDeliveryVO, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../../login.do?error=nonAdmin";
		}

		orderService.updateOrderStatus(vo);
		orderService.updatePaymentStatus(vo);

		String order_status = vo.getOrder_status();
		if (order_status.equals("배송 중") || order_status.equals("배송 완료")) {
			int order_number = vo.getOrder_number();
			orderDeliveryVO.setOrder_number(order_number);
			int deliveryNumber = vo.getDelivery_number();
			String deliveryCompany = vo.getDelivery_company();
			if ((deliveryNumber == 0) && (!deliveryCompany.equals(""))) {
				orderDeliveryService.insertOrderDelivery(orderDeliveryVO);
			}
		}

		return "redirect:/admin/order/list.do";
	}

	// 주문 리스트 상태 변경
	@RequestMapping(value = "/admin/order/list/edit.do", method = RequestMethod.POST)
	public String orderListChange(HttpSession session, OrderVO vo, Model model, String selectedOrders) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../../login.do?error=nonAdmin";
		}

		String[] orderNumbers = selectedOrders.split(",");

		for (String orderNumberStr : orderNumbers) {
			int orderNumber = Integer.parseInt(orderNumberStr);
			vo.setOrder_number(orderNumber);
			orderService.updateOrderStatus(vo);
		}

		return "redirect:/admin/order/list.do";
	}

}
