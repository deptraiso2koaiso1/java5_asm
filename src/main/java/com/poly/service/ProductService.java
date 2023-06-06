package com.poly.service;

import java.util.List;

import com.poly.entities.Categories;
import com.poly.entities.Products;

public interface ProductService {
	List<Products> getAllProducts();
	List<Products> getProductsByCategory(Categories category);
	Products getProductById(Integer id);
	void addProduct(Products product);
	void updateProduct(Products product);
	void deleteProduct(Integer id);	
	List<Products> getProductsByCategoryId(Integer categoryId);
	Products findById(Integer id);
}
