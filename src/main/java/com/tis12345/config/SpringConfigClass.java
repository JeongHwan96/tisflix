package com.tis12345.config;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;



//XML 세팅중 web.xml 대신하는 클래스
//public class SpringConfigClass implements WebApplicationInitializer {
//	@Override
//	public void onStartup(ServletContext servletContext) throws ServletException {
//		//SpringWebMvc 프로젝트 설정을 위한 클래스 생성
//		AnnotationConfigWebApplicationContext servletAppContext = new AnnotationConfigWebApplicationContext();
//		servletAppContext.register(ServletAppContext.class);
//		
//		//Dispatcher 세팅
//		DispatcherServlet dispatcherServlet = new DispatcherServlet(servletAppContext);
//		ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispatcherServlet);
//		
//		//들어오는 모든 요청에 대한 매핑
//		servlet.setLoadOnStartup(1);
//		servlet.addMapping("/");
//
//		//Bean 정의하는 class
//		AnnotationConfigWebApplicationContext rootAppContext = new AnnotationConfigWebApplicationContext();
//		rootAppContext.register(RootAppContext.class);
//		
//		//리스너 세팅
//		ContextLoaderListener listener = new ContextLoaderListener(rootAppContext);
//		servletContext.addListener(listener);
//		
//		//인코딩 필터
//		FilterRegistration.Dynamic filter = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
//		filter.setInitParameter("encoding", "UTF-8");
//		filter.addMappingForServletNames(null, false, "dispatcher");
//	}
//}

public class SpringConfigClass extends AbstractAnnotationConfigDispatcherServletInitializer {

	//Bean정의 하는 거 세팅
	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {RootAppContext.class};
	}

	//SpringMvc프로젝트 설정을 위한 class 지정
	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {ServletAppContext.class};
	}

	//DispatcherServlet에서 매핑할 요청주소 세팅
	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}
	
	//한글 꺠짐방지 필터세팅
	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("UTF-8");
		return new Filter[] {encodingFilter};
	}
	
	@Override
	protected void customizeRegistration(Dynamic registration) {
		super.customizeRegistration(registration);
		//업로드 되는 파일 용량 체크 하기...
		MultipartConfigElement config1 = new MultipartConfigElement(null, 1024*1024*100, 1024*1024*1000, 0);
		registration.setMultipartConfig(config1);
	}

}









