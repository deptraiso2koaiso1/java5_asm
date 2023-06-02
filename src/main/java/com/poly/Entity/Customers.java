package com.poly.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Customers")
public class Customers {

	@Id
	private Integer id;
	private String name;
	private String address;
	private String phone;
	private String email;
}
