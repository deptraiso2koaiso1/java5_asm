package com.poly.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.entities.Brands;
import com.poly.entities.Categories;
import com.poly.entities.Products;
import com.poly.repositories.BrandsDAO;
import com.poly.repositories.CategoriesDAO;
import com.poly.repositories.ProductsDAO;
import com.poly.service.CartService;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	SessionService session;
	@Autowired
	HttpServletRequest request;
	@Autowired
	CartService cartService;

	@Autowired
	private ProductsDAO productDao;

	@Autowired
	private CategoriesDAO categoryDao;

	@Autowired
	private BrandsDAO brandDao;

//	@RequestMapping("/products")
//	public String getShopPage(@RequestParam(name = "category", required = false) Integer categoryId, Model model) {
//		List<Products> products;
//		if (categoryId == null) {
//			products = productDao.findAll();
//		} else {
//			products = productDao.findByCategoryId(categoryId);
//			// Lấy danh sách danh mục
//			List<Categories> categories = categoryDao.findAll();
//			model.addAttribute("categories", categories);
//
//			// Lấy danh sách thương hiệu
//			List<Brands> brands = brandDao.findAll();
//			model.addAttribute("brands", brands);
//
//		}
//		model.addAttribute("products", products);
//		return "user/shop";
//	}

	@RequestMapping
	public String home(Model model) {
//		 Lấy danh sách sản phẩm
//		List<Products> products = productDao.findAll();
//		model.addAttribute("products", products);
		List<Products> products = session.get("products");
		products = productDao.findAll();
		session.set("products", products);

		// Lấy danh sách danh mục
		List<Categories> categories = categoryDao.findAll();
		model.addAttribute("categories", categories);

		// Lấy danh sách thương hiệu
		List<Brands> brands = brandDao.findAll();
		model.addAttribute("brands", brands);

		model.addAttribute("count", cartService.getCount());
		return "user/shop";
	}

	@RequestMapping(value = "/detail/{productId}")
	public String productDetail(Model model, @PathVariable("productId") Integer productId) {
		Products product = productDao.findById(productId).orElse(null);
		if (product == null) {
			return "redirect:user/shop";
		}
		model.addAttribute("product", product);
		model.addAttribute("count", cartService.getCount());
		return "user/shop-single";
	}

	@RequestMapping("/sortAsc")
	public String asc(Model model) {
		List<Products> items = session.get("product");
		items = productDao.sortAsc();
		session.set("products", items);
		return "user/shop";
	}

	@RequestMapping("/sortDesc")
	public String desc(Model model) {
		List<Products> items = session.get("products");
		items = productDao.sortDesc();
		session.set("products", items);
		return "user/shop";
	}

	@RequestMapping("/sortAtoZ")
	public String AtoZ(Model model) {
		List<Products> items = session.get("products");
		items = productDao.sortByNameAtoZ();
		session.set("products", items);
		return "user/shop";
	}

	@RequestMapping("/sortZtoA")
	public String ZtoA(Model model) {
		List<Products> items = session.get("products");
		items = productDao.sortByNameZtoA();
		session.set("products", items);
		return "user/shop";
	}

	// findByCategory = clothes
	@RequestMapping("/cate1")
	public String findCategory(Model model) {
		List<Products> items = session.get("products");
		items = productDao.findCategory1();
		session.set("products", items);
		return "user/shop";
	}

	// findByCategory = footwear
	@RequestMapping("/cate2")
	public String findCategory2(Model model) {
		List<Products> items = session.get("products");
		items = productDao.findCategory2();
		session.set("products", items);
		return "user/shop";
	}

	// findByCategory = accessories
	@RequestMapping("/cate3")
	public String findCategory3(Model model) {
		List<Products> items = session.get("products");
		items = productDao.findCategory3();
		session.set("products", items);
		return "user/shop";
	}

}
