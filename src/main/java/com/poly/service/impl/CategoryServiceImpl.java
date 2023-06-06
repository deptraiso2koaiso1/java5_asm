package com.poly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.entities.Categories;
import com.poly.repositories.CategoriesDAO;
import com.poly.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	private CategoriesDAO dao;

	@Override
	public List<Categories> getAllCategories() {
		return dao.findAll();
	}

	@Override
	public Categories getCategoryById(Integer id) {
		return dao.findById(id).orElse(null);
	}

	@Override
	public void addCategory(Categories category) {
		dao.save(category);
	}

	@Override
	public void updateCategory(Categories category) {
		Categories oldCategory = dao.findById(category.getId()).orElse(null);
		if (oldCategory != null) {
			oldCategory.setName(category.getName());
			oldCategory.setDescription(category.getDescription());
			dao.save(oldCategory);
		}
	}

	@Override
	public void deleteCategory(Integer id) {
		dao.deleteById(id);
	}
}

