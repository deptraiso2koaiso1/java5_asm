package com.poly.controller.user;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
//		}
//		model.addAttribute("products", products);
//		return "user/shop";
//	}

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
////
//	@RequestMapping("/sortAsc")
//	public String asc(Model model) {
//		List<Products> items = session.get("product");
//		items = productDao.sortAsc();
//		session.set("products", items);
//		return "user/shop";
//	}
//
//	@RequestMapping("/sortDesc")
//	public String desc(Model model) {
//		List<Products> items = session.get("products");
//		items = productDao.sortDesc();
//		session.set("products", items);
//		return "user/shop";
//	}
//
//	@RequestMapping("/sortAtoZ")
//	public String AtoZ(Model model) {
//		List<Products> items = session.get("products");
//		items = productDao.sortByNameAtoZ();
//		session.set("products", items);
//		return "user/shop";
//	}
//
//	@RequestMapping("/sortZtoA")
//	public String ZtoA(Model model) {
//		List<Products> items = session.get("products");
//		items = productDao.sortByNameZtoA();
//		session.set("products", items);
//		return "user/shop";
//	}
//
//	// findByCategory = clothes
//	@RequestMapping("/cate1")
//	public String findCategory(Model model) {
//		List<Products> items = session.get("products");
//		items = productDao.findCategory1();
//		session.set("products", items);
//		return "user/shop";
//	}
//
//	// findByCategory = footwear
//	@RequestMapping("/cate2")
//	public String findCategory2(Model model) {
//		List<Products> items = session.get("products");
//		items = productDao.findCategory2();
//		session.set("products", items);
//		return "user/shop";
//	}
//
//	// findByCategory = accessories
//	@RequestMapping("/cate3")
//	public String findCategory3(Model model) {
//		List<Products> items = session.get("products");
//		items = productDao.findCategory3();
//		session.set("products", items);
//		return "user/shop";
//	}

	@RequestMapping
	public String home(Model model, 
	                   @RequestParam(name = "page", defaultValue = "0") int page,
	                   @RequestParam(name = "size", defaultValue = "6") int size,
	                   @RequestParam(name = "sortType", defaultValue = "name") String sortType,
	                   @RequestParam(name = "sortDir", defaultValue = "asc") String sortDir,
	                   @RequestParam(name = "searchTerm", required = false) String searchTerm,
	                   @RequestParam(name = "category", required = false) Integer category) { 
	    model.addAttribute("page", page);
	    model.addAttribute("sortType", sortType);
	    model.addAttribute("sortDir", sortDir);

	    // Thiết lập tiêu chí sắp xếp
	    Sort sort;
	    if (sortType.equalsIgnoreCase("name")) {
	        sort = Sort.by("name");
	    } else {
	        sort = Sort.by("price");
	    }
	    if (sortDir.equalsIgnoreCase("desc")) {
	        sort = sort.descending();
	    } else {
	        sort = sort.ascending();
	    }

	    // Tạo phân trang và lấy danh sách sản phẩm
	    Pageable pageable = PageRequest.of(page, size, sort);
	    Page<Products> products;

	    if (searchTerm != null && !searchTerm.isEmpty()) {
	        products = productDao.findByNameContainingOrDescriptionContaining(searchTerm, searchTerm, pageable);
	    } else if (category != null) {
	        Categories selectedCategory = categoryDao.getOne(category);
	        products = productDao.findByCategory(selectedCategory, pageable); 
	    } else {
	        products = productDao.findAll(pageable);
	    }
	    // Truyền các thông tin cần thiết vào Model
	    model.addAttribute("products", products);
	    model.addAttribute("categories", categoryDao.findAll());
	    model.addAttribute("brands", brandDao.findAll());
	    model.addAttribute("count", cartService.getCount());

	    return "user/shop";
	}

}
