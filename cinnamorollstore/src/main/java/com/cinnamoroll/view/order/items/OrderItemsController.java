package com.cinnamoroll.view.order.items;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cinnamoroll.store.order.OrderVO;
import com.cinnamoroll.store.order.items.OrderItemsService;
import com.cinnamoroll.store.order.items.OrderItemsVO;
import com.cinnamoroll.store.user.UserVO;

@Controller
public class OrderItemsController {
	
	@Autowired
	private OrderItemsService orderItemsService;
	
	@RequestMapping(value="/mypage/orderList.do", method=RequestMethod.GET)
	public String myOrderList(HttpSession session, OrderItemsVO vo, Model model) {
		UserVO user = (UserVO) session.getAttribute("user");
		
		if(user == null) {
			return "redirect:/login.do";
		}
		vo.setUser_id(user.getUser_id());
		List<OrderItemsVO> orderItems = orderItemsService.getMyOrderItemsList(vo);
		model.addAttribute("orderItems", orderItems);
		return "/user/mypage/orderList.jsp";
	}
}
