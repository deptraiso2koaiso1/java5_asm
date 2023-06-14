package com.poly.controller.admin;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.poly.entities.Products;
import com.poly.repositories.ProductsDAO;

import com.poly.service.ExcelProductGenerator;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ExcelController {

	@Autowired
	private ProductsDAO proRepo;


	
	@GetMapping("/admin/product/excel")
	public void exportProductIntoExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=products_" + currentDateTime + ".xlsx";
		response.setCharacterEncoding("UTF-8");

		response.setHeader(headerKey, headerValue);

		List<Products> listOfProducts = proRepo.findAll();

		ExcelProductGenerator generator = new ExcelProductGenerator(listOfProducts);

		generator.generate(response);
	}

}
