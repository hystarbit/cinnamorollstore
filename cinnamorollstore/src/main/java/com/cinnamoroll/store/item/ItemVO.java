package com.cinnamoroll.store.item;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ItemVO {
	int item_number;
	Date regdate;
	String category;
	String name;
	int sale_price;
	int original_price;
	int delivery_price;
	String image;
	String exposure;
	String seller_id;
	
	// 파일 업로드
	private MultipartFile uploadFile;
}
