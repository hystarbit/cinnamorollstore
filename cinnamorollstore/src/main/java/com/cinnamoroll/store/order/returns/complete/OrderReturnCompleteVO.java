package com.cinnamoroll.store.order.returns.complete;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderReturnCompleteVO {
	int application_number;
	Date complete_date;
}
