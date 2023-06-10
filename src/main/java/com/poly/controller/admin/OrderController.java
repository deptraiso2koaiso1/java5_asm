package com.poly.controller.admin;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import com.poly.beans.OrderModel;
import com.poly.entities.Customers;
import com.poly.entities.Orders;
import com.poly.repositories.CustomersDAO;
import com.poly.repositories.OrdersDAO;
import com.poly.repositories.UsersDAO;



@Controller
public class OrderController {

	@Autowired
	private OrdersDAO orderDao;
	@Autowired
	private CustomersDAO cusDao;

	// create
	@PostMapping("admin/orders/store")
	public String store(OrderModel model) {
	    Orders od = new Orders();
	    od.setCustomer(model.getCustomer());
	    od.setDate(new Date());
	    od.setStatus(model.getStatus());
	    orderDao.save(od);
	    return "redirect:/admin/orders/index";
	}

	// read
	@GetMapping("admin/orders/index")
	public String index(Model model,  @ModelAttribute("order") OrderModel order) {
		
		List<Orders> o = orderDao.findAll();
		List<Customers> listAcc = cusDao.findAll();
		model.addAttribute("listAcc", listAcc);
		model.addAttribute("data", o);
		return "admin/orders/order";
	}

	// update
	@PostMapping("admin/orders/update/{id}")
	public String update(@PathVariable("id") Orders od, @ModelAttribute("order") OrderModel order) {
	    od.setCustomer(order.getCustomer());
	    od.setDate(new Date());
	    od.setStatus(order.getStatus());
	    orderDao.save(od);
	    return "redirect:/admin/orders/index";
	}

	// delete
	@GetMapping("admin/orders/delete/{id}")
	public String delete(@PathVariable("id") Orders od) {
		orderDao.delete(od);
		return "redirect:/admin/orders/index";
	}
}
