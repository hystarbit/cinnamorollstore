package com.cinnamoroll.store.user;
import java.sql.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {
	String user_id;
	Date regdate;
	String name;
	String password;
	String grade;
	String email;
	String phone;
	String address;
	
	int total_order_price;
	
	// 페이징 
	int start;
	int end;
	
	// 키워드 검색
	String searchField;
	String searchWord;
}
