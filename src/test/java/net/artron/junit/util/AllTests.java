package net.artron.junit.util;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import akka.Main;
import net.mars.boot.SpringContextApplication;
import net.mars.boot.SpringContextBeanInitializer;
import net.mars.boot.akka.AkkaApplication;
import net.mars.common.util.http.HttpClientUtil;
import net.mars.core.ApplicationUtil;
import net.mars.core.boot.SpringBeanApplication;

//@RunWith(Suite.class)
//@SuiteClasses({})
@RunWith(SpringRunner.class)
@ContextConfiguration(classes = { AkkaApplication.class, SpringBeanApplication.class,SpringContextBeanInitializer.class, SpringContextApplication.class })
public class AllTests {

	@Test
	public void biz_vew_page_cnf(){
//		System.out.println("cc");
//		String url="http://localhost:8080/artron-photography/pgymttext/query?format=json&ignore=false&version=0";
//		System.out.println( HttpClientUtil.get(url));
		

	}
	
	@Test
	public void redis(HttpServletRequest request){
		String name = ApplicationUtil.getLoginUserName(request);
		
	}
}
