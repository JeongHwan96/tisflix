package com.tis12345.model.book;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;


@Component
public class BookReplyDao {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			String resource = "com/tis12345/mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getMaxRef() {
		int max = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		max = sqlSession.selectOne("bookGetMaxRef");
		sqlSession.close();
		return max;
	}
	
	public int getTotal(int bno) {
		int total = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		total = sqlSession.selectOne("bookGetTotal",bno);
		sqlSession.close();
		return total;
	}
	
	
	
	//전체 게시글
		public List<BookReplyBean> getAllBookReplyList(int start, int end, int bno) {
			Map<String,Integer> page = new HashMap<String,Integer>();
			page.put("start", start);
			page.put("end", end);
			page.put("bno", bno);
			System.out.println(page);
			
			//넘어오는 매개변수는 2개, sqlSession.selectList("getAllBoard", page); 넘길 수 있는 있는 건 id를 제외한 하나
			//그래서 하나의 변수에 여러개를 담을 수 있는 HashMap을 이용해서 여러개의 데이터를 담고 이를 넘긴 
			SqlSession sqlSession = sqlSessionFactory.openSession();
			List<BookReplyBean> bookReplyList = sqlSession.selectList("getAllBookReplyList", page);
			sqlSession.close();
			return bookReplyList;
		}

	//댓글 조회
	public List<BookReplyBean> readBookReply(int bno){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BookReplyBean> bookReplyList = sqlSession.selectList("readBookReply", bno);
		sqlSession.close();
		return bookReplyList;
	}
	
	//댓글 작성
	public int insertBookReply(BookReplyBean bookReplyBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertBookReply", bookReplyBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
		//result 1이면 제대로 입력되었다.... 0이면 입력실패....
	}
	
	//댓글 수정
	public int updateBookReply(BookReplyBean bookReplyBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updateBookReply", bookReplyBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	//댓글 삭제
	public int deleteBookReply(int rno) {
		int result = 0;
		System.out.println(rno);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("deleteBookReply", rno);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	//댓글 전체 삭제
	public int deleteAllBookReply(int bno) {
		int result = 0;
		System.out.println(bno);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("deleteAllBookReply", bno);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	//선택된 댓글 조회
	public BookReplyBean getSelectOneBookReply(int rno) {
		BookReplyBean bookReplyBean = new BookReplyBean();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		bookReplyBean = sqlSession.selectOne("getSelectOneBookReply", rno);
		sqlSession.close();
		return bookReplyBean;
	}
	
}
