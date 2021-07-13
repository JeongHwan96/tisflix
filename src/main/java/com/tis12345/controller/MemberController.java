package com.tis12345.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tis12345.model.MemberBean;
import com.tis12345.model.MemberDao;
import com.tis12345.model.SearchCriteria;
import com.tis12345.utils.ScriptWriterUtil;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	//이걸 외부에서 주입받아서 쓰고 싶다.  Spring Container에 등록 해놓고 여기서 땡겨 쓰고 싶다.
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	MemberBean memberBean;
	
	@Autowired
	MemberBean loggedMemberInfo;
	
	@GetMapping("/MemberList.do")
	public String memberList(Model model, SearchCriteria search) {
		//MemberDao memberDao = new MemberDao();
		List<MemberBean> memberList = memberDao.showAllMember(search);
		model.addAttribute("memberList", memberList);
		//logger.info("memberList{}",memberList);
		return "member/member_list";
	}
	
	@GetMapping("/MemberInfo.do")
	public String memberInfo(int no,Model model) {
		memberBean = memberDao.getSelectOneMember(no);
		model.addAttribute("memberBean", memberBean);
		return "member/member_info";
	}
	
	@GetMapping("/MemberUpdateForm.do")
	public String memberUpdateForm(int no,Model model) {
		memberBean = memberDao.getSelectOneMember(no);
		model.addAttribute("memberBean", memberBean);
		return "member/member_update";
	}
	
	@PostMapping("/MemberUpdate.do")
	public String memberUpdate(int no, HttpServletRequest request,HttpServletResponse response) throws IOException {

		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String interest = request.getParameter("interest");
		String age = request.getParameter("age");

		memberBean.setNo(no);
		memberBean.setName(name);
		memberBean.setPassword(password);
		memberBean.setEmail(email);
		memberBean.setPhone(phone);
		memberBean.setInterest(interest);
		memberBean.setAge(age);

		String dbPassword = memberDao.getPasswordMember(no);
		logger.info("dbPassword==={}",dbPassword);
		logger.info("memberBean.getPasswordMember()==={}",memberBean.getPassword());
		
		if (dbPassword.equals(memberBean.getPassword())) {
			int result = memberDao.updateMember(memberBean);
			if(result > 0) {
				logger.info("result==={}",result);
				logger.info("page==={}","member_list");
				ScriptWriterUtil.alertAndNext(response, "회원정보가 변경되었습니다.", "MemberList.do");
				return null;
				
			} else {
				logger.info("page==={}","update");
				ScriptWriterUtil.alertAndBack(response, "회원정보가 변경에 실패하였습니다.");
				return null;
			}
		} else {
			logger.info("page==={}","update");
			ScriptWriterUtil.alertAndBack(response, " 비밀번호를 확인해 주세요.");
			return null;
		}
	}
	
	@GetMapping("/MemberJoinForm.do")
	public String memberJoinForm() {
		return "member/member_join";
	}
	
	@RequestMapping("/MemberJoin.do")
	public String memberJoin(MemberBean memberBean, 
							 HttpServletRequest request, 
							 HttpServletResponse response, 
							 MultipartFile multipartProfileImg) throws IOException {
		
		String context = request.getContextPath(); // 현재 실행중인 context
		String fileRoot = "C:\\miniproject_image\\";
		String originalfileName = multipartProfileImg.getOriginalFilename();
		String extention = FilenameUtils.getExtension(originalfileName); // 파일의 확장자 구하기
		String savedFileName = UUID.randomUUID()+"."+extention;
		logger.info("savedFileName{}", savedFileName);
		File targetFile = new File(fileRoot+savedFileName); //java.io 임포트
		String dbSavedFile = context+"/miniProject/"+savedFileName;
		logger.info("dbSavedFile{}",dbSavedFile);
		
		try {
			InputStream fileStream = multipartProfileImg.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);
			e.printStackTrace();
		}
		memberBean.setProfileImg(dbSavedFile);
		
		int result = memberDao.insertMember(memberBean);
		if (result > 0) {
			ScriptWriterUtil.alertAndNext(response, "회원가입이 완료되었습니다.","ContentsList.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndBack(response, "회원가입에 실패하였습니다.");
			return null;
		}
	}
	
	@GetMapping("/MemberDeleteForm.do")
	public String memberDeleteForm(int no,Model model) {
		memberBean = memberDao.getSelectOneMember(no);
		model.addAttribute("memberBean", memberBean);
		return "member/member_delete";
	}
	
	@RequestMapping("/MemberDelete.do")
	public String memberDelete(int no,Model model, String password,HttpServletResponse response) throws IOException {
		String dbPassword = memberDao.getPasswordMember(no); //db에서 들고온 거
		if(dbPassword.equals(password)){
			int result = memberDao.deleteMember(no);
			if(result>0) {
				ScriptWriterUtil.alertAndNext(response,"회원이 삭제되었습니다.","MemberList.do");
				return null;
			} else {
				ScriptWriterUtil.alertAndBack(response,"회원 삭제에 실패했습니다.");
				return null;
			}
		} else {
			ScriptWriterUtil.alertAndBack(response," 비밀번호를 확인해주세요.");
			return null;
		}
	}
	
	@RequestMapping(value="/MemberIdCheck.do", produces="application/json; charest=UTF-8")
	@ResponseBody //따로 jsp파일을 지정하지 않으면 MemberIdCheck.do 에 json 파일 출력
	public String memberIdCheck(String id, Model model) 
			throws JsonProcessingException {
		//MemberIdCheck
		ObjectMapper objectMapper = new ObjectMapper(); // jackson 라이브러리 jackson은 spring에서 쓰고 있는 json converter
		int result = memberDao.idCheck(id);
		//{"result":12}
		//model.addAttribute("result", result);
		HashMap<String, Integer> hashMap = new HashMap<String, Integer>();
		hashMap.put("result", result);
		String jsonData = objectMapper.writeValueAsString(hashMap);
		logger.info(jsonData);
		return jsonData;
	}
	
	@GetMapping("/MemberLoginForm.do")
	public String memberLoginForm() {
		return "member/member_login";
	}
	
	@PostMapping("/MemberLogin.do")
	public String memberLogin(String id, String password, HttpSession session, HttpServletRequest request, HttpServletResponse response) 
			throws IOException {
		
		session = request.getSession();
		String userId = id;
		
		memberBean.setId(id);
		memberBean.setPassword(password);
		
		loggedMemberInfo = memberDao.getLoginMember(memberBean);
		
		if(loggedMemberInfo != null) {
			//로그인 되었다.
			session.setAttribute("loggedMemberInfo", loggedMemberInfo);
			session.setAttribute("userId", userId); // 아이디를 시즌에 담기.
			ScriptWriterUtil.alertAndNext(response, "로그인 되었습니다.", "ContentsList.do");
		} else {
			//로그인이 실패.
			ScriptWriterUtil.alertAndBack(response, "아이디 비밀번호 확인해 주세요");
		}
		return null;
	}
	
	@GetMapping("/MemberLogOut.do")
	public String memberLogOut(HttpSession session, HttpServletResponse response) 
			throws IOException {
		loggedMemberInfo = (MemberBean)session.getAttribute("loggedMemberInfo");
		if(loggedMemberInfo == null) {
			ScriptWriterUtil.alertAndNext(response, "로그인 해주세요", "MemberLogin.do");
			return null;
		} else {
			ScriptWriterUtil.alertAndNext(response, "로그아웃 되었습니다.", "ContentsList.do");
			session.invalidate();
			return null;
		}
	}
	
	
}



















