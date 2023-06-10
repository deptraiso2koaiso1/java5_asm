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


import com.poly.beans.ProductModel;
import com.poly.entities.Brands;
import com.poly.entities.Categories;
import com.poly.entities.Products;
import com.poly.repositories.BrandsDAO;
import com.poly.repositories.CategoriesDAO;
import com.poly.repositories.ProductsDAO;

@Controller
public class ProductController {
	@Autowired
	ProductsDAO productDao;
	@Autowired
	CategoriesDAO cateDao;
	@Autowired
	BrandsDAO brandDao;

	@GetMapping("/admin/products/index")
	public String product(Model model, @ModelAttribute("product") ProductModel product) {
		List<Products> p = productDao.findAll();
		List<Categories> cate = cateDao.findAll();
		List<Brands> brand = brandDao.findAll();
		model.addAttribute("listBrand", brand);
		model.addAttribute("listCate", cate);
		model.addAttribute("products", p);
		return "admin/products/product";
	}

	// create
	@PostMapping("admin/products/store")
	public String store(ProductModel model) {
		Products pro = new Products();
		pro.setName(model.getName());
		pro.setPrice(model.getPrice());
		pro.setBrand(model.getBrand());
		pro.setImage(model.getImage());
		pro.setDescription(model.getDescription());
		pro.setCategory(model.getCategory());
		productDao.save(pro);
		return "redirect:/admin/products/index";
	}
	// update
		@PostMapping("admin/products/update/{id}")
		public String update(@PathVariable("id") Products pro, @ModelAttribute("product") ProductModel product) {
			pro.setBrand(product.getBrand());
			pro.setImage(product.getImage());
			pro.setDescription(product.getDescription());
			pro.setName(product.getName());
			pro.setPrice(product.getPrice());
			pro.setCategory(product.getCategory());
			productDao.save(pro);
			return "redirect:/admin/products/index";
		}
		
		// delete
		@GetMapping("admin/products/delete/{id}")
		public String delete(@PathVariable("id") Products product) {
			productDao.delete(product);
			return "redirect:/admin/products/index";
		}
}
