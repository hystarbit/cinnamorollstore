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

	/*
	 * @RequestMapping(value="/mypage/orderList.do", method=RequestMethod.GET)
	 * public String myOrderList(HttpSession session, OrderItemsVO vo, Model model)
	 * { UserVO user = (UserVO) session.getAttribute("user");
	 * 
	 * if(user == null) { return "redirect:/login.do"; }
	 * vo.setUser_id(user.getUser_id()); List<OrderItemsVO> orderItems =
	 * orderItemsService.getMyOrderItemsList(vo); model.addAttribute("orderItems",
	 * orderItems); return "/user/mypage/orderList.jsp"; }
	 */
	@RequestMapping(value = "/mypage/orderList.do", method = RequestMethod.GET)
	public String myOrderListPage(HttpSession session, OrderItemsVO vo, Model model, String pageNum) {
		UserVO user = (UserVO) session.getAttribute("user");

		if (user == null) {
			return "redirect:/login.do";
		}
		vo.setUser_id(user.getUser_id());
		int totalCount = orderItemsService.getMyOrderItemsCount(vo);

		int pageSize = 10;

		// 전체 페이지 수 계산
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);

		// 현재 페이지 계산
		int currentPage = 1;
		if (pageNum != null && !pageNum.equals("")) {
			currentPage = Integer.parseInt(pageNum);
		}

		// 현재 페이지에 보여줄 아이템리스트
		int start = (currentPage - 1) * pageSize + 1;
		int end = currentPage * pageSize;

		vo.setStart(start);
		vo.setEnd(end);

		List<OrderItemsVO> orderItems = orderItemsService.getMyOrderItemsListPage(vo);
		model.addAttribute("orderItems", orderItems);

		// 현재 페이지 블록의 시작과 끝페이지 계산
		int pageBlock = 5; // 페이지 블록 단위
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		int endPage = Math.min(startPage + pageBlock - 1, totalPages);

		// 한 페이지의 게시물 시작과 끝
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageSize", pageSize);
		
		return "/user/mypage/orderList.jsp";
	}

}
