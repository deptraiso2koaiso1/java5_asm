package com.poly.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Users")
public class Users {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotBlank(message = "Field name not be empty!")
	private String name;

	@NotBlank(message = "Field address not be empty!")
	private String address;

	@NotBlank(message = "Field phone not be empty!")
	private String phone;

	@Email
	@NotBlank(message = "Field email not be empty!")
	private String email;

	@NotBlank(message = "Field username not be empty!")
	private String username;

	@NotBlank(message = "Field password not be empty!")
	private String password;

	private Boolean is_admin;
}
