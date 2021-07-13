package com.tis12345.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.tis12345.model.SearchCriteria;
import com.tis12345.model.movie.MovieBean;
import com.tis12345.model.movie.MovieDao;
import com.tis12345.model.movie.MovieReplyBean;
import com.tis12345.model.movie.MovieReplyDao;
import com.tis12345.utils.ScriptWriterUtil;

@Controller
public class MovieController {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
	@Autowired
	MovieDao movieDao;
	
	@Autowired
	MovieBean movieBean;
	
	@Autowired
	MovieReplyDao movieReplyDao;
	
	@Autowired
	MovieReplyBean movieReplyBean;
	
	
	
	
	@GetMapping("/MovieWriteForm.do")
	public String movieWriteForm() {
		return "contents/movie/input_movie_form";
	}
	
	
	
	@PostMapping("/MovieWrite.do")
	public String BookWrite(HttpServletRequest request, HttpServletResponse response, MultipartFile multipartFile,
			MovieBean movieBean) throws IOException {
		String context = request.getContextPath(); // 우리가 실행중인 context 이름 구하기
		String fileRoot = "C:\\List_image\\"; // 외부에 저장할 경로
		String originalFileName = multipartFile.getOriginalFilename(); // 진짜 파일명
		String extention = FilenameUtils.getExtension(originalFileName);// 확장자 구하기
		String savedFileName = UUID.randomUUID() + "." + extention; // 중복파일을 올렸을때 겹치는 현상 제거 UUID
		File targetFile = new File(fileRoot + savedFileName);
		String dbFileName = context + "/ListImage/" + savedFileName; // db에 들어갈 이름
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);
			e.printStackTrace();
		}
		
		movieBean.setContentsRealImg(originalFileName); // 진짜 파일 네임..
		movieBean.setContentsImg(dbFileName); // 중복 처리되는 파일 이름을 랜덤하게 구한 거.....
		
		int result = movieDao.insertMovieList(movieBean);
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "등록되었습니다.", "ContentsList.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "등록실패.");
			return null;
		}
	}
	
	@GetMapping("/MovieInfo.do")
	public String movieInfo(MovieReplyBean movieReplyBean, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest request, int no, Model model) {
		int bno = Integer.parseInt(request.getParameter("no")); 
	
		
		String clickedPage = request.getParameter("clickedPage");
		if (clickedPage == null) {
			clickedPage = "1";
		}
		int pagePerCount = 5;
		int total = 0;
		int numbering = 0;
		int currentPage = Integer.parseInt(clickedPage);
		int start = (currentPage - 1) * pagePerCount + 1;
		int end = currentPage * pagePerCount;
		total = movieReplyDao.getTotal(bno);

		int paginationTotal = (int) Math.floor(total / pagePerCount) + 1;
		int pageGroup = 3;
		int startPage = 1;
		numbering = total - (currentPage - 1) * pagePerCount;

		if (currentPage % pageGroup != 0) {
			startPage = (int) (currentPage / pageGroup) * pageGroup + 1;
		} else {
			startPage = ((int) (currentPage / pageGroup) - 1) * pageGroup + 1;
		}
		int endPage = startPage + pageGroup - 1;
		if (endPage > paginationTotal) {
			endPage = paginationTotal;
		}

		

		
		//게시판 조회 메서드
		movieBean = movieDao.getSelectOneMovie(no);
		model.addAttribute("movieBean", movieBean);
		model.addAttribute("scri", scri);
		
		//댓글 불러오기
		List<MovieReplyBean> movieReplyList = movieReplyDao.getAllMovieReplyList(start, end, bno);

		model.addAttribute("movieReplyList",movieReplyList);
		model.addAttribute("numbering", numbering);
		model.addAttribute("paginationTotal", paginationTotal);
		model.addAttribute("pageGroup", pageGroup);
		model.addAttribute("pagePerCount", pagePerCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("total", total);
		model.addAttribute("clickedPage", clickedPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("bno", bno);
		 
		
		
		return "contents/movie/movie_info";
	}
		
	@GetMapping("/MovieUpdateForm.do")
	public String movieUpdateForm(int no, Model model) {
		movieBean = movieDao.getSelectOneMovie(no);
		model.addAttribute("movieBean", movieBean);
		return "contents/movie/movie_update";
	}
	
	@PostMapping("/MovieUpdate.do")
	public String movieUpdate(HttpServletRequest request, HttpServletResponse response, MultipartFile multipartFile) 
			throws IOException {
		
		String title = request.getParameter("title");
		String review = request.getParameter("review");
		String choochoo = request.getParameter("choochoo");
		String contentsofmovie = request.getParameter("contentsofmovie");
		
		movieBean.setTitle(title);
		movieBean.setReview(review);
		movieBean.setChoochoo(choochoo);
		movieBean.setContentsofmovie(contentsofmovie);
		
		System.out.println("title =="+title);
		System.out.println("review =="+review);
		System.out.println("choochoo =="+choochoo);
		System.out.println("contentsofmovie =="+contentsofmovie);
		
		int result = movieDao.updateMovie(movieBean);
		
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "수정 되었습니다.", "ContentsList.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "수정 실패.");
			return null;
		}
	}
	
	
	@GetMapping("/MovieDelete.do")
	   public String movieDelete(int no, Model model, String password, HttpServletResponse response) throws IOException {
		
		int result01 = movieReplyDao.deleteAllMovieReply(no);  
		int result02 = movieDao.deleteMovie(no);
	      if (result02 > 0) {
	         ScriptWriterUtil.alertAndNext(response, "정보가 삭제되었습니다.", "ContentsList.do");
	         return null;
	      } else {
	         ScriptWriterUtil.alertAndBack(response, "삭제에 실패했습니다.");
	         return null;
	      }
	   }
	
	//json 파일 생성되는 곳
	@RequestMapping(value="/MoiveJsonList.do", produces="application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String,List<MovieBean>> movieJsonList() {
		//db에 있는 list 뽑아오기
		//json 리턴
		List<MovieBean> movieList = movieDao.showAllMovie();
		HashMap<String,List<MovieBean>> hashMap = new HashMap<String,List<MovieBean>>();
		hashMap.put("movieList", movieList);
		return hashMap;
	}
	//@ResponseBody 또는 RestController라는 annotaion을 달면...
	//개겣를 리턴했을때 바로 json을 리턴해준다.
	
	
/////////////////////////////////////////////////// 무비인포 댓글 ///////////////////////////////////////////////////////////////
	
	
	//댓글 작성
	@RequestMapping("/MovieReplyWrite.do")
	public String replyWrite(int bno, MovieReplyBean movieReplyBean, HttpServletRequest request, HttpServletResponse response, SearchCriteria scri, RedirectAttributes rttr) 
			throws Exception{
		//System.out.println(bno);
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		movieReplyBean.setWriter(writer);
		movieReplyBean.setContent(content);
		movieReplyBean.setBno(bno);
		
		int result = movieReplyDao.insertMovieReply(movieReplyBean);
		
		if (result > 0) {
			int no = Integer.parseInt(request.getParameter("bno")); 
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			ScriptWriterUtil.alertAndNext(response, "댓글 등록 되었습니다.", "MovieInfo.do?no="+no);
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "댓글 등록 실패.");
			return null;
		}
	}
	
	//replyVO = replyBean
	@GetMapping("/MovieReplyUpdateForm.do")
	public String movieReplyUpdateForm(int rno, Model model) {
		
		System.out.println("rno ===="+ rno);
		
		movieReplyBean = movieReplyDao.getSelectOneMovieReply(rno);
		model.addAttribute("movieReplyBean", movieReplyBean);
		
		System.out.println("2rno=="+movieReplyBean.getRno());
		
		return "contents/movie/reply_update";
	}
	
	//댓글 수정 GET
	@RequestMapping("/MovieReplyUpdate.do")
	public String replyUpdate(int rno, HttpServletRequest request, HttpServletResponse response, MovieReplyBean movieReplyBean
			) throws IOException {
		
		logger.info("reply write");
		
		movieReplyDao.updateMovieReply(movieReplyBean);
		
		movieReplyBean = movieReplyDao.getSelectOneMovieReply(rno);
		String content = request.getParameter("content");
		
		movieReplyBean.setContent(content);
		int result = movieReplyDao.updateMovieReply(movieReplyBean);
		
		System.out.println("no=="+ movieReplyBean.getBno());
		System.out.println("rno=="+ movieReplyBean.getRno());
		
		if (result > 0) {
			int no = movieReplyBean.getBno(); 
			ScriptWriterUtil.alertAndNext(response, "댓글 수정 되었습니다.", "MovieInfo.do?no="+no);
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "수정 실패.");
			return null;
		}
	}
	
	@GetMapping("/MovieReplyDelete.do")
	   public String movieReplyDelete(int rno, int no, HttpServletRequest request , HttpServletResponse response) 
			   throws IOException {
		
	      System.out.println("no는 ==="+no);
	      int result = movieReplyDao.deleteMovieReply(rno);

	      if (result > 0) {
	         ScriptWriterUtil.alertAndNext(response, "댓글이 삭제되었습니다.", "MovieInfo.do?no="+no);
	         return null;
	      } else {
	         ScriptWriterUtil.alertAndBack(response, "댓글 삭제에 실패했습니다.");
	         return null;
	      }
	   }
}
