package com.poly.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import com.poly.Entity.Products;

@EnableJpaRepositories
@Repository
public interface OrdersDAO extends JpaRepository<Products, Integer> {

}