package com.poly.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import com.poly.entities.Products;



@EnableJpaRepositories
@Repository
public interface CustomersDAO extends JpaRepository<Products, Integer> {

}