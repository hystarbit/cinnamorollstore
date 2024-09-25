package com.cinnamoroll.store.board;

//import java.sql.Date;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	int board_number;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	Date postdate;
	
	String user_id;
	String title;
	String content;
	String visitcount;
	
	//회원 정보
	String user_name;

	// 페이징
	int start;
	int end;

	// 키워드 검색
	String searchField;
	String searchWord;
}
