package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.poly.entities.Products;
import com.poly.repositories.ProductsDAO;
import com.poly.service.CartService;

@Controller
public class HomeController {
	@Autowired
	ProductsDAO productDao;
	@Autowired
	CartService cartService;

	@GetMapping("/home")
	public String home(Model model) {

		// Lấy danh sách top 5 sản phẩm theo giá
		List<Products> products = productDao.findAll(Sort.by(Sort.Direction.DESC, "price")).subList(0, 5);
		model.addAttribute("products", products);
		// Hiển thị số sản phẩm ở giỏ hàng
		model.addAttribute("count", cartService.getCount());
		return "user/home";
	}
//	@GetMapping("/user/about")
//	public void about() {
//	}
//	@RequestMapping("/user/shop")
//	public void shop() {
//	}
//	@GetMapping("/user/contact")
//	public void contact() {
//		
//	}
//	@GetMapping("/user/shop/shop-single")
//	public String shopSingle(){
//		return "user/shop-single";
//	}
//	@GetMapping("/user/shop/thankyou")
//	public String thankyou(){
//		return "user/thankyou";
//	}

}
