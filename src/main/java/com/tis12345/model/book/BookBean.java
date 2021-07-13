package com.tis12345.model.book;

import org.springframework.stereotype.Component;

import lombok.Data;

//Spring Container에 빈으로 등록하기 위해 @Component annotation달기
@Component
@Data
public class BookBean {
	private int no;
	private String title;
	private String writer;
	private String publisher;
	private String genre;
	private String contentsofbook;
	private String category;
	private String contentsImg;
	private String contentsRealImg;
	private String review;
	private String choochoo;

}
