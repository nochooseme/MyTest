package com.shuyue.book.config;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class MyWebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class<?>[] {};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		// TODO Auto-generated method stub
		return new Class<?>[] {WebConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		// TODO Auto-generated method stub
		return new String[] {"/"};
	}	
	@Override
	protected void customizeRegistration(Dynamic dynamic)                                                                                                                                                                                                                                                                                                                                                                                                {
		String filepath="D:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps\\shuyue\\static\\images";
		Long singleMax=(long) (5*Math.pow(2, 20));
		Long totalMax=(long) (10*Math.pow(2, 20));
		dynamic.setMultipartConfig(new MultipartConfigElement(filepath, singleMax, totalMax, 0));
	}

}
