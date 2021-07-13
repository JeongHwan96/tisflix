package com.tis12345.model.music;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import com.tis12345.model.music.MusicBean;

//Spring Container에 빈으로 등록하기 위해 @Component annotation달기////

@Component
public class MusicDao {
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
	
	public int insertMusicList(MusicBean musicBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.insert("insertMusicList",musicBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
		//result 1이면 제대로 입력되었다.... 0이면 입력실패....
	}

	public List<MusicBean> showAllMusic(){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<MusicBean> musicList = sqlSession.selectList("showAllMusic");
		sqlSession.close();
		return musicList;
	}
	
	public MusicBean getSelectOneMusic(int no) {
		MusicBean musicBean = new MusicBean();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		musicBean = sqlSession.selectOne("getSelectOneMusic",no);
		sqlSession.close();
		return musicBean;
	}
	
	public int updateMusic(MusicBean musicBean) {
		int result = 0;
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.update("updateMusic", musicBean);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
	public int deleteMusic(int no) {
		int result = 0;
		System.out.println(no);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		result = sqlSession.delete("deleteMusic", no);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}
	
}








