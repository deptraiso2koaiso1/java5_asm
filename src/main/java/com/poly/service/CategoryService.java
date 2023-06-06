package com.poly.service;

import java.util.List;

import com.poly.entities.Categories;

public interface CategoryService {
	List<Categories> getAllCategories();
	Categories getCategoryById(Integer id);
	void addCategory(Categories category);
	void updateCategory(Categories category);
	void deleteCategory(Integer id);
}
