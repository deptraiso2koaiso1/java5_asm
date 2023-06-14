package com.poly.controller.user;

import java.io.IOException;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.entities.Users;
import com.poly.repositories.UsersDAO;
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
	@Autowired
	UsersDAO dao;
	@Autowired
	HttpServletRequest request;

	@GetMapping("/login")
	public String index(Model model) {
		String un = cookieService.getValue("username");
		String pw = cookieService.getValue("password");
		model.addAttribute("username", un);
		model.addAttribute("password", pw);
		return "user/login";
	}

	@PostMapping("/login")
	public String checkLogin(Model model, @RequestParam(name = "remember", required = false) String remember,
			@RequestParam("username") String username, @RequestParam("password") String password) throws IOException {
		Users user = sessionService.get("user");
		user = dao.findByUsername(username);
		try {
			if (user != null) {
				if (user.getPassword().equals(password)) {
					if (user.getIs_admin() == true) {
						if (remember == null) {
							cookieService.add("username", username, 24 * 15);
							cookieService.add("password", password, 24 * 15);
						}
						response.sendRedirect("/admin");
					} else {
						if (remember == null) {
							cookieService.add("username", username, 24 * 15);
							cookieService.add("password", password, 24 * 15);
						}
						response.sendRedirect("/home");
					}
					sessionService.set("user", user);
				} else {
					model.addAttribute("message", "Wrong username or password!");
				}
			} else {
				model.addAttribute("message", "Wrong username or password!");
			}

		} catch (Exception e) {
			model.addAttribute("message", "Unexpected error, Please try again later!");
		}

		return "user/login";
	}

	@RequestMapping("/logout")
	public String logout(Model model) {
		sessionService.remove("user");
		return "user/login";
	}

	@GetMapping("/signup")
	public String signup(Model model) {
		model.addAttribute("user", new Users());
		return "user/signup";
	}

	@PostMapping("/signup")
	public String signup2(@ModelAttribute("user") @Validated Users user, BindingResult result, Model model,
			@RequestParam("confirm") String confirm) {
		if (result.hasErrors()) {
			model.addAttribute("message", "Please complete form!");
		} else {
			try {
				if (dao.findByUsername(user.getUsername()) != null) {
					model.addAttribute("message", "Username is not valid or already exists!");
				} else if (dao.findByEmail(user.getEmail()) != null) {
					model.addAttribute("message", "Email is not valid or already exists!");
				} else if (!user.getPassword().equalsIgnoreCase(confirm)) {
					model.addAttribute("message", "Confirm password does not match!");
				} else {
					user.setIs_admin(false);
					dao.save(user);
					sessionService.set("user", user);
					try {
						Email email = new SimpleEmail();
						email.setHostName("smtp.gmail.com");
						email.setSmtpPort(587);
						email.setAuthenticator(
								new DefaultAuthenticator("hodanhnhan1166@gmail.com", "dwhmxteywggoukiz"));
						email.setSSLOnConnect(true);
						email.setFrom("hodanhnhan1166@gmail.com");
						email.setSubject("Sign in successfully!");
						email.setMsg(
								"Shoes shop team alert!\n\nYour account has been created.\n\nThank you,\nThe Shoes Shop Team");
						email.addTo(user.getEmail());
						email.send();
					} catch (EmailException e) {
						System.out.println("Error sending email: " + e.getMessage());
					}
					return "redirect:/home";
				}
			} catch (Exception e) {
				model.addAttribute("message", "An error occurred while registering the user!");
				return "user/signup";
			}
		}
		return "user/signup";
	}
}
