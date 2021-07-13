package com.tis12345.model.movie;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

//Spring Container에 빈으로 등록하기 위해 @Component annotation달기
@Component
@Data
public class MovieReplyBean {
	private int bno;
	private int rno;
	private String content;
	private String writer;
	private Date regDate;
	private String profileImg;
	
}
