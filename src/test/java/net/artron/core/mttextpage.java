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

@RunWith(SpringRunner.class)
@ContextConfiguration(classes = { AkkaApplication.class, SpringBeanApplication.class,
		SpringContextBeanInitializer.class, SpringContextApplication.class })
public class mttextpage {
	@Test
	public void page() {
		System.out.println("page");
		String url = "http://localhost:8080/artron-photography/pgymttext/page?format=json&ignore=false&version=0&pageNum=1&pageSize=20&textcontent=00000";
//		String url = "http://localhost:8080/artron-photography/pgymttext/page?format=json&ignore=false&version=0";
		System.out.println(HttpClientUtil.get(url));
		// 返回空集合,total值为1 应该为0
	}

}
