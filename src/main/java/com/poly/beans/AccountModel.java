package com.poly.beans;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AccountModel {
	private String name;

	private String address;

	private String phone;

	private String email;

	private String username;

	private String password;

	private Boolean is_admin;
}
