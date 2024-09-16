package com.cinnamoroll.store.order.returns;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderReturnVO {
	int application_number;
	Date application_date;
	int order_item_number;
	String return_type;
	String order_return_status;
	String select_reason;
	String content;
	String processing_memo;
	int delivery_price;
	String payment_type;
	
	String item_number;
	String item_name;
	
	String order_address;
	
	String user_id;
	String user_name;
	String phone;
	
	Date complete_date;
	
	// 페이징 
	int start;
	int end;
}
