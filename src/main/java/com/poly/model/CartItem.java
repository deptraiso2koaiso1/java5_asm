package com.poly.model;

import com.poly.entities.Products;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {
	private Products product;
	private Integer quantity;
	private Double totalPrice;
}
