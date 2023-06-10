package com.poly.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.poly.entities.Products;
import com.poly.model.CartItem;
import com.poly.repositories.ProductsDAO;

@SessionScope
@Service
public class CartServiceImpl implements CartService {
	@Autowired
	ProductsDAO dao;

	HashMap<Integer, CartItem> maps = new HashMap<>();

	@Override
	public HashMap<Integer, CartItem> addProduct(int id) {
		CartItem cartItem = new CartItem();
		Products product = dao.getById(id);
		if (product != null && maps.containsKey(id)) {
			cartItem = maps.get(id);
			cartItem.setQuantity(cartItem.getQuantity() + 1);
			cartItem.setTotalPrice(cartItem.getQuantity() * cartItem.getProduct().getPrice());
		} else {
			cartItem.setProduct(product);
			cartItem.setQuantity(1);
			cartItem.setTotalPrice(product.getPrice());
		}
		maps.put(id, cartItem);
		return maps;
	}

	@Override
	public HashMap<Integer, CartItem> removeProduct(int id) {
		if (maps == null) {
			return maps;
		}
		if (maps.containsKey(id)) {
			maps.remove(id);
		}
		return maps;
	}

	@Override
	public HashMap<Integer, CartItem> editProduct(int id, int quantity) {
		if (maps == null) {
			return maps;
		}
		CartItem cartItem = new CartItem();
		if (maps.containsKey(id)) {
			cartItem = maps.get(id);
			cartItem.setQuantity(quantity);
			double totalPrice = quantity * cartItem.getProduct().getPrice();
			cartItem.setTotalPrice(totalPrice);
		}
		return maps;

	}

	@Override
	public void clear() {
		maps.clear();
	}

	@Override
	public Collection<CartItem> getProducts() {
		return maps.values();
	}

	@Override
	public int getCount() {
		int totalQuantity = 0;
		for (Map.Entry<Integer, CartItem> cartItem : maps.entrySet()) {
			totalQuantity += cartItem.getValue().getQuantity();
		}
//		return maps.values().size();
		return totalQuantity;
	}

	@Override
	public double getTotalPrice() {
		int totalPrice = 0;
		for (Map.Entry<Integer, CartItem> cartItem : maps.entrySet()) {
			totalPrice += cartItem.getValue().getTotalPrice();
		}
//		return maps.values().size();
		return totalPrice;
	}

}
