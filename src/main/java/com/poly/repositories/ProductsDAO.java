package com.poly.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import com.poly.entities.Categories;
import com.poly.entities.Products;


@EnableJpaRepositories
@Repository
public interface ProductsDAO extends JpaRepository<Products, Integer> {
	List<Products> findByCategory(Categories category);

	List<Products> findByPriceBetween(double minPrice, double maxPrice);
	Page<Products> findAllByNameContaining(String name, Pageable pageable);
//	@Query(value = "SELECT * FROM products WHERE Category_Id = 1", nativeQuery = true)
//	List<Products> findCategory1();
//
//	@Query(value = "SELECT * FROM products WHERE Category_Id = 2", nativeQuery = true)
//	List<Products> findCategory2();
//
//	@Query(value = "SELECT * FROM products WHERE Category_Id = 3", nativeQuery = true)
//	List<Products> findCategory3();
//
//	// sort increase
//	@Query(value = "SELECT * FROM products ORDER BY price ASC", nativeQuery = true)
//	List<Products> sortAsc();
//
//	// sort decrease
//	@Query(value = "SELECT * FROM products ORDER BY price DESC", nativeQuery = true)
//	List<Products> sortDesc();
//
//	// sort a-z
//	@Query(value = "SELECT * FROM products ORDER BY name ASC;", nativeQuery = true)
//	List<Products> sortByNameAtoZ();
//
//	// sort z-a
//	@Query(value = "SELECT * FROM products ORDER BY name DESC;", nativeQuery = true)
//	List<Products> sortByNameZtoA();


}
