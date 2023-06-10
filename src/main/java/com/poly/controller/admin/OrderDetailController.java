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

import com.poly.beans.OrderDetailModel;
import com.poly.entities.OrderDetails;
import com.poly.entities.Orders;
import com.poly.entities.Products;
import com.poly.repositories.OrderDetailsDAO;
import com.poly.repositories.OrdersDAO;
import com.poly.repositories.ProductsDAO;


@Controller
public class OrderDetailController {
	@Autowired
	private OrderDetailsDAO odetailDao;
	@Autowired
	private OrdersDAO oderDao;
	@Autowired
	private ProductsDAO productDao;

	// create
	@PostMapping("admin/order-details/store")
	public String store(OrderDetailModel model) {
		OrderDetails odetail = new OrderDetails();
		odetail.setOrder(model.getOrder());
		odetail.setAddress(model.getAddress());
		odetail.setProduct(model.getProduct());
		odetail.setQuantity(model.getQuantity());
		odetail.setPaymentMethod(model.getPaymentMethod());
		odetail.setAmount(model.getAmount());
		odetailDao.save(odetail);
		return "redirect:/admin/order-details/index";
	}

	// read
	@GetMapping("admin/order-details/index")
	public String index(Model model, @ModelAttribute("order-detail") OrderDetailModel odetail) {
		List<OrderDetails> o = odetailDao.findAll();
		List<Orders> listOrder = oderDao.findAll();
		List<Products> listProduct = productDao.findAll();
		model.addAttribute("listOrder", listOrder);
		model.addAttribute("listProduct", listProduct);
		model.addAttribute("data", o);
		return "admin/order-details/order-detail";
	}

	// update
	@PostMapping("admin/order-details/update/{id}")
	public String update(@PathVariable("id") OrderDetails odetail,
			@ModelAttribute("order-detail") OrderDetailModel model) {
		odetail.setOrder(model.getOrder());
		odetail.setAddress(model.getAddress());
		odetail.setProduct(model.getProduct());
		odetail.setQuantity(model.getQuantity());
		odetail.setPaymentMethod(model.getPaymentMethod());
		odetail.setAmount(model.getAmount());
		this.odetailDao.save(odetail);
		return "redirect:/admin/orders/index";
	}

	// delete
	@GetMapping("admin/order-details/delete/{id}")
	public String delete(@PathVariable("id") OrderDetails odetail) {
		odetailDao.delete(odetail);
		return "redirect:/admin/order-details/index";
	}
}
