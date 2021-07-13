package com.tis12345.model.book;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;


//Spring Container에 빈으로 등록하기 위해 @Component annotation달기////

@Component
public class BookDao {
	//db접속.....
	private static SqlSessionFactory sqlSessionFactory;
	//커넥션풀.......
	static {
		try {
			String resource = "com/tis12345/mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertBookList(BookBean bookBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertBookList",bookBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
		//result 1이면 제대로 입력되었다.... 0이면 입력실패....
	}
	
	public List<BookBean> showAllBook(){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BookBean> bookList = sqlSession.selectList("showAllBook");
		sqlSession.close();
		return bookList;
	}
	
	
	
	public BookBean getSelectOneBook(int no) {
		BookBean bookBean = new BookBean();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		bookBean = sqlSession.selectOne("getSelectOneBook",no);
		sqlSession.close();
		return bookBean;
	}
	
	public int updateBook(BookBean bookBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updateBook", bookBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int deleteBook(int no) {
		int result = 0;
		System.out.println(no);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("deleteBook", no);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
}








