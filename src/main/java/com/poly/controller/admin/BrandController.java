package com.poly.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.beans.BrandModel;
import com.poly.beans.CategoryModel;
import com.poly.entities.Brands;
import com.poly.entities.Categories;
import com.poly.repositories.BrandsDAO;
import com.poly.repositories.CategoriesDAO;

@Controller
public class BrandController {
	@Autowired
	BrandsDAO brandDao;

	// create
	@PostMapping("admin/brands/store")
	public String store(BrandModel model) {
		Brands brand = new Brands();
		brand.setName(model.getName());
		brand.setOrigin(model.getOrigin());
		brand.setWebsite(model.getWebsite());
		brandDao.save(brand);
		return "redirect:/admin/brands/index";
	}

	// read
	@GetMapping("admin/brands/index")
	public String index(Model model, @ModelAttribute("brand") Brands brand) {
		List<Brands> p = brandDao.findAll();
		model.addAttribute("data", p);
		return "admin/brands/brand";
	}

	// update
	@PostMapping("admin/brands/update/{id}")
	public String update(@PathVariable("id") Brands brand, @ModelAttribute("category") BrandModel model) {
		brand.setOrigin(model.getOrigin());
		brand.setName(model.getName());
		brand.setWebsite(model.getWebsite());
		brandDao.save(brand);
		return "redirect:/admin/brands/index";
	}

	// delete
	@GetMapping("admin/brands/delete/{id}")
	public String delete(@PathVariable("id") Brands brand) {
		brandDao.delete(brand);
		return "redirect:/admin/brands/index";
	}
}
