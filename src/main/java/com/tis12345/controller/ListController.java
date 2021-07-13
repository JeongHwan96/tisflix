package com.tis12345.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tis12345.model.book.BookBean;
import com.tis12345.model.book.BookDao;
import com.tis12345.model.movie.MovieBean;
import com.tis12345.model.movie.MovieDao;
import com.tis12345.model.music.MusicBean;
import com.tis12345.model.music.MusicDao;

@Controller
public class ListController {

	private static final Logger logger = LoggerFactory.getLogger(ListController.class);

	// Spring Container에 있는 Beand을 가져다 쓰겠다. injection(주입)
	
	@Autowired
	BookDao bookDao;
	
	@Autowired
	BookBean bookBean;
	
	@Autowired
	MovieDao movieDao;
	
	@Autowired
	MovieBean movieBean;
	
	@Autowired
	MusicDao musicDao;
	
	@Autowired
	MusicBean musicBean;
	


	@GetMapping("/ContentsList.do")
	public String contentsList(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		System.out.println(userId);

		List<BookBean> bookList = bookDao.showAllBook();
		model.addAttribute("bookList", bookList);
		
		List<MovieBean> movieList = movieDao.showAllMovie();
		model.addAttribute("movieList", movieList);
		
		List<MusicBean> musicList = musicDao.showAllMusic();
		model.addAttribute("musicList", musicList);

		return "contents/contents_list";
	}
	
	

//	//json 파일 생성되는 곳
//	@RequestMapping(value="/ContentsJsonList.do", produces="application/json;charset=UTF-8")
//	@ResponseBody
//	public HashMap<String,List<ListBean>> contentsJsonList() {
//		//db에 있는 list 뽑아오기
//		//json 리턴
//		List<ListBean> contentsList = listDao.showAllBook();
//		HashMap<String,List<ListBean>> hashMap = new HashMap<String,List<ListBean>>();
//		hashMap.put("contentsList", contentsList);
//		return hashMap;
//	}
//	//@ResponseBody 또는 RestController라는 annotaion을 달면...
//	//개겣를 리턴했을때 바로 json을 리턴해준다.

}
