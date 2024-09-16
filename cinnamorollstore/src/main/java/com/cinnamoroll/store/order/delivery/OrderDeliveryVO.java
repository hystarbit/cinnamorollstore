package com.cinnamoroll.store.order.delivery;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDeliveryVO {
	int delivery_number;
	int order_number;
	String delivery_company;
	
	int delivery_count;
}
