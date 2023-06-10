package com.poly.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.poly.entities.OrderDetails;
import com.poly.repositories.OrderDetailsDAO;
import com.poly.repositories.OrdersDAO;
import com.poly.repositories.ProductsDAO;
import com.poly.repositories.UsersDAO;


@Controller
public class AdminController {
	@Autowired
	private ProductsDAO productDao;
	@Autowired
	private OrderDetailsDAO odetailDao;
	@Autowired
	private OrdersDAO orderDao;
	@Autowired
	private UsersDAO accDao;

//	@PreAuthorize("hasAuthority('1')")
	@GetMapping("admin")
	public String admin(Model model) {
		long totalAcc = accDao.count();
		long totalPro = productDao.count();
		long totalOrder = orderDao.count();
		long totalPayment = 0;
		List<OrderDetails> odetail = odetailDao.findAll();
		for (OrderDetails orderDetail : odetail) {
			totalPayment += orderDetail.getAmount() * orderDetail.getQuantity();
		}
		model.addAttribute("totalAcc", totalAcc);
		model.addAttribute("totalPro", totalPro);
		model.addAttribute("totalOrder", totalOrder);
		model.addAttribute("totalPayment", totalPayment);
		return "admin/admin";
	}
}
