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
import com.tis12345.model.music.MusicBean;
import com.tis12345.model.music.MusicDao;
import com.tis12345.model.music.MusicReplyBean;
import com.tis12345.model.music.MusicReplyDao;
import com.tis12345.utils.ScriptWriterUtil;

@Controller
public class MusicController {
	private static final Logger logger = LoggerFactory.getLogger(MusicController.class);

	// Spring Container에 있는 Beand을 가져다 쓰겠다. injection(주입)
	@Autowired
	MusicDao musicDao;

	@Autowired
	MusicBean musicBean;
	
	@Autowired
	MusicReplyDao musicReplyDao;
	
	@Autowired
	MusicReplyBean musicReplyBean;

	@GetMapping("/MusicWriteForm.do")
	public String BoardWriteForm() {
		return "contents/music/input_music_form";
	}
	
	@PostMapping("/MusicWrite.do")
	public String BookWrite(HttpServletRequest request, HttpServletResponse response, MultipartFile multipartFile,
			MusicBean musicBean) throws IOException {
		String context = request.getContextPath(); // 우리가 실행중인 context 이름 구하기
		String fileRoot = "C:\\List_image\\"; // 외부에 저장할 경로
		String originalFileName = multipartFile.getOriginalFilename(); // 진짜 파일명
		String extention = FilenameUtils.getExtension(originalFileName);// 확장자 구하기
		String savedFileName = UUID.randomUUID() + "." + extention; // 중복파일을 올렸을때 겹치는 현상 제거 UUID
		File targetFile = new File(fileRoot + savedFileName);
		String dbFileName = context + "/ListImage/" + savedFileName; // db에 들어갈 이름
		// 매핑 경로에 /BoardImage이게 들어오면....
		logger.info("savedFileName==={}", savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);
			e.printStackTrace();
		}
		
		musicBean.setContentsRealImg(originalFileName); // 진짜 파일 네임..
		musicBean.setContentsImg(dbFileName); // 중복 처리되는 파일 이름을 랜덤하게 구한 거.....
		
		int result = musicDao.insertMusicList(musicBean);
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "등록되었습니다.", "ContentsList.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "등록실패.");
			return null;
		}
	}

	@GetMapping("/MusicInfo.do")
	public String musicInfo(MusicReplyBean musicReplyBean, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest request, int no, Model model) {
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
		total = musicReplyDao.getTotal(bno);

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
		musicBean = musicDao.getSelectOneMusic(no);
		model.addAttribute("musicBean", musicBean);
		model.addAttribute("scri", scri);
		
		//댓글 불러오기
		List<MusicReplyBean> musicReplyList = musicReplyDao.getAllMusicReplyList(start, end, bno);

		model.addAttribute("musicReplyList",musicReplyList);
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
		 
		
		
		return "contents/music/music_info";
	}

	@GetMapping("/MusicUpdateForm.do")
	public String MusicUpdateForm(int no, Model model) {
		musicBean = musicDao.getSelectOneMusic(no);
		model.addAttribute("musicBean", musicBean);
		return "contents/music/music_update";
	}
	
	@PostMapping("/MusicUpdate.do")
	public String ContentsWrite(HttpServletRequest request, HttpServletResponse response, MultipartFile multipartFile,
			MusicBean musicBean) throws IOException {
		
		int result = musicDao.updateMusic(musicBean);
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "수정 되었습니다.", "ContentsList.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "수정 실패.");
			return null;
		}
	}
	
	
	@GetMapping("/MusicDelete.do")
	   public String contentsDelete(int no, Model model, String password, HttpServletResponse response) throws IOException {
	      
		int result01 = musicReplyDao.deleteAllMusicReply(no);
		int result02 = musicDao.deleteMusic(no);
	      if (result02 > 0) {
	         ScriptWriterUtil.alertAndNext(response, "정보가 삭제되었습니다.", "ContentsList.do");
	         return null;
	      } else {
	         ScriptWriterUtil.alertAndBack(response, "삭제에 실패했습니다.");
	         return null;
	      }
	   }
	
	//json 파일 생성되는 곳
	@RequestMapping(value="/MusicJsonList.do", produces="application/json;charset=UTF-8")
	@ResponseBody
	public HashMap<String,List<MusicBean>> musicJsonList() {
		//db에 있는 list 뽑아오기
		//json 리턴
		List<MusicBean> musicList = musicDao.showAllMusic();
		HashMap<String,List<MusicBean>> hashMap = new HashMap<String,List<MusicBean>>();
		hashMap.put("musicList", musicList);
		return hashMap;
	}
	//@ResponseBody 또는 RestController라는 annotaion을 달면...
	//개겣를 리턴했을때 바로 json을 리턴해준다.
	
	
	
	
/////////////////////////////////////////////////// 뮤직인포 댓글 ///////////////////////////////////////////////////////////////
	
	
	//댓글 작성
	@RequestMapping("/MusicReplyWrite.do")
	public String replyWrite(int bno, MusicReplyBean musicReplyBean, HttpServletRequest request, HttpServletResponse response, SearchCriteria scri, RedirectAttributes rttr)
	throws Exception {
		//System.out.println(bno);
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
	
		musicReplyBean.setWriter(writer);
		musicReplyBean.setContent(content);
		musicReplyBean.setBno(bno);
	
		int result = musicReplyDao.insertMusicReply(musicReplyBean);
	
		if (result > 0) {
			int no = Integer.parseInt(request.getParameter("bno"));
			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
			ScriptWriterUtil.alertAndNext(response, "댓글 등록 되었습니다.", "MusicInfo.do?no=" + no);
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "댓글 등록 실패.");
			return null;
		}
	}
	
	//replyVO = replyBean
	
	
	@GetMapping("/MusicReplyUpdateForm.do")
	public String musicReplyUpdateForm(int rno, Model model) {
	
		System.out.println("rno ====" + rno);
		
		musicReplyBean = musicReplyDao.getSelectOneMusicReply(rno);
		model.addAttribute("musicReplyBean", musicReplyBean);
	
		System.out.println("2rno=="+musicReplyBean.getRno());
		
		return "contents/music/reply_update";
	}
	
	//댓글 수정 GET
	@RequestMapping("/MusicReplyUpdate.do")
	public String replyUpdate(int rno, HttpServletRequest request, HttpServletResponse response, MusicReplyBean musicReplyBean) throws IOException {
	
		logger.info("reply write");
	
		musicReplyDao.updateMusicReply(musicReplyBean);
	
		musicReplyBean = musicReplyDao.getSelectOneMusicReply(rno);
		String content = request.getParameter("content");
	
		musicReplyBean.setContent(content);
		int result = musicReplyDao.updateMusicReply(musicReplyBean);
	
		System.out.println("no==" + musicReplyBean.getBno());
		System.out.println("rno==" + musicReplyBean.getRno());
	
		if (result > 0) {
			int no = musicReplyBean.getBno(); 
			ScriptWriterUtil.alertAndNext(response, "댓글 수정 되었습니다.", "MusicInfo.do?no="+no);
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "수정 실패.");
			return null;
		}
	}
	
	//댓글 삭제
	@GetMapping("/MusicReplyDelete.do")
	public String MusicReplyDelete(int rno, int no, HttpServletRequest request, HttpServletResponse response)
	throws IOException {
		
	      System.out.println("no는 ==="+no);
		int result = musicReplyDao.deleteMusicReply(rno);
		
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "댓글이 삭제되었습니다.", "MusicInfo.do?no="+no);
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "댓글 삭제에 실패했습니다.");
			return null;
		}
	}
	
	
	
	
	
	
	
}
