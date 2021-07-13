package com.tis12345.model.movie;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class MovieBean {
	private int no;
	private String title;
	private String review;
	private String choochoo;
	private String contentsImg;
	private String contentsRealImg;
	private String director;
	private String actor;
	private String genre;
	private String onoff;
	private String runningtime;
	private String movieVideo;
	private String movieVideo2;
	private String contentsofmovie;
		
}
