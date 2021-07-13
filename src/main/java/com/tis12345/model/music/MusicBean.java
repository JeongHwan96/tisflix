package com.tis12345.model.music;

import java.util.*;

import org.springframework.stereotype.Component;

import lombok.Data;

//Spring Container에 빈으로 등록하기 위해 @Component annotation달기
@Component
@Data
public class MusicBean {
	private int no;
	private String title;
	private String titleSong;
	private String artist;
	private String review;
	private String choochoo;
	private String releaseDate;
	private String genre;
	private String agency;
	private String musicVideo;
	private String musicVideo2;
	private String contentsImg;
	private String contentsRealImg;
	
}
