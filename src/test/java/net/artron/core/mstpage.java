package net.artron.core;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import net.mars.boot.SpringContextApplication;
import net.mars.boot.SpringContextBeanInitializer;
import net.mars.boot.akka.AkkaApplication;
import net.mars.common.util.http.HttpClientUtil;
import net.mars.core.boot.SpringBeanApplication;

//@RunWith(SpringRunner.class)
//@ContextConfiguration(classes = { AkkaApplication.class, SpringBeanApplication.class,
//		SpringContextBeanInitializer.class, SpringContextApplication.class })
public class mstpage {
	@Test
	public void test() {
		System.out.println("page");
		String url="";
		 url = "http://localhost:8080/artron-photography/pgymanuscript/page?format=json&ignore=false&pageNum=1&pageSize=20"
		+"&name=test&msttype=0&mtGpId=1040422180208246784&channel=0&adid=1040506090543906816"; 
		System.out.println(HttpClientUtil.get(url));
		// 返回空集合,total值为1 应该为0
	}
}
