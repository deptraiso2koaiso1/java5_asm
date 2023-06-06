package com.poly.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController {
	@GetMapping("/user/cart")
	public String index() {
		return "user/cart";
	}

	@GetMapping("/user/cart/checkout")
	public String checkout() {
		return "user/checkout";
	}
}
