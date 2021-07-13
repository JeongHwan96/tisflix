package com.tis12345.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
@EnableWebMvc
@ComponentScan("com.tis12345.controller")
@ComponentScan("com.tis12345.model")
public class ServletAppContext implements WebMvcConfigurer {
	//viewResolver
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/",".jsp");
	}
	//정적 파일 세팅
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
		registry.addResourceHandler("/summernoteImage/**").addResourceLocations("file:///C:/summernote/");
		registry.addResourceHandler("/miniProject/**").addResourceLocations("file:///C:/miniproject_image/");
		registry.addResourceHandler("/ListImage/**").addResourceLocations("file:///C:/list_image/");
	}
	
	@Bean
	public StandardServletMultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver();
	}
}





