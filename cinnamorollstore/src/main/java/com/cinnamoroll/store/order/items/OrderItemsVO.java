package com.cinnamoroll.store.order.items;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderItemsVO {
	int order_item_number;
	int order_number;
	int item_number;
	int item_price;
	int quantity;
	int delivery_price;
	
	String image;
	String name;
	String category;
	
	Date order_date;
	String payment_status;
	String order_status;
	String user_id;
	
	Date order_cancel_date;
	String order_cancel_status;
	
	int delivery_number;
	String delivery_company;
	
	int application_number;
	
	// 페이징 
	int start;
	int end;
	
	// 기간
	String period_start;
	String period_end;
}
