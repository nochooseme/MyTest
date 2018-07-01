package com.shuyue.book.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan("com.shuyue.book.*")
@EnableWebMvc
public class WebConfig {
	@Bean(name="viewResolver")
	public ViewResolver initViewResolver() {
		InternalResourceViewResolver viewResolver=new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/page/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	@Bean(name="multipartResolver")
	public MultipartResolver initMultipartResolver() {
		return new StandardServletMultipartResolver();
	}
}

