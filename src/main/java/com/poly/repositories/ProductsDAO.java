package com.poly.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import com.poly.entities.Categories;
import com.poly.entities.Products;

@EnableJpaRepositories
@Repository
public interface ProductsDAO extends JpaRepository<Products, Integer> {
    List<Products> findByCategory(Categories category);
    List<Products> findByCategoryId(Integer categoryId);
}

