package com.poly.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import com.poly.entities.Users;

@EnableJpaRepositories
@Repository
public interface UsersDAO extends JpaRepository<Users, Integer> {
	Users findByUsername(String username);

	Users findByEmail(String email);
}
