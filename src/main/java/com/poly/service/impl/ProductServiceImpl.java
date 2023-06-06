package com.poly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.entities.Categories;
import com.poly.entities.Products;
import com.poly.repositories.ProductsDAO;
import com.poly.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductsDAO dao;

	@Override
	public List<Products> getAllProducts() {
		return dao.findAll();
	}

	@Override
	public Products getProductById(Integer id) {
		return dao.findById(id).orElse(null);
	}

	@Override
	public List<Products> getProductsByCategory(Categories category) {
		return dao.findByCategory(category);
	}

	@Override
	public void addProduct(Products product) {
		dao.save(product);
	}

	@Override
	public void updateProduct(Products product) {
		Products oldProduct = dao.findById(product.getId()).orElse(null);
		if (oldProduct != null) {
			oldProduct.setName(product.getName());
			oldProduct.setImage(product.getImage());
			oldProduct.setDescription(product.getDescription());
			oldProduct.setPrice(product.getPrice());
			oldProduct.setBrand(product.getBrand());
			oldProduct.setCategory(product.getCategory());
			dao.save(oldProduct);
		}
	}

	@Override
	public void deleteProduct(Integer id) {
		dao.deleteById(id);
	}
	// Lấy danh sách sản phẩm theo categoryId
    @Override
    public List<Products> getProductsByCategoryId(Integer categoryId) {
        return dao.findByCategoryId(categoryId);
    }
    @Override
    public Products findById(Integer id) {
        return dao.findById(id).orElse(null);
    }
}