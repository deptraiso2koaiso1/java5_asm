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

import jakarta.servlet.http.HttpSession;

@SessionScope
@Service
public class CartServiceImpl implements CartService {
	@Autowired
	ProductsDAO dao;
	@Autowired
	SessionService session;
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
	private HashMap<Integer, CartItem> getCartItems() {
        HashMap<Integer, CartItem> cartItems = (HashMap<Integer, CartItem>) session.get("cart");
        if (cartItems == null) {
            cartItems = new HashMap<Integer, CartItem>();
        }
        return cartItems;
    }
	 @Override
	    public HashMap<Integer, CartItem> editProduct(int id, int quantity) {
	        HashMap<Integer, CartItem> cartItems = getCartItems();
	        CartItem cartItem = cartItems.get(id);
	        if (cartItem != null) {
	            cartItem.setQuantity(quantity);
	            cartItem.setTotalPrice(cartItem.getPrice() * quantity);
	        }
	        return cartItems;
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

//	@Override
//	public double getTotalPrice() {
//		int totalPrice = 0;
//		for (Map.Entry<Integer, CartItem> cartItem : maps.entrySet()) {
//			totalPrice += cartItem.getValue().getTotalPrice();
//		}
////		return maps.values().size();
//		return totalPrice;
//	}
	@Override
	public double getTotalPrice() {
	    double totalPrice = 0;
	    for (Map.Entry<Integer, CartItem> cartItem : maps.entrySet()) {
	        totalPrice += cartItem.getValue().getPrice() * cartItem.getValue().getQuantity();
	    }
	    return totalPrice;
	}
//	@Override
//	public HashMap<Integer, CartItem> updateProduct(int productId, int quantity) {
//	    HashMap<Integer, CartItem> cartItems = (HashMap<Integer, CartItem>) session.get("cart");
//	    if (cartItems != null && cartItems.containsKey(productId)){
//	        CartItem cartItem = cartItems.get(productId);
//	        cartItem.setQuantity(quantity);
//	        cartItem.setTotalPrice(cartItem.getProduct().getPrice() * quantity);
//	    }
//	    session.set("cart", cartItems);
//	    session.set("totalPrice", getTotalPrice());
//	    session.set("totalQuantity", getCount());
//	    return cartItems;
//	}
}
