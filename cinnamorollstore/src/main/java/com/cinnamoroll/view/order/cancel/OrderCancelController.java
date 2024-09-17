package com.cinnamoroll.view.order.cancel;

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
	public String userOrderCancel(HttpSession session, OrderCancelVO vo) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:/login.do";
		}
		orderCancelService.insertOrderCancel(vo);
		return "redirect:/mypage/orderList.do";
	}
	
	@RequestMapping("/admin/order/cancel/list.do")
	public String adminOrderCancelList(HttpSession session, Model model, 
			OrderItemsVO orderItemsVO, OrderCancelVO orderCancelVO, 
			String tab, String pageNum,
			String period_start, String period_end,
			String searchField, String searchWord) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../../login.do?error=nonAdmin";
		}
		
		boolean search = true;
		if(period_start == null && period_end == null
				&& searchField == null && searchWord == null) {
			search = false;
		}
		
		orderCancelVO.setPeriod_start(period_start);
		orderCancelVO.setPeriod_end(period_end);
		
		int pageSize = 10;

		// 현재 페이지 계산
		int currentPage = 1;
		if (pageNum != null && !pageNum.equals("")) {
			currentPage = Integer.parseInt(pageNum);
		}

		// 현재 페이지에 보여줄 리스트
		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;

		orderCancelVO.setStart(start);
		orderCancelVO.setEnd(end);

		if (tab == null || tab.isEmpty()) {
			tab = "beforeCancel";
		}
		
		model.addAttribute("activeTab", tab);

		List<OrderCancelVO> orders = new ArrayList<OrderCancelVO>();
		int totalCount = 0;
		
		if (tab.equals("beforeCancel")) {
			orderCancelVO.setOrder_cancel_status("결제 취소 전");
		} else if (tab.equals("afterCancel")) {
			orderCancelVO.setOrder_cancel_status("결제 취소 완료");
		}
		
		if(search) {
			totalCount = orderCancelService.getOrderCancelStatusSearchCount(orderCancelVO);
			orders = orderCancelService.getOrderCancelStatusSearchListPage(orderCancelVO, orderItemsVO);
		}else {
			totalCount = orderCancelService.getOrderCancelStatusCount(orderCancelVO);
			orders = orderCancelService.getOrderCancelStatusListPage(orderCancelVO, orderItemsVO);
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
		return "../../orderManagement/orderCancelList.jsp";
	}
	
	@RequestMapping("/admin/order/cancel/detail.do")
	public String adminOrderCancelDetail(HttpSession session, Model model, OrderItemsVO orderItemsVO, OrderCancelVO vo,
			OrderVO orderVO) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../../login.do?error=nonAdmin";
		}
		OrderVO order = orderService.getOrder(orderVO);

		orderItemsVO.setOrder_number(orderVO.getOrder_number());
		List<OrderItemsVO> orderItems = orderItemsService.getOrderItemsList(orderItemsVO);

		model.addAttribute("order", order);
		model.addAttribute("orderItems", orderItems);
		return "../../orderManagement/orderCancelDetail.jsp";
	}

	// 결제 상태, 주문 상태 변경
	@RequestMapping(value = "/admin/order/cancel/detail/edit.do", method = RequestMethod.POST)
	public String orderCancelDetailChange(HttpSession session, OrderVO orderVO, OrderCancelVO orderCancelVO,
			Model model) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../../../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../../../login.do?error=nonAdmin";
		}

		orderService.updatePaymentStatus(orderVO);
		orderCancelService.updateOrderCancelStatus(orderCancelVO);
		return "redirect:/admin/order/cancel/list.do";
	}

	@RequestMapping(value = "/admin/order/cancel/list/edit.do", method = RequestMethod.POST)
	public String orderCancelListChange(HttpSession session, OrderCancelVO vo, Model model, String selectedOrderCancels) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../../../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../../../login.do?error=nonAdmin";
		}

		String[] orderNumbers = selectedOrderCancels.split(",");

		for (String orderNumberStr : orderNumbers) {
			int orderNumber = Integer.parseInt(orderNumberStr);
			vo.setOrder_number(orderNumber);
			vo.setOrder_cancel_status("결제 취소 완료");
			orderCancelService.updateOrderCancelStatus(vo);
		}

		return "redirect:/admin/order/cancel/list.do";
	}

	

	// 관리자에서 주문 취소하기
	@RequestMapping(value = "/admin/order/detail/cancel.do", method = RequestMethod.POST)
	public String orderDetailCancel(HttpSession session, OrderCancelVO orderCancelVO,
			Model model) {
		UserVO user = (UserVO) session.getAttribute("user");
		if (user == null) {
			return "redirect:../../login.do?error=nonUser";
		}

		String userGrade = user.getGrade();
		if (!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../../login.do?error=nonAdmin";
		}

		orderCancelService.insertOrderCancel(orderCancelVO);
		return "redirect:/admin/order/cancel/list.do";
	}

}
