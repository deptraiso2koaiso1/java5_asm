package com.poly.controller.admin;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import com.poly.beans.AccountModel;
import com.poly.entities.Users;
import com.poly.repositories.UsersDAO;

@Controller
public class AccountController {

	@Autowired
	private UsersDAO accountDao;

	// create
		@PostMapping("admin/accounts/store")
		public String store(@Validated @ModelAttribute("account") AccountModel model, BindingResult result, Model models) {
			List<Users> p = accountDao.findAll();
			models.addAttribute("data", p);
			if (result.hasErrors()) {
				Map<String, String> errors = result.getFieldErrors().stream()
						.collect(Collectors.toMap(FieldError::getField, FieldError::getDefaultMessage));
				return "admin/accounts/account";
			} else {
				Users acc = new Users();
				acc.setName(model.getName());
				acc.setEmail(model.getEmail());
				acc.setPassword(model.getPassword());
				acc.setUsername(model.getUsername());
				acc.setPhone(model.getPhone());
				acc.setAddress(model.getAddress());
				acc.setIs_admin(model.getIs_admin());
				accountDao.save(acc);
				return "redirect:/admin/accounts/index";
			}
		}

	// read
	@GetMapping("admin/accounts/index")
	public String index(Model model,
			@ModelAttribute("account") AccountModel account) {

		List<Users> p = accountDao.findAll();
		model.addAttribute("data", p);
		return "admin/accounts/account";
	}

	// update
	@PostMapping("admin/accounts/update/{id}")
	public String update(@PathVariable("id") Users acc, @ModelAttribute("account") AccountModel model) {
		acc.setName(model.getName());
		acc.setEmail(model.getEmail());
		acc.setPassword(model.getPassword());
		acc.setUsername(model.getUsername());
		acc.setAddress(model.getAddress());
		acc.setPhone(model.getPhone());
		acc.setIs_admin(model.getIs_admin());
		accountDao.save(acc);
		return "redirect:/admin/accounts/index";
	}

	// delete
	@GetMapping("admin/accounts/delete/{id}")
	public String delete(@PathVariable("id") Users account) {
		this.accountDao.delete(account);
		return "redirect:/admin/accounts/index";
	}
}
