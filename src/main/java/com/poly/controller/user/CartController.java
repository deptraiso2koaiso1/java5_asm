package com.poly.controller.user;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.entities.Customers;
import com.poly.entities.Users;
import com.poly.model.CartItem;
import com.poly.repositories.CustomersDAO;
import com.poly.repositories.ProductsDAO;
import com.poly.service.CartService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;

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
	CustomersDAO customersDAO;

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

//	@RequestMapping("/update/{id}")
//	public String update(@PathVariable int id, Model model) {
//		HashMap<Integer, CartItem> maps = (HashMap<Integer, CartItem>) session.get("cart");
//		if (maps == null) {
//			maps = new HashMap<Integer, CartItem>();
//		}
//		maps = cart.editProduct(id, param.getInt("quantity", 0));
//		session.set("cart", maps);
//		session.set("totalQuantity", cart.getCount());
//		session.set("totalPrice", cart.getTotalPrice());
//		return "user/cart";
//	}

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

	@GetMapping("/getCustomer")
	public String showCustomerForm(Model model) {
		Users user = session.get("user");
		if (user == null) {
			model.addAttribute("message", "Please login before checkout!");
			return "user/login";
		}
		Customers customers = new Customers();
		model.addAttribute("customers", customers);
		return "user/getCustomer";
	}

	@RequestMapping("/getCustomer")
	public String saveCustomer(@Valid @ModelAttribute(name = "customers") Customers customers, BindingResult result,
			Model model, HttpServletResponse response) throws IOException {
		if (result.hasErrors()) {
			return "user/getCustomer";
		} else {
			customersDAO.save(customers);
			model.addAttribute("customer", customers);
			try {
				Email email = new SimpleEmail();
				email.setHostName("smtp.gmail.com");
				email.setSmtpPort(587);
				email.setAuthenticator(new DefaultAuthenticator("hodanhnhan1166@gmail.com", "dwhmxteywggoukiz"));
				email.setSSLOnConnect(true);
				email.setFrom("hodanhnhan1166@gmail.com");
				email.setSubject("Order Confirmation");
				email.setMsg(
						"Thank you for your order!\n\nYour order has been successfully processed and will be shipped soon.\n\nThank you,\nThe Shoes Shop Team");
				email.addTo(customers.getEmail());
				email.send();
			} catch (EmailException e) {
				System.out.println("Error sending email: " + e.getMessage());
			}
			cart.clear();
			return "user/thankyou";
		}
	}
}
