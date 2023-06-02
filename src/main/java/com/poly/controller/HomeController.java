package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.Entity.Products;
import com.poly.Repository.ProductsDAO;

@Controller
public class HomeController {
	@Autowired
	ProductsDAO dao;

	@GetMapping("home")
	public String home() {
		return "user/home";
	}

	@GetMapping("/user/about")
	public void about() {
	}

	@RequestMapping("/user/shop")
	public String shop(@ModelAttribute("p") Products p, Model model) {

		model.addAttribute("items", dao.findAll());
		return "/user/shop";

	}

	@GetMapping("/user/contact")
	public void contact() {

	}

	@GetMapping("/user/shop/shop-single")
	public String shopSingle() {
		return "user/shop-single";
	}

	@GetMapping("/user/shop/thankyou")
	public String thankyou() {
		return "user/thankyou";
	}
}
