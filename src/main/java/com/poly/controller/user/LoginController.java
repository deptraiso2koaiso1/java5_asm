package com.poly.controller.user;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.service.CookieService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class LoginController {
	@Autowired
	HttpServletResponse response;
	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
//	@Autowired
//	UsersDAO dao;
	@Autowired
	HttpServletRequest request;

	@GetMapping("/login")
	public String index(Model model) {
//		String un = cookieService.getValue("username");
//		String pw = cookieService.getValue("password");
//		model.addAttribute("username", un);
//		model.addAttribute("password", pw);
		return "/user/login";
	}

	@PostMapping("/login")
	public String checkLogin(Model model, @RequestParam("username") String username,
			@RequestParam("password") String password) throws IOException {
//		System.out.println(username + password);
//		Users user = dao.findByUsername(username);
//		try {
//			if (user.getPassword().equals(password)) {
//				if (user.getIsAdmin() == true) {
//					request.setAttribute("message", "Login successful!");
//					response.sendRedirect("/admin");
//				} else {
//					response.sendRedirect("/shop");
//				}
//			}
//		} catch (Exception e) {
//			request.setAttribute("message", "Unexpected error, Please try again later!");
//		}

		return "/user/login";
	}
}
