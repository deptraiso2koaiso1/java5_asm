package com.poly.service;

import java.util.Collection;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.poly.model.CartItem;

@Service
public interface CartService {
	public HashMap<Integer, CartItem> addProduct(int id);

	public HashMap<Integer, CartItem> removeProduct(int id);

	public HashMap<Integer, CartItem> editProduct(int id, int quantity);
	
//	public HashMap<Integer, CartItem> updateProduct(int productId, int quantity);
	void clear();

	int getCount();

	Collection<CartItem> getProducts();

	double getTotalPrice();
}
