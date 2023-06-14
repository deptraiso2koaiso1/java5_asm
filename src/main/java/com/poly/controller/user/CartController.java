package com.poly.controller.user;

import java.util.Collection;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poly.model.CartItem;
import com.poly.repositories.ProductsDAO;
import com.poly.service.CartService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	CartService cart;
	@Autowired
	ParamService param;
	@Autowired
	ProductsDAO dao;

	@Autowired
	HttpServletRequest request;

	@Autowired
	SessionService session;

	@RequestMapping("")
	public String index(Model model) {
		// đưa products vào session
		Collection<CartItem> listProduct = session.get("products");
		listProduct = cart.getProducts();
		session.set("product", listProduct);
		// đưa count vào session
//		Integer count = session.get("count");
//		count = cart.getCount();
//		session.set("count", count);
		// đưa amount vào session
//		Double amount = session.get("totalPrice");
//		amount = cart.getTotalPrice();
//		session.set("totalPrice", amount);
		return "user/cart";
	}

	@RequestMapping("/add/{id}")
	public String add(@PathVariable int id, Model model) {
		HashMap<Integer, CartItem> maps = (HashMap<Integer, CartItem>) session.get("cart");
		if (maps == null) {
			maps = new HashMap<Integer, CartItem>();
		}
		maps = cart.addProduct(id);
		session.set("cart", maps);
		session.set("totalPrice", cart.getTotalPrice());
		session.set("totalQuantity", cart.getCount());

		CartItem item = maps.get(id);
		model.addAttribute("item", item);
		return "redirect:" + request.getHeader("Referer");
	}

//	@RequestMapping("/add/{id}")
//	public String add(@PathVariable int id, Model model) {
//		HashMap<Integer, CartItem> maps = (HashMap<Integer, CartItem>) session.get("cart");
//		if (maps == null) {
//			maps = new HashMap<Integer, CartItem>();
//		}
//		maps = cart.addProduct(id);
//		session.set("cart", maps);
//		session.set("totalQuantity", cart.getCount());
//		session.set("totalPrice", cart.getTotalPrice());
//		return "redirect:" + request.getHeader("Referer");
//	}

//	@RequestMapping("/update/{id}/{quantity}")
//	public String update(@PathVariable int id, @PathVariable int quantity, Model model) {
//		HashMap<Integer, CartItem> maps = (HashMap<Integer, CartItem>) session.get("cart");
//		if (maps == null) {
//			maps = new HashMap<Integer, CartItem>();
//		}
//		maps = cart.updateProduct(id, quantity);
//		session.set("cart", maps);
//		session.set("totalPrice", cart.getTotalPrice());
//		session.set("totalQuantity", cart.getCount());
//		CartItem item = maps.get(id);
//		model.addAttribute("item", item);
//		return "redirect:" + request.getHeader("Referer");
//	}
	@RequestMapping("/update/{id}/{quantity}")
	@ResponseBody
	public HashMap<Integer, CartItem> update(@PathVariable int id, @PathVariable int quantity) {
	  HashMap<Integer, CartItem> maps = (HashMap<Integer, CartItem>) session.get("cart");
	  if (maps == null) {
	    maps = new HashMap<Integer, CartItem>();
	  }
	  maps = cart.editProduct(id, quantity);
	  session.set("cart", maps);
	  session.set("totalPrice", cart.getTotalPrice());
	  session.set("totalQuantity", cart.getCount());
	  
	  HashMap<String, Object> response = new HashMap<String, Object>();
	  response.put("totalPrice", cart.getTotalPrice());
	  return maps;
	}

	@RequestMapping("/remove/{id}")
	public String remove(@PathVariable int id, Model model) {
		HashMap<Integer, CartItem> maps = (HashMap<Integer, CartItem>) session.get("cart");
		if (maps == null) {
			maps = new HashMap<Integer, CartItem>();
		}
		maps = cart.removeProduct(id);
		session.set("cart", maps);
		session.set("totalQuantity", cart.getCount());
		session.set("totalPrice", cart.getTotalPrice());
		return "redirect:" + request.getHeader("Referer");
	}

	@RequestMapping("/clear")
	public String clear(Model model) {
		cart.clear();
//		model.addAttribute("count", cart.getCount());
		return "user/cart";
	}

	@GetMapping("/checkout")
	public String checkout() {
		return "user/thankyou";
	}
}
