package com.cinnamoroll.store.order.returns;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderReturnCompleteVO {
	int applicaiton_number;
	Date complete_date;
}
