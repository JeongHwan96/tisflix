package com.tis12345.model.movie;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

@Component
public class MovieDao {
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
	
	public int insertMovieList(MovieBean movieBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertMovieList",movieBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public List<MovieBean> showAllMovie(){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<MovieBean> movieList = sqlSession.selectList("showAllMovie");
		sqlSession.close();
		return movieList;
	}
	
	public MovieBean getSelectOneMovie(int no) {
		MovieBean movieBean = new MovieBean();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		movieBean = sqlSession.selectOne("getSelectOneMovie",no);
		sqlSession.close();
		return movieBean;
	}
	
	public int updateMovie(MovieBean movieBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updateMovie", movieBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int deleteMovie(int no) {
		int result = 0;
		System.out.println(no);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("deleteMovie", no);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}

}
