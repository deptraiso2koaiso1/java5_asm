package com.poly.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductModel {
	private String name;
	private String description;
	private double price;
	private String image;
	private int quantity;
}
