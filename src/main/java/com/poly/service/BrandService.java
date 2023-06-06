package com.poly.service;

import java.util.List;

import com.poly.entities.Brands;

public interface BrandService {
	List<Brands> getAllBrands();
	Brands getBrandById(Integer id);
	void addBrand(Brands brand);
	void updateBrand(Brands brand);
	void deleteBrand(Integer id);
}
