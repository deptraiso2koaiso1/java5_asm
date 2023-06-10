package com.poly.beans;

import com.poly.entities.Brands;
import com.poly.entities.Categories;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductModel {
	private String name;
	private String image;
	private String description;
	private Double price;
	private Brands brand;
	private Categories category;
}
