package com.cinnamoroll.view.order.cancel;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cinnamoroll.store.order.OrderService;
import com.cinnamoroll.store.order.OrderVO;
import com.cinnamoroll.store.order.cancel.OrderCancelService;
import com.cinnamoroll.store.order.cancel.OrderCancelVO;
import com.cinnamoroll.store.order.items.OrderItemsService;
import com.cinnamoroll.store.order.items.OrderItemsVO;
import com.cinnamoroll.store.user.UserVO;

@Controller
public class OrderCancelController {
	
	@Autowired
	private OrderCancelService orderCancelService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderItemsService orderItemsService;
	
	@RequestMapping("/mypage/orderCancel.do")
	public String userOrderCancel(HttpSession session, OrderCancelVO vo){
		UserVO user = (UserVO) session.getAttribute("user");
		if(user == null) {
			return "redirect:/login.do";
		}
		orderCancelService.insertOrderCancel(vo);
		return "redirect:/mypage/orderList.do";
	}
	
	@RequestMapping("/admin/order/cancel.do")
	public String adminOrderCancelList(HttpSession session, Model model,
			OrderItemsVO orderItemsVO, OrderCancelVO vo){
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../login.do?error=nonAdmin";
		}
		vo.setOrder_cancel_status("결제 취소 전");
		List<OrderCancelVO> beforeCancelOrders = orderCancelService.getOrderCancelStatusList(vo);
		for (OrderCancelVO order : beforeCancelOrders) {
			int orderNumber = order.getOrder_number();
			orderItemsVO.setOrder_number(orderNumber);
			int orderItemsCount = orderItemsService.getOrderItemsCount(orderItemsVO);
			String orderItemsName = orderItemsService.getOrderItemsName(orderItemsVO);
			order.setOrder_items_count(orderItemsCount);
			order.setOrder_items_name(orderItemsName);
		}
		model.addAttribute("beforeCancelOrders", beforeCancelOrders);
		
		vo.setOrder_cancel_status("결제 취소 완료");
		List<OrderCancelVO> afterCancelOrders = orderCancelService.getOrderCancelStatusList(vo);
		for (OrderCancelVO order : afterCancelOrders) {
			int orderNumber = order.getOrder_number();
			orderItemsVO.setOrder_number(orderNumber);
			int orderItemsCount = orderItemsService.getOrderItemsCount(orderItemsVO);
			String orderItemsName = orderItemsService.getOrderItemsName(orderItemsVO);
			order.setOrder_items_count(orderItemsCount);
			order.setOrder_items_name(orderItemsName);
		}
		model.addAttribute("afterCancelOrders", afterCancelOrders);
		return "../orderManagement/orderCancel.jsp";
	}
	
	
}
