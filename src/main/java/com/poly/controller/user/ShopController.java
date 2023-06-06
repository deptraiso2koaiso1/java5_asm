package com.poly.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.ModelAndView;



import com.poly.entities.Brands;
import com.poly.entities.Categories;
import com.poly.entities.Products;
import com.poly.service.BrandService;
import com.poly.service.CategoryService;
import com.poly.service.ProductService;

@Controller
@RequestMapping("/user/shop")
public class ShopController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private BrandService brandService;


    @GetMapping("/products")
    public String getShopPage(@RequestParam(name = "category", required = false) Integer categoryId, Model model) {
        List<Products> products;
        if (categoryId == null) {
            products = productService.getAllProducts();
        } else {
            products = productService.getProductsByCategoryId(categoryId);
        }
        model.addAttribute("products", products);
        return "user/shop";
    }

    @GetMapping
	public String home(Model model) {
		// Lấy danh sách sản phẩm
		List<Products> products = productService.getAllProducts();
		model.addAttribute("products", products);

		// Lấy danh sách danh mục
		List<Categories> categories = categoryService.getAllCategories();
		model.addAttribute("categories", categories);

		// Lấy danh sách thương hiệu
		List<Brands> brands = brandService.getAllBrands();
		model.addAttribute("brands", brands);

		return "user/shop";
	}
    
    @GetMapping("/user/shop-single/{id}")
    public String showProduct(@PathVariable Integer id, Model model) {
        // Lấy thông tin sản phẩm theo ID
        Products product = productService.findById(id);

        // Kiểm tra sản phẩm có tồn tại không
        if (product == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Product not found");
        }

        // Truyền sản phẩm vào Model để hiển thị trang chi tiết
        model.addAttribute("product", product);

        // Trả về view tương ứng
        return "user/shop-single";
    }


}

