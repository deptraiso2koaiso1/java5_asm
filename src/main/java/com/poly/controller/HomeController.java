package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.repositories.ProductsDAO;
import com.poly.service.ProductService;

@Controller
public class HomeController {

	
	
	@GetMapping("/home")
	public String home() {
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
