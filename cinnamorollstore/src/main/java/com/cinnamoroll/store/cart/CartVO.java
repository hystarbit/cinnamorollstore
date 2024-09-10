package com.cinnamoroll.store.cart;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartVO {
	int cart_number;
	String user_id;
	int item_number;
	String image;
	String name;
	int sale_price;
	int quantity;
	int delivery_price;
}
