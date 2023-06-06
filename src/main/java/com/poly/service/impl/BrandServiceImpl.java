package com.poly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.entities.Brands;
import com.poly.repositories.BrandsDAO;
import com.poly.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService {
	
	@Autowired
	private BrandsDAO dao;

	@Override
	public List<Brands> getAllBrands() {
		return dao.findAll();
	}

	@Override
	public Brands getBrandById(Integer id) {
		return dao.findById(id).orElse(null);
	}

	@Override
	public void addBrand(Brands brand) {
		dao.save(brand);
	}

	@Override
	public void updateBrand(Brands brand) {
		Brands oldBrand = dao.findById(brand.getId()).orElse(null);
		if (oldBrand != null) {
			oldBrand.setName(brand.getName());
			oldBrand.setOrigin(brand.getOrigin());
			oldBrand.setWebsite(brand.getWebsite());
			dao.save(oldBrand);
		}
	}

	@Override
	public void deleteBrand(Integer id) {
		dao.deleteById(id);
	}
}