package com.poly.controller.user;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;




import com.poly.entities.Brands;
import com.poly.entities.Categories;
import com.poly.entities.Products;
import com.poly.repositories.BrandsDAO;
import com.poly.repositories.CategoriesDAO;
import com.poly.repositories.ProductsDAO;


@Controller
@RequestMapping("/user/shop")
public class ShopController {

	@Autowired
	private ProductsDAO productDao;
	
	@Autowired
	private CategoriesDAO categoryDao;

	
	@Autowired
	private BrandsDAO brandDao;

	  @GetMapping("/products")
	  public String getShopPage(@RequestParam(name = "category", required = false) Integer categoryId, Model model) {
	      List<Products> products;
	      if (categoryId == null) {
	          products = productDao.findAll();
	      } else {
	          products = productDao.findByCategoryId(categoryId);
	  		// Lấy danh sách danh mục
	  		List<Categories> categories = categoryDao.findAll();
	  		model.addAttribute("categories", categories);

	  		// Lấy danh sách thương hiệu
	  		List<Brands> brands = brandDao.findAll();
	  		model.addAttribute("brands", brands);
	      }
	      model.addAttribute("products", products);
	      return "user/shop";
	  }
    @GetMapping
	public String home(Model model) {
		// Lấy danh sách sản phẩm
		List<Products> products = productDao.findAll();
		model.addAttribute("products", products);
			
		// Lấy danh sách danh mục
		List<Categories> categories = categoryDao.findAll();
		model.addAttribute("categories", categories);

		// Lấy danh sách thương hiệu
		List<Brands> brands = brandDao.findAll();
		model.addAttribute("brands", brands);
		
		return "user/shop";
	}
    
    @GetMapping(value = "/detail/{productId}")
    public String productDetail(Model model, @PathVariable("productId") Integer productId) {
        // Lấy danh sách top 5 sản phẩm theo giá
	    	List<Products> products = productDao.findAll(Sort.by(Sort.Direction.DESC, "price")).subList(0, 5);
	        model.addAttribute("products", products);
    	Products product = productDao.findById(productId).orElse(null);

        if (product == null) {
            return "redirect:user/shop";
        }

        model.addAttribute("product", product);

        return "user/shop-single";
    }
    

}

