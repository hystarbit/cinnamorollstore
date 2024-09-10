package com.cinnamoroll.view.item;

import java.io.File;
import java.nio.file.Files;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cinnamoroll.store.item.ItemService;
import com.cinnamoroll.store.item.ItemVO;
import com.cinnamoroll.store.user.UserService;
import com.cinnamoroll.store.user.UserVO;

@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemService; // ItemService를 주입
	
	@Autowired
	private UserService userService; // UserService를 주입, admin페이지 권한 문제를 위해 도입

//	@Value("#{uploadPath}")
//    private String uploadPath;
	
	@RequestMapping("/main.do")
	public String mainImage(ItemVO vo, Model model) {
		vo.setCategory("문구");
		List<ItemVO> stationaryItems = itemService.getItemCategoryList(vo);
		model.addAttribute("stationaryItems", stationaryItems);
		
		vo.setCategory("필기");
		List<ItemVO> writingItems = itemService.getItemCategoryList(vo);
		model.addAttribute("writingItems", writingItems);
		
		vo.setCategory("소품");
		List<ItemVO> propsItems = itemService.getItemCategoryList(vo);
		model.addAttribute("propsItems", propsItems);
		return "/user/main/index.jsp";
	}
	
	@RequestMapping("/info.do")
	public String storeInfo() {
		return "/user/introduction/storeInfo.jsp";
	}
	
	@RequestMapping("/itemList/all.do")
	public String itemListAll(ItemVO vo, Model model) {
		List<ItemVO> items = itemService.getItemDisplayList(vo);
		model.addAttribute("items", items);
		model.addAttribute("category", "전체상품");
		return "/user/itemInfo/itemList.jsp";
	}
	
	@RequestMapping("/itemList/stationary.do")
	public String itemListStationary(ItemVO vo, Model model) {
		vo.setCategory("문구");
		List<ItemVO> items = itemService.getItemCategoryList(vo);
		model.addAttribute("items", items);
		model.addAttribute("category", "문구");
		return "/user/itemInfo/itemList.jsp";
	}
	
	@RequestMapping("/itemList/writing.do")
	public String itemListWriting(ItemVO vo, Model model) {
		vo.setCategory("필기");
		List<ItemVO> items = itemService.getItemCategoryList(vo);
		model.addAttribute("items", items);
		model.addAttribute("category", "필기");
		return "/user/itemInfo/itemList.jsp";
	}
	
	@RequestMapping("/itemList/props.do")
	public String itemListProps(ItemVO vo, Model model) {
		vo.setCategory("소품");
		List<ItemVO> items = itemService.getItemCategoryList(vo);
		model.addAttribute("items", items);
		model.addAttribute("category", "소품");
		return "/user/itemInfo/itemList.jsp";
	}
	
	@RequestMapping("/itemDetail.do")
	public String itemDetail(ItemVO vo, Model model) {
		ItemVO item = itemService.getItem(vo);
		model.addAttribute("item", item);
		return "/user/itemInfo/itemDetail.jsp";
	}
	
	@RequestMapping("/search.do")
	public String itemSearch(ItemVO vo, Model model) {
		ItemVO item = itemService.getItem(vo);
		model.addAttribute("item", item);
		return "/user/search/search.jsp";
	}
	
	@RequestMapping("/admin/item/list.do")
	public String itemManageList(HttpSession session, ItemVO vo, Model model) {
		//System.out.println("itemManageList 실행중");
		UserVO user = (UserVO) session.getAttribute("user");
		if(user == null) {
			return "redirect:../login.do?error=nonUser";
		}
		
		String userGrade = user.getGrade();
		if(!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../login.do?error=nonAdmin";
		}
		
		List<ItemVO> items = itemService.getItemList(vo);
		model.addAttribute("items", items);
		return "/admin/itemManagement/itemManageList.jsp";
	}
	
	@RequestMapping(value="/admin/item/regist.do", method=RequestMethod.GET)
	public String itemRegist(HttpSession session) {
		System.out.println("상품 등록 페이지 이동");
		UserVO user = (UserVO) session.getAttribute("user");
		if(user == null) {
			return "redirect:../login.do?error=nonUser";
		}
		
		String userGrade = user.getGrade();
		if(!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../login.do?error=nonAdmin";
		}
		
		return "/admin/itemManagement/itemRegistration.jsp";
	}
	
	@RequestMapping(value="/admin/item/regist.do", method=RequestMethod.POST)
	public String itemRegist(HttpSession session, ItemVO vo, Model model) {
		System.out.println("상품 등록 중");
		UserVO user = (UserVO) session.getAttribute("user");
		if(user == null) {
			return "redirect:../login.do?error=nonUser";
		}
		
		String userGrade = user.getGrade();
		if(!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../login.do?error=nonAdmin";
		}
		
		itemService.insertItem(vo);
		return "redirect:/admin/item/list.do";
	}
	
	@RequestMapping(value = "/admin/item/edit.do", method=RequestMethod.GET)
	public String itemEditPage(HttpSession session, ItemVO vo, Model model) {
		System.out.println("상품 수정 페이지 이동");
		UserVO user = (UserVO) session.getAttribute("user");
		if(user == null) {
			return "redirect:../login.do?error=nonUser";
		}
		
		String userGrade = user.getGrade();
		if(!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../login.do?error=nonAdmin";
		}
		
		ItemVO item = itemService.getItem(vo);
		model.addAttribute("item", item);
		return "/admin/itemManagement/itemEdit.jsp";
	}
	
	@RequestMapping(value = "/admin/item/edit.do", method=RequestMethod.POST)
	public String itemEditing(HttpSession session, ItemVO vo) {
		System.out.println("상품 수정 중");
		UserVO user = (UserVO) session.getAttribute("user");
		if(user == null) {
			return "redirect:../login.do?error=nonUser";
		}
		
		String userGrade = user.getGrade();
		if(!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../login.do?error=nonAdmin";
		}
		
		itemService.updateItem(vo);
		return "redirect:/admin/item/list.do";
	}
	
	@RequestMapping(value="/admin/item/delete.do", method=RequestMethod.POST)
	public String itemDelete(HttpSession session, ItemVO vo, String selectedItems) {
		System.out.println("상품 삭제 중");
		UserVO user = (UserVO) session.getAttribute("user");
		if(user == null) {
			return "redirect:../login.do?error=nonUser";
		}
		
		String userGrade = user.getGrade();
		if(!userGrade.equals("관리자")) {
			session.invalidate();
			return "redirect:../login.do?error=nonAdmin";
		}
		
		String[] itemNumbers = selectedItems.split(",");
		
		for(String itemNumberStr : itemNumbers) {
			int itemNumber = Integer.parseInt(itemNumberStr);
			vo.setItem_number(itemNumber);
			itemService.deleteItem(vo);
		}
		
		return "redirect:/admin/item/list.do";
	}
}
