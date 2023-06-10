package com.poly.beans;

import java.util.Date;

import com.poly.entities.Customers;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class OrderModel {
	private Integer id;

	private Customers customer;

	private Date date;

	private Integer status;
}
