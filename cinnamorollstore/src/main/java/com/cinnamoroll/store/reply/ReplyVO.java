package com.cinnamoroll.store.reply;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyVO {
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	int reply_number;
	
	//Date regdate;
	String regdate;
	
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	int board_number;
	String user_id;
	String content;
	
	// user정보
	String user_name;
}
