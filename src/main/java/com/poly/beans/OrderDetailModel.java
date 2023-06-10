package com.poly.beans;

import com.poly.entities.Orders;
import com.poly.entities.Products;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class OrderDetailModel {
	
	private Products product;

	private Integer quantity;

	private String address;

	private Double amount;

	private String paymentMethod;
	
	private Orders order;
}
