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

	// 아이템 or 장바구니 -> 주문 처리 페이지 이동
	@RequestMapping("myOrderProcess.do")
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
	@RequestMapping("myOrderComplete.do")
	public String myOrderComplete(HttpSession session, OrderVO orderVO, OrderItemsVO orderItemsVO, String phone,
			String address, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");

		if (user == null) {
			return "redirect:/login.do";
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

		System.out.println("nowOrderNumber: " + nowOrderNumber);
		orderVO.setOrder_number(nowOrderNumber);
		System.out.println(orderVO);
		List<CartVO> carts = (List<CartVO>) session.getAttribute("carts");

		for (CartVO cart : carts) {
			orderItemsVO.setOrder_number(nowOrderNumber);
			orderItemsVO.setItem_number(cart.getItem_number());
			orderItemsVO.setQuantity(cart.getQuantity());
			orderItemsVO.setItem_price(cart.getSale_price());
			orderItemsVO.setDelivery_price(cart.getDelivery_price());
			orderItemsVO.setItem_number(cart.getItem_number());
			// System.out.println(orderItemsVO);
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

	@RequestMapping(value = "/admin/order/list.do", method = RequestMethod.GET)
	public String orderlist(OrderVO orderVO, OrderItemsVO orderItemsVO, Model model, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../login.do?error=nonAdmin";
		}

		List<OrderVO> orders = orderService.getOrderList(orderVO);

		for (OrderVO order : orders) {
			int orderNumber = order.getOrder_number();
			orderItemsVO.setOrder_number(orderNumber);
			int orderItemsCount = orderItemsService.getOrderItemsCount(orderItemsVO);
			String orderItemsName = orderItemsService.getOrderItemsName(orderItemsVO);
			order.setOrder_items_count(orderItemsCount);
			order.setOrder_items_name(orderItemsName);
		}
		model.addAttribute("orders", orders);

		orderVO.setOrder_status("주문 확인 전");
		List<OrderVO> beforeCheckOrders = orderService.getOrderStatusList(orderVO);
		for (OrderVO order : beforeCheckOrders) {
			int orderNumber = order.getOrder_number();
			orderItemsVO.setOrder_number(orderNumber);
			int orderItemsCount = orderItemsService.getOrderItemsCount(orderItemsVO);
			String orderItemsName = orderItemsService.getOrderItemsName(orderItemsVO);
			order.setOrder_items_count(orderItemsCount);
			order.setOrder_items_name(orderItemsName);
		}
		model.addAttribute("beforeCheckOrders", beforeCheckOrders);

		orderVO.setOrder_status("주문 확인");
		List<OrderVO> checkOrders = orderService.getOrderStatusList(orderVO);
		for (OrderVO order : checkOrders) {
			int orderNumber = order.getOrder_number();
			orderItemsVO.setOrder_number(orderNumber);
			int orderItemsCount = orderItemsService.getOrderItemsCount(orderItemsVO);
			String orderItemsName = orderItemsService.getOrderItemsName(orderItemsVO);
			order.setOrder_items_count(orderItemsCount);
			order.setOrder_items_name(orderItemsName);
		}
		model.addAttribute("checkOrders", checkOrders);

		orderVO.setOrder_status("배송 준비 중");
		List<OrderVO> preparingDeliveryOrders = orderService.getOrderStatusList(orderVO);
		for (OrderVO order : preparingDeliveryOrders) {
			int orderNumber = order.getOrder_number();
			orderItemsVO.setOrder_number(orderNumber);
			int orderItemsCount = orderItemsService.getOrderItemsCount(orderItemsVO);
			String orderItemsName = orderItemsService.getOrderItemsName(orderItemsVO);
			order.setOrder_items_count(orderItemsCount);
			order.setOrder_items_name(orderItemsName);
		}
		model.addAttribute("preparingDeliveryOrders", preparingDeliveryOrders);

		orderVO.setOrder_status("배송 중");
		List<OrderVO> deliveringOrders = orderService.getOrderStatusList(orderVO);
		for (OrderVO order : deliveringOrders) {
			int orderNumber = order.getOrder_number();
			orderItemsVO.setOrder_number(orderNumber);
			int orderItemsCount = orderItemsService.getOrderItemsCount(orderItemsVO);
			String orderItemsName = orderItemsService.getOrderItemsName(orderItemsVO);
			order.setOrder_items_count(orderItemsCount);
			order.setOrder_items_name(orderItemsName);
		}
		model.addAttribute("deliveringOrders", deliveringOrders);

		orderVO.setOrder_status("배송 완료");
		List<OrderVO> deliveryCompleteOrders = orderService.getOrderStatusList(orderVO);
		for (OrderVO order : deliveryCompleteOrders) {
			int orderNumber = order.getOrder_number();
			orderItemsVO.setOrder_number(orderNumber);
			System.out.println(orderItemsVO);
			int orderItemsCount = orderItemsService.getOrderItemsCount(orderItemsVO);
			String orderItemsName = orderItemsService.getOrderItemsName(orderItemsVO);
			order.setOrder_items_count(orderItemsCount);
			order.setOrder_items_name(orderItemsName);
		}
		model.addAttribute("deliveryCompleteOrders", deliveryCompleteOrders);

		return "../orderManagement/orderManageList.jsp";
	}

	@RequestMapping(value = "/admin/order/detail.do", method = RequestMethod.GET)
	public String orderDetail(OrderVO orderVO, OrderItemsVO orderItemsVO, Model model, HttpSession session) {
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

	// 결제 상태, 주문 상태 변경
	@RequestMapping(value = "/admin/order/detail/edit.do", method = RequestMethod.POST)
	public String orderDetailChange(HttpSession session, OrderVO vo, Model model) {
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
		return "redirect:/admin/order/list.do";
	}

	// 결제 상태, 주문 상태 변경
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
