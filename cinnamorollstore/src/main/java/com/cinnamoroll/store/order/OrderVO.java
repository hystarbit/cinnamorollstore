package com.cinnamoroll.store.order;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVO {
	int order_number;
	String order_type;
	Date order_date;
	String user_id;
	int order_price;
	String payment_status;
	String order_status;
	String payment_type;
	String order_address;
	
	int order_items_count;
	String order_items_name;
	
	String user_name;
	String phone;
	
	Date order_cancel_date;
	String order_cancel_status;
	
	int delivery_number;
	String delivery_company;
	
	// 페이징 
	int start;
	int end;
	
	// 기간 검색
	String period_start;
	String period_end;
	
	// 키워드 검색 
	String searchField;
	String searchWord;
}
