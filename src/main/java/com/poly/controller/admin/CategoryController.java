package com.poly.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.beans.CategoryModel;
import com.poly.entities.Categories;
import com.poly.repositories.CategoriesDAO;

@Controller
public class CategoryController {
	@Autowired
	CategoriesDAO cateDao;

	// create
	@PostMapping("admin/categories/store")
	public String store(CategoryModel model) {
		Categories cate = new Categories();
		cate.setDescription(model.getDescription());
		cate.setName(model.getName());
		cateDao.save(cate);
		return "redirect:/admin/categories/index";
	}

	// read
	@GetMapping("admin/categories/index")
	public String index(Model model, @ModelAttribute("category") CategoryModel categories) {
		List<Categories> p = cateDao.findAll();
		model.addAttribute("data", p);
		return "admin/categories/category";
	}

	// update
	@PostMapping("admin/categories/update/{id}")
	public String update(@PathVariable("id") Categories cate, @ModelAttribute("category") CategoryModel model) {
		cate.setDescription(model.getDescription());
		cate.setName(model.getName());
		cateDao.save(cate);
		return "redirect:/admin/categories/index";
	}

	// delete
	@GetMapping("admin/categories/delete/{id}")
	public String delete(@PathVariable("id") Categories categories) {
		cateDao.delete(categories);
		return "redirect:/admin/categories/index";
	}
}
